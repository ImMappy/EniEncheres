package fr.eni.eniencheres.dao;

import fr.eni.eniencheres.dal.*;

public class DaoFactory {
public static UtilisateursDAO getUtilisateursDao(){
        return new UtilisateursDAOImpl();
    }
public static ArticleVenduDAO getArticleVenduDAO() {
    return new ArticleVenduDAOImpl();}

public static CategoriesDAO getCategoriesDAO(){
    return new CategoriesDAOImpl();
}
public static RetraitDAO getRetraitDAO() {return new RetraitDAOImpl();}


}
