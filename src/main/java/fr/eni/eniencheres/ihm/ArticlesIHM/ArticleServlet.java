package fr.eni.eniencheres.ihm.ArticlesIHM;

import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManager;
import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.EnchereBLL.EnchereManager;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bll.RetraitBLL.RetraitManager;
import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManager;
import fr.eni.eniencheres.bo.ArticleVendu;
import fr.eni.eniencheres.bo.Enchere;
import fr.eni.eniencheres.bo.Retrait;
import fr.eni.eniencheres.bo.Utilisateurs;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/articleDetail")
public class ArticleServlet extends HttpServlet {
    private ArticleVenduManager articleVenduManager;
    private RetraitManager retraitManager;
    private UtilisateursManager utilisateursManager;
    private ArticleVendu articleVendu;
    private Enchere enchere;
    private EnchereManager enchereManager;
    public ArticleServlet(){
        articleVenduManager = FactoryBLL.getArticleVenduManager();
        retraitManager =    FactoryBLL.getRetraitManager();
        utilisateursManager = FactoryBLL.getUtilisateursManager();
        enchereManager = FactoryBLL.getEnchereManager();
    }
    HttpSession session;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if("getDetail".equals(action)){
            try {
                getDetail(request,response);
                return;
            } catch (BLLException e) {
                e.printStackTrace();
            }
        }

        request.getRequestDispatcher("/WEB-INF/articleDetail.jsp").forward(request,response);

    }


    protected void getDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, BLLException {
        int id = Integer.parseInt(req.getParameter("noArticle"));
        Retrait retrait= null;
        Utilisateurs user;


        try{
            articleVendu = articleVenduManager.selectById(id);
            enchere = enchereManager.getMontant(id);
            retrait = retraitManager.selectRetrait(id);
            user = utilisateursManager.getPseudo(id);
            session = req.getSession();
            session.setAttribute("retrait",retrait);
            session.setAttribute("article",articleVendu);
            session.setAttribute("enchere",enchere);
            session.setAttribute("userPseudo",user);


            resp.sendRedirect(req.getContextPath() + "/articleDetail");
        }catch (BLLException e){
            e.printStackTrace();
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int credit = Integer.parseInt(req.getParameter("creditEnchere"));

        try{
            enchere = new Enchere(articleVendu.getDateFinEncheres(),credit,articleVendu.getNoArticle(), articleVendu.getNoUtilisateur());
            enchereManager.ajoutEnchere(enchere);
            resp.sendRedirect(req.getContextPath() + "/articleDetail");
        }catch (BLLException e){
            e.printStackTrace();
        }



    }
}
