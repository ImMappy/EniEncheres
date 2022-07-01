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
    private UtilisateursManager utilisateursManager;
    public ProfilUtilisateurServlet(){
        utilisateursManager = FactoryBLL.getUtilisateursManager();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("supprimer") !=null){
            doDelete(req,resp);
            return;
        }
//        if(req.getParameter("modifier") != null){
//            doUpdate(req,resp);
//            return;
//        }

        req.getRequestDispatcher("/WEB-INF/monProfil.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        Utilisateurs user;
        user =new Utilisateurs(req.getParameter("registerPseudo"),
                req.getParameter("registerNom"),
                req.getParameter("registerPrenom"),
                req.getParameter("registerEmail"),
                req.getParameter("registerTelephone"),
                req.getParameter("registerRue"),
                req.getParameter("registerCodePostal"),
                req.getParameter("registerVille"),
                req.getParameter("registerMotDePasse"));

        Integer id = Integer.parseInt(req.getParameter("noUtilisateur"));

        req.getParameter("noUtilisateur").isEmpty();
        try {
            utilisateursManager.ajouterUtilisateur(user);

        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/eniencheres");

    }


//    protected void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//        Integer id = Integer.parseInt(req.getParameter("noUtilisateur"));
//        Utilisateurs user = null;
//
//        try {
//            user = utilisateursManager.getUtilisateurById(id);
//        }catch (BLLException e){
//            e.printStackTrace();
//        }
//        req.setAttribute("user", user);
//
//        req.getRequestDispatcher("/WEB-INF/monProfil.jsp").forward(req, resp);
//    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("noUtilisateur"));
        try{
            utilisateursManager.supprimerUtilisateur(id);
            resp.sendRedirect(req.getContextPath() + "/eniencheres");
        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath()+"/profilServlet");
    }


}
