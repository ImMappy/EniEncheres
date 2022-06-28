package fr.eni.eniencheres.ihm;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/eniencheres", ""})
public class EncheresServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);
    }

    public void destroy() {
    }
}