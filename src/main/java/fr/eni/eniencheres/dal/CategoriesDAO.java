package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.Categories;

import java.util.List;

public interface CategoriesDAO {
    public List selectAllCategories() throws DALException;
    public Categories selectCategorieById(int id) throws DALException;
}
