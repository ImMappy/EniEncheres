package fr.eni.eniencheres.dao;

import fr.eni.eniencheres.dal.ArticleVenduDAL.ArticleVenduDAO;
import fr.eni.eniencheres.dal.ArticleVenduDAL.ArticleVenduDAOImpl;
import fr.eni.eniencheres.dal.CategoriesDAL.CategoriesDAO;
import fr.eni.eniencheres.dal.CategoriesDAL.CategoriesDAOImpl;
import fr.eni.eniencheres.dal.EncheresDAL.EncheresDAO;
import fr.eni.eniencheres.dal.EncheresDAL.EncheresDAOImpl;
import fr.eni.eniencheres.dal.RetraitDAL.RetraitDAO;
import fr.eni.eniencheres.dal.RetraitDAL.RetraitDAOImpl;
import fr.eni.eniencheres.dal.UtilisateurDAL.UtilisateursDAO;
import fr.eni.eniencheres.dal.UtilisateurDAL.UtilisateursDAOImpl;

public class DaoFactory {

    public static UtilisateursDAO getUtilisateursDao(){
            return new UtilisateursDAOImpl();
        }
    public static ArticleVenduDAO getArticleVenduDAO() {
        return new ArticleVenduDAOImpl();}
    public static EncheresDAO getEncheresDao(){
        return new EncheresDAOImpl();
    }
    public static CategoriesDAO getCategoriesDAO(){
        return new CategoriesDAOImpl();
    }
    public static RetraitDAO getRetraitDAO() {return new RetraitDAOImpl();}



}
