package fr.eni.eniencheres.ihm;

import fr.eni.eniencheres.bll.ArticleVenduManager;
import fr.eni.eniencheres.bll.BLLException;
import fr.eni.eniencheres.bll.CategoriesManager;
import fr.eni.eniencheres.bo.Categories;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet({"/eniencheres",""})
public class EncheresServlet extends HttpServlet {
    private ArticleVenduManager articleVenduManager;
    private EncheresFactory encheresFactory;

    @Override
    public void init() throws ServletException {
       articleVenduManager = EncheresFactory.getArticleVenduManager();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            request.setAttribute("article",articleVenduManager.selectAll());
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

        } catch (BLLException e) {
            e.printStackTrace();
        }
    }


}
