package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManager;
import fr.eni.eniencheres.bll.ArticleVenduBLL.ArticleVenduManagerImpl;
import fr.eni.eniencheres.bll.CategoriesBLL.CategoriesManager;
import fr.eni.eniencheres.bll.CategoriesBLL.CategoriesManagerImpl;
import fr.eni.eniencheres.bll.RetraitBLL.RetraitManager;
import fr.eni.eniencheres.bll.RetraitBLL.RetraitManagerImpl;
import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManager;

import fr.eni.eniencheres.bll.UtilisateursBLL.UtilisateursManagerImpl;

public class FactoryBLL {

    public static UtilisateursManager getUtilisateursManager() {
        return new UtilisateursManagerImpl();
    }

    public static ArticleVenduManager getArticleVenduManager(){return new ArticleVenduManagerImpl();}
    public static CategoriesManager getCategoriesManager(){return new CategoriesManagerImpl();
    }

    public  static RetraitManager getRetraitManager(){return new RetraitManagerImpl();}
}
