package fr.eni.eniencheres.bll;

public class FactoryBLL {

    public static UtilisateursManager getUtilisateursManager() {
        return new UtilisateursManagerImpl();
    }

    public static ArticleVenduManager getArticleVenduManager(){return new ArticleVenduManagerImpl();}
}
