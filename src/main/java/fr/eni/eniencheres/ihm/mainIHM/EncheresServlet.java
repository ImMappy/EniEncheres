package fr.eni.eniencheres.ihm.mainIHM;


import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManager;
import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.CategoriesBLL.CategoriesManager;
import fr.eni.eniencheres.bll.EnchereBLL.EnchereManager;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bo.ArticleVendu;
import fr.eni.eniencheres.bo.Enchere;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/eniencheres",""})
public class EncheresServlet extends HttpServlet {
    private ArticleVenduManager articleVenduManager;
    private CategoriesManager categoriesManager;
    private EnchereManager enchereManager;
    private Enchere enchere;
    HttpSession session;

    public EncheresServlet (){
        articleVenduManager = FactoryBLL.getArticleVenduManager();
        categoriesManager = FactoryBLL.getCategoriesManager();
        enchereManager = FactoryBLL.getEnchereManager();

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            session = request.getSession();
            List<ArticleVendu> articleVendus = articleVenduManager.selectAll();
            session.setAttribute("article",articleVendus);
            for(ArticleVendu art : articleVendus){
                session.setAttribute("enchere",enchereManager.selectEnchereId(art.getNoArticle()));

            }
            session.setAttribute("categorie",categoriesManager.getAllCategories());
            session.setAttribute("article",articleVenduManager.selectAll());
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

        } catch (BLLException e) {
            e.printStackTrace();
        }
    }

}
