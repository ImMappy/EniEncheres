package fr.eni.eniencheres.dal.EncheresDAL;

import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.bo.ArticleVendu;
import fr.eni.eniencheres.bo.Enchere;
import fr.eni.eniencheres.dal.ConnectionProvider;

import java.sql.*;
import java.time.LocalDate;


public class EncheresDAOImpl implements EncheresDAO  {
        private static final String SELECT_ENCHERES = "SELECT no_enchere,date_enchere,montant_enchere,no_article,no_utilisateur FROM Encheres e WHERE no_article= ?";
        private static final String SELECT_MONTANT = "SELECT TOP 1 montant_enchere FROM Encheres WHERE no_article = ? ORDER BY montant_enchere DESC";
        private static final String INSERT_ENCHERE = "INSERT INTO Encheres (date_enchere,montant_enchere,no_article,no_utilisateur) VALUES (?,?,?,?)";

        public Enchere selectEnchereId(int id) throws DALException {
            Enchere enchere = null;
                try(Connection connection = ConnectionProvider.getConnection()){
                        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ENCHERES, PreparedStatement.RETURN_GENERATED_KEYS);
                        preparedStatement.setInt(1,id);
                        preparedStatement.executeQuery();
                        ResultSet rs = preparedStatement.getResultSet();
                        while(rs.next()){
                                enchere = new Enchere(rs.getInt("no_enchere"),rs.getObject("date_enchere",LocalDate.class), rs.getInt("montant_enchere"),rs.getInt("no_article"),rs.getInt("no_utilisateur"));
                        }

                } catch (SQLException e) {
                        e.printStackTrace();
                        throw new DALException("Erreur select enchere",e);
                }
                return enchere;
        }

        public void insertEnchere(Enchere enchere) throws DALException{
                try(Connection connection = ConnectionProvider.getConnection()){
                        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ENCHERE,Statement.RETURN_GENERATED_KEYS);
                        preparedStatement.setDate(1,Date.valueOf(enchere.getDateEnchere()));
                        preparedStatement.setInt(2,enchere.getMontantEnchere());
                        preparedStatement.setInt(3,enchere.getNoArticle());
                        preparedStatement.setInt(4,enchere.getNoUtilisateur());
                        preparedStatement.executeUpdate();

                        ResultSet rs = preparedStatement.getGeneratedKeys();
                        if(rs.next()){
                                enchere.setNoEnchere(rs.getInt(1));
                        }

                } catch (SQLException e) {
                        e.printStackTrace();
                        throw new DALException("Erreur insert enchere",e);
                }
        }
        public Enchere selectMontant(int id) throws DALException{
                Enchere montant = null;
                try(Connection connection= ConnectionProvider.getConnection()){
                        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MONTANT, PreparedStatement.RETURN_GENERATED_KEYS);
                        preparedStatement.setInt(1,id);
                        preparedStatement.executeQuery();
                        ResultSet rs = preparedStatement.getResultSet();
                        if(rs.next()){
                                montant = new Enchere(rs.getInt("montant_enchere"));
                        }

                } catch (SQLException e) {
                        e.printStackTrace();
                        throw new DALException("Erreur select montant",e);
                }
                return montant;
        }
}
