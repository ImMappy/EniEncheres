package fr.eni.eniencheres.ihm.mainIHM;


import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManager;
import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/eniencheres",""})
public class EncheresServlet extends HttpServlet {
    private ArticleVenduManager articleVenduManager;
    HttpSession session;

    public EncheresServlet (){
        articleVenduManager = FactoryBLL.getArticleVenduManager();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        try {
            session = request.getSession();
            session.setAttribute("article",articleVenduManager.selectAll());
            request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);

        } catch (BLLException e) {
            e.printStackTrace();
        }
    }


}
