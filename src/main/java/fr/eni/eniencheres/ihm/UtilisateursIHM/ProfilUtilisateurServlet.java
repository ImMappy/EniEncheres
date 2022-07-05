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

        } catch (BLLException e) {
            e.printStackTrace();
        }
        resp.sendRedirect(req.getContextPath() + "/eniencheres");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            user = utilisateursManager.getUtilisateurById(Integer.parseInt(req.getParameter("noUtilisateur")));
            session = req.getSession();
        } catch (BLLException e) {
            e.printStackTrace();
        }
        try {
            if(!user.getMotDePasse().equals(req.getParameter("profilPassword")) || !req.getParameter("profilNewPassword").equals(req.getParameter("profilPasswordConf"))){
                System.out.println(req.getParameter("profilPassword"));

                this.getServletContext().setAttribute("errorPasswordProfil",true);
                System.out.println(user.getMotDePasse());
                resp.sendRedirect(req.getContextPath() + "/profilServlet");
            }else{
                user = new Utilisateurs(Integer.parseInt(req.getParameter("noUtilisateur")),req.getParameter("profilPseudo"),req.getParameter("profilNom"),req.getParameter("profilPrenom"),req.getParameter("profilEmail"),req.getParameter("profilTelephone"),req.getParameter("profilRue"),req.getParameter("profilCodePostal"),req.getParameter("profilVille"),req.getParameter("profilNewPassword"),Integer.parseInt(req.getParameter("profilCredit")));
                utilisateursManager.modifierUtilisateur(user);
                this.getServletContext().setAttribute("errorPasswordProfil",false);

                session.setAttribute("user",user);
                resp.sendRedirect(req.getContextPath() + "/eniencheres");
            }

        } catch (BLLException e) {
            e.printStackTrace();
        }



    }


}
