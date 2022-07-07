package fr.eni.eniencheres.bll.ArticleVenduBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.ArticleVendu;
import fr.eni.eniencheres.dal.ArticleVenduDAL.ArticleVenduDAO;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.dao.DaoFactory;

import java.util.List;

public class ArticleVenduManagerImpl implements ArticleVenduManager {

    private static ArticleVenduManagerImpl instance;

    private ArticleVenduDAO daoArticle;

    public static ArticleVenduManagerImpl getInstance() {
        if(instance == null){
            instance = new ArticleVenduManagerImpl();
        }
        return instance;
    }

    public ArticleVenduManagerImpl(){
        daoArticle = DaoFactory.getArticleVenduDAO();
    }

    @Override
    //* ajout article
    public void ajouterArticle (ArticleVendu a) throws BLLException {
        try {
            daoArticle.insert(a);
        }catch (DALException e){
            throw new BLLException("Erreur ajout article",e);
        }

    }

    //*supprimer article
    @Override
    //
    public void supprimerArticle(Integer id) throws BLLException {
        try {
            ArticleVendu newArticle = new ArticleVendu();
            newArticle.setNoArticle(id);
            daoArticle.delete(id);
        } catch (DALException e) {
            e.printStackTrace();
            throw new BLLException("Erreur suppression pizza", e);
        }
    }

    //*modifier article
    @Override
    public void modifierArticle(ArticleVendu article) throws BLLException {
        try {
            daoArticle.update(article);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur modification article", e);
        }
    }

    //*SelectById
    @Override
    public ArticleVendu selectById(Integer id) throws BLLException {
        ArticleVendu article;
        try {
            article = daoArticle.selectById(id);
        } catch (DALException e) {
            e.printStackTrace();
            throw new BLLException("Erreur select by id",e);
        }
        return article;
    }


    @Override
    public List selectAll() throws BLLException {
        List<ArticleVendu> listeArticle;
        try {
            listeArticle = daoArticle.selectAll();
        } catch (DALException e) {
            throw new BLLException("Erreur select articles all ",e);
        }
        return listeArticle;
    }


}
