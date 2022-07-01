package fr.eni.eniencheres.ihm;

import fr.eni.eniencheres.bll.ArticleVenduManager;
import fr.eni.eniencheres.bll.ArticleVenduManagerImpl;

public class EncheresFactory {
    public static ArticleVenduManager getArticleVenduManager(){
        return new ArticleVenduManagerImpl();
    }
}
