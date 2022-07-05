package fr.eni.eniencheres.bll.CategoriesBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.Categories;

import java.util.List;

public interface CategoriesManager {
    public List getAllCategories()throws BLLException;
    public Categories getCategorieById(int id) throws BLLException;
}
