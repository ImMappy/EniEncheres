package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bo.ArticleVendu;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

public interface ArticleVenduManager {

    //* ajout article

    //* ajout article
    void ajouterArticle(ArticleVendu article) throws BLLException;

    void supprimerArticle(Integer id) throws BLLException;
    void modifierArticle(ArticleVendu article) throws BLLException;
    ArticleVendu selectById(Integer id) throws BLLException;
    List<ArticleVendu> selectAll() throws BLLException;
}






