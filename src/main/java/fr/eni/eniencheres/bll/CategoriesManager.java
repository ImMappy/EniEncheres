package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bo.Categories;

import java.util.List;

public interface CategoriesManager {
    public List getAllCategories()throws BLLException;
    public Categories getCategorieById(int id) throws BLLException;
}
