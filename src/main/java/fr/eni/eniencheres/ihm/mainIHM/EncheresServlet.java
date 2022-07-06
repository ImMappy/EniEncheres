package fr.eni.eniencheres.ihm.mainIHM;


import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManager;
import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.CategoriesBLL.CategoriesManager;
import fr.eni.eniencheres.bll.FactoryBLL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/eniencheres",""})
public class EncheresServlet extends HttpServlet {
    private ArticleVenduManager articleVenduManager;
    private CategoriesManager categoriesManager;
    HttpSession session;

    public EncheresServlet (){
        articleVenduManager = FactoryBLL.getArticleVenduManager();
        categoriesManager = FactoryBLL.getCategoriesManager();

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            session = request.getSession();
            session.setAttribute("categorie",categoriesManager.getAllCategories());
            session.setAttribute("article",articleVenduManager.selectAll());
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

        } catch (BLLException e) {
            e.printStackTrace();
        }
    }

}
