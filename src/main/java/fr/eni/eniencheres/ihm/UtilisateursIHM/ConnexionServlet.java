package fr.eni.eniencheres.ihm.UtilisateursIHM;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManager;
import fr.eni.eniencheres.bo.Utilisateurs;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet({"/connexion"})
public class ConnexionServlet extends HttpServlet {

    private final UtilisateursManager utilisateursManager;

    HttpSession session;

    public ConnexionServlet(){
        utilisateursManager = FactoryBLL.getUtilisateursManager();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        session = request.getSession();

        // ?action=deconnexion
        String action=request.getParameter("action");
        if ("deconnexion".equals(action)) {
            doDeconnexion(request, response);
            return;
        }

        request.getRequestDispatcher("/WEB-INF/connexion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        Utilisateurs user;

        try {
            user = utilisateursManager.getUser(req.getParameter("pseudo"), req.getParameter("password"));
            if(user != null){

                session.setAttribute("user", user);

                this.getServletContext().setAttribute("isAllowed", true);
                this.getServletContext().setAttribute("isNotAllowed", false);
                this.getServletContext().setAttribute("errorPassword", false);
                resp.sendRedirect(req.getContextPath() + "/eniencheres");
            } else {
                req.setAttribute("isAllowed", false);
                this.getServletContext().setAttribute("isNotAllowed", true);
                resp.sendRedirect(req.getContextPath() + "/connexion");
            }
        } catch (BLLException e) {
            throw new RuntimeException(e);
        }

    }

    protected void doDeconnexion(HttpServletRequest req, HttpServletResponse resp) throws IOException {
                session.invalidate();

                this.getServletContext().setAttribute("isAllowed", false);

                resp.sendRedirect(req.getContextPath() + "/connexion");

    }

}