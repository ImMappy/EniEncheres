package fr.eni.eniencheres.dal.RetraitDAL;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.bo.Retrait;
import fr.eni.eniencheres.dal.ConnectionProvider;
import fr.eni.eniencheres.dal.RetraitDAL.RetraitDAOImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RetraitDAOImpl implements RetraitDAO {

        private static final String INSERT ="insert into RETRAITS (rue, code_postal, ville)"+"values (?,?,?)";
        private static final String SELECT_ID = "SELECT rue,code_postal,ville FROM RETRAITS WHERE no_article =?";
    private static final String DELETE = "DELETE FROM RETRAITS WHERE no_article = ?";
        private static final String UPDATE = "UPDATE RETRAITS SET rue=?, code_postal=?, ville=?";
        private static final String SELECT_ALL_RETRAITS = "SELECT * FROM RETRAITS";

        //*PArtie INSERT

    //* se connecter à la Base de donnée
    @Override
    public void insert(Retrait retrait)throws DALException {
        try (Connection conn = ConnectionProvider.getConnection()) {

            //* Preparation Requête SQL
            PreparedStatement stmt = conn.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);

            //* Valoriser les paramêtres
            stmt.setString( 1, retrait.getRue());
            stmt.setString( 2, retrait.getCodePostal());
            stmt.setString(3, retrait.getVille());

            //* Exécuter la requête
            stmt.executeUpdate();

            //* Renvoi en tableau de résultat
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                retrait.setNoAtricle(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("erreur insert", e);
        }
    }

    @Override
    //* Partie Delete
    public void delete(Integer id) throws DALException {

        //* se connecter à la base de donnée
        try (Connection conn = ConnectionProvider.getConnection())
        {
            //* Préparation Requête SQL Delete
            PreparedStatement stmt = conn.prepareStatement(DELETE);

            //* Valoriser les paramètres (delete by ID)
            stmt.setInt(1, id);

            stmt.executeQuery();
        }
        catch (SQLException e) {
            throw new DALException("Erreur insert ", e);
        }
    }

    //*Partie UPDATE
    @Override
    public void update(Retrait retrait) throws DALException {

        // *Connection à la base de donnée
        try(Connection conn = ConnectionProvider.getConnection()) {

            // *Préparation à la requête SQL UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE);

            // *Valoriser les paramètres de l'article
            stmt.setString( 1, retrait.getRue());
            stmt.setString( 2, retrait.getCodePostal());
            stmt.setString( 2, retrait.getVille());

            //* Exécuter la Mise à jour
            stmt.executeUpdate();

            //*message d'erreur si un problème est rencontré
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur a la modification d'un article");
        }
    }

    //* SelectALL
    public List selectAll() throws DALException {
        //*création Liste article
        List<Retrait> listeRetraits = new ArrayList<>();

        try (Connection conn = ConnectionProvider.getConnection()){

            Statement stmt = conn.createStatement();
            ResultSet rs =stmt.executeQuery(SELECT_ALL_RETRAITS);

            while (rs.next()){
                Retrait retrait = new Retrait(rs.getString("rue"),
                        rs.getString("code_postal"),
                        rs.getString("ville")

                );
                listeRetraits.add(retrait);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new DALException("Erreur a la selection des articles");

        } return listeRetraits;
    }
public Retrait selectRetrait(int id ) throws DALException {
        Retrait retrait = null;
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement statement = connection.prepareStatement(SELECT_ID);
            statement.setInt(1,id);
            statement.executeQuery();
            ResultSet rs = statement.getResultSet();
            if(rs.next()){
                retrait = new Retrait(rs.getString("rue"),rs.getString("code_postal"),rs.getString("ville"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur select infos retraits",e);
        }
        return retrait;
}


}




