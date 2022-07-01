package fr.eni.eniencheres.ihm;


import fr.eni.eniencheres.bll.CategoriesManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/eniencheres",""})
public class EncheresServlet extends HttpServlet {
    private CategoriesManager categoriesManager;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
    }


}
