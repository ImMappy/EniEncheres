package fr.eni.eniencheres.ihm;

import fr.eni.eniencheres.bll.ArticleVenduManager;
import fr.eni.eniencheres.bll.BLLException;
import fr.eni.eniencheres.bll.FactoryBLL;
import fr.eni.eniencheres.bo.ArticleVendu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/venteArticleServlet")
public class VenteArticleServlet extends HttpServlet {

    private ArticleVenduManager articleManager;

    public VenteArticleServlet() {
        articleManager = FactoryBLL.getArticleVenduManager();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/nouvelleVente.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Récupération Paramètres Formulaire Articles
        ArticleVendu newArticle = new ArticleVendu(
                req.getParameter("registerArticle"),
                req.getParameter("registerDescription"),
                LocalDate.parse(req.getParameter("registerDateDebut")),
                LocalDate.parse(req.getParameter("registerDateFin")),
                Integer.parseInt(req.getParameter("registerMisaAPrix")),
                Integer.parseInt(req.getParameter("registerNoUtilisateur")),
                Integer.parseInt(req.getParameter("registerCategorie"))

        );

        try {
            articleManager.ajouterArticle(newArticle);
        } catch (BLLException e) {
            throw new RuntimeException(e);
        }

        resp.sendRedirect(req.getContextPath() + "/eniencheres");

    }
}
