package fr.eni.eniencheres.dal;


import fr.eni.eniencheres.bo.Categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAOImpl implements CategoriesDAO {
    private final String SELECT_ALL_CATEGORIES = "SELECT * FROM Categories";
    private final String SELECT_CATEGORIE_BY_ID = "SELECT * FROM Categories WHERE no_categorie = ?";

    public List selectAllCategories() throws DALException{
        List<Categories> listCategories = null;
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            while (rs.next()){
                listCategories = new ArrayList<>();
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
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CATEGORIE_BY_ID);
            preparedStatement.setInt(1,id);
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
