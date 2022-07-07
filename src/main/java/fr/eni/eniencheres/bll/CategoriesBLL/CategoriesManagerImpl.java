package fr.eni.eniencheres.bll.CategoriesBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.Categories;
import fr.eni.eniencheres.dal.CategoriesDAL.CategoriesDAO;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.dao.DaoFactory;

import java.util.List;

public class CategoriesManagerImpl implements CategoriesManager {
    public static CategoriesManagerImpl instance;

    private CategoriesDAO categoriesDAO;

    public static CategoriesManagerImpl getInstance(){
        if(instance == null){
            instance = new CategoriesManagerImpl();
        }
        return instance;
    }
    public CategoriesManagerImpl(){
        categoriesDAO = DaoFactory.getCategoriesDAO();
    }

    public List<Categories> getAllCategories() throws BLLException {
        List<Categories> categoriesList;
        try{
            categoriesList = categoriesDAO.selectAllCategories();
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur get all categories",e);
        }
        return categoriesList;
    }

    public Categories getCategorieById(int id) throws BLLException{
        Categories categorie= null;
        try{
            categorie = categoriesDAO.selectCategorieById(id);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur get all categories",e);
        }
        return categorie;
    }
}
