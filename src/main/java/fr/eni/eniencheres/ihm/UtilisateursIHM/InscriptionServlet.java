package fr.eni.eniencheres.ihm.UtilisateursIHM;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManager;
import fr.eni.eniencheres.bo.Utilisateurs;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/inscription"})
public class InscriptionServlet extends HttpServlet {

    private boolean passwordAllowed;
    private final UtilisateursManager utilisateursManager;

    public InscriptionServlet(){
        utilisateursManager = FactoryBLL.getUtilisateursManager();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/connexion.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Récupération Paramètres Formulaire Inscription
        Utilisateurs newUser = new Utilisateurs(
                request.getParameter("registerPseudo"),
                request.getParameter("registerPrenom"),
                request.getParameter("registerNom"),
                request.getParameter("registerTelephone"),
                request.getParameter("registerEmail"),
                request.getParameter("registerPassword"),
                request.getParameter("registerCodePostal"),
                request.getParameter("registerVille"),
                request.getParameter("registerRue"));

        // Si Password = Password 2 alors on AJOUTE un Utilisateur
        if (request.getParameter("registerPassword").equals(request.getParameter("registerPassword2"))) {
            try {
                utilisateursManager.ajouterUtilisateur(newUser);
            } catch (BLLException e) {
                e.printStackTrace();
            }
            passwordAllowed = false;
            this.getServletContext().setAttribute("errorPassword", passwordAllowed);
            response.sendRedirect(request.getContextPath() + "/connexion");
        } else {
            passwordAllowed = true;
            this.getServletContext().setAttribute("errorPassword", passwordAllowed);
            response.sendRedirect(request.getContextPath() + "/#pills-register");
        }
    }
}
