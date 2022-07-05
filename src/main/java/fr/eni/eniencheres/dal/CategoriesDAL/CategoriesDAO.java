package fr.eni.eniencheres.dal.CategoriesDAL;

import fr.eni.eniencheres.bo.Categories;
import fr.eni.eniencheres.Exceptions.DALException;

import java.util.List;

public interface CategoriesDAO {
    public List<Categories> selectAllCategories() throws DALException;
    public Categories selectCategorieById(int id) throws DALException;
}
