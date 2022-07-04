package fr.eni.eniencheres.ihm;

import fr.eni.eniencheres.bll.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bll.UtilisateursManager;
import fr.eni.eniencheres.bo.Utilisateurs;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/profilServlet")
public class ProfilUtilisateurServlet extends HttpServlet {

    HttpSession session;
    private UtilisateursManager utilisateursManager;
    public ProfilUtilisateurServlet(){
        utilisateursManager = FactoryBLL.getUtilisateursManager();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // ?action=supprimer
        String action =req.getParameter("action");
        if("supprimer".equals(action)){
            doDelete(req,resp);
            return;
        }

        req.getRequestDispatcher("/WEB-INF/monProfil.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        Utilisateurs user;
        user =new Utilisateurs(req.getParameter("profilPseudo"),
                req.getParameter("profilNom"),
                req.getParameter("profilPrenom"),
                req.getParameter("profilEmail"),
                req.getParameter("profilTelephone"),
                req.getParameter("profilRue"),
                req.getParameter("profilCodePostal"),
                req.getParameter("profilVille"),
                req.getParameter("profilMotDePasse"));
                req.getParameter("noUtilisateur").isEmpty();

        Integer id = Integer.parseInt(req.getParameter("noUtilisateur"));

        try {
            utilisateursManager.ajouterUtilisateur(user);

        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/connexion");

    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("noUtilisateur"));

        try{
            utilisateursManager.supprimerUtilisateur(id);
            session = req.getSession();
            session.invalidate();
            this.getServletContext().setAttribute("isAllowed", false);
        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/connexion");
    }


}
