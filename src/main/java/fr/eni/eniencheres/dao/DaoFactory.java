package fr.eni.eniencheres.dao;

import fr.eni.eniencheres.dal.ArticleVenduDAO;
import fr.eni.eniencheres.dal.ArticleVenduDAOImpl;
import fr.eni.eniencheres.dal.UtilisateursDAO;
import fr.eni.eniencheres.dal.UtilisateursDAOImpl;

public class DaoFactory {
public static UtilisateursDAO getUtilisateursDao(){
        return new UtilisateursDAOImpl();
    }
public static ArticleVenduDAO getArticleVenduDAO() {
    return new ArticleVenduDAOImpl();}
}
