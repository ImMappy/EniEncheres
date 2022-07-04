package fr.eni.eniencheres.ihm;
import fr.eni.eniencheres.bll.*;
import fr.eni.eniencheres.bo.ArticleVendu;
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
    public ArticleServlet(){
        articleVenduManager = FactoryBLL.getArticleVenduManager();
        retraitManager =    FactoryBLL.getRetraitManager();
        utilisateursManager = FactoryBLL.getUtilisateursManager();
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
        ArticleVendu articleVendu;
        Retrait retrait= null;
        Utilisateurs user;
        try{
            articleVendu = articleVenduManager.selectById(id);
            retrait = retraitManager.selectRetrait(id);
            user = utilisateursManager.getPseudo(id);
            session = req.getSession();
            session.setAttribute("retrait",retrait);
            session.setAttribute("article",articleVendu);
            session.setAttribute("userPseudo",user);
            resp.sendRedirect(req.getContextPath() + "/articleDetail");
        }catch (BLLException e){
            e.printStackTrace();
        }
    }
}