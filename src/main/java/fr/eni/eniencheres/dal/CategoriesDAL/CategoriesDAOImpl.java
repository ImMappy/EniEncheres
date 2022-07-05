package fr.eni.eniencheres.dal.CategoriesDAL;


import fr.eni.eniencheres.bo.Categories;
import fr.eni.eniencheres.dal.ConnectionProvider;
import fr.eni.eniencheres.Exceptions.DALException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAOImpl implements CategoriesDAO {
    private final String SELECT_ALL_CATEGORIES = "SELECT no_categorie,libelle FROM Categories";
    private final String SELECT_CATEGORIE_BY_ID = "SELECT no_categorie,libelle FROM Categories WHERE no_categorie = ?";

    public List<Categories> selectAllCategories() throws DALException {
        List<Categories> listCategories = new ArrayList<>();
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES,PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            while (rs.next()){
                Categories categories = new Categories(rs.getInt("no_categorie"),rs.getString("libelle"));

                listCategories.add(categories);
            }
        }catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur select all categories",e);
        }
        return listCategories;
    }

    public Categories selectCategorieById(int id) throws DALException{
        Categories categorie = null;
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORIE_BY_ID,PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1,id);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            if(rs.next()){
                categorie = new Categories(rs.getInt("no_categorie"),rs.getString("libelle"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur select by id categorie",e);
        }
        return categorie;
    }
}
