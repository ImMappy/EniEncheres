package fr.eni.eniencheres.ihm.UtilisateursIHM;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManager;
import fr.eni.eniencheres.bo.Utilisateurs;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/profilServlet")
public class ProfilUtilisateurServlet extends HttpServlet {
    private UtilisateursManager utilisateursManager;
    private HttpSession session;
    public ProfilUtilisateurServlet(){
        utilisateursManager = FactoryBLL.getUtilisateursManager();
    }
    private Utilisateurs user;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action =req.getParameter("action");
        if("supprimer".equals(action)){
            doDelete(req,resp);
            return;
        }

        req.getRequestDispatcher("/WEB-INF/monProfil.jsp").forward(req,resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("noUtilisateur"));
        try{
            utilisateursManager.supprimerUtilisateur(id);
            session = req.getSession();
            session.invalidate();
            this.getServletContext().setAttribute("isAllowed", false);

        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/eniencheres");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            user = utilisateursManager.getUtilisateurById(Integer.parseInt(req.getParameter("noUtilisateur")));
        } catch (BLLException e) {
            e.printStackTrace();
        }
        user = new Utilisateurs(Integer.parseInt(req.getParameter("noUtilisateur")),req.getParameter("profilPseudo"),req.getParameter("profilNom"),req.getParameter("profilPrenom"),req.getParameter("profilEmail"),req.getParameter("profilTelephone"),req.getParameter("profilRue"),req.getParameter("profilCodePostal"),req.getParameter("profilVille"),req.getParameter("profilPassword"),Integer.parseInt(req.getParameter("profilCredit")));
        try {
            utilisateursManager.modifierUtilisateur(user);
            session = req.getSession();
            session.setAttribute("user",user);
            this.getServletContext().setAttribute("user",user);
            resp.sendRedirect(req.getContextPath() + "/eniencheres");
        } catch (BLLException e) {
            e.printStackTrace();
        }

    }


}
