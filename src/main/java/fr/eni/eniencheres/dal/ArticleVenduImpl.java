package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.ArticleVendu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ArticleVenduImpl {
    private static final String INSERT = "insert into ARTICLES_VENDUS (nomArticle, description, dateDebutEncheres, dateFinEncheres, miseAPrix, prixVente, etatVente)"+ "values (?,?,?,?,?,?,?,?)";
    private static final String SELECT_ID = "SELECT * FROM ARTICLES_VENDUS WHERE noArticle = ?";
    private static final String DELETE = "DELETE FROM ARTICLES_VENDUS WHERE noArticle = ?";
    private static final String UPDATE = "UPDATE ARTICLES_VENDUS SET nomArticle=?, description=?, dateDebutEncheres=?, dateFinEncheres=?,miseAPrix=?,prixVente=?,etatVente=? WHERE noArticle = ?";



    //* partie INSERT
    //* se connecter à la Base de donnée
    private  void insertArticles (ArticleVendu articleVendu)throws DALException {
        try (Connection conn = ConnectionProvider.getConnection()) {

        //* Préparation Requête SQL
        PreparedStatement stmt = conn.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);

        //* Valoriser les paramêtres
        stmt.setString( 1, articleVendu.getNomArticle());
        stmt.setString( 2, articleVendu.getDescription());
        stmt.setDate( 3, articleVendu.getDateDebutEncheres());
        stmt.setDate( 4, articleVendu.getDateFinEncheres());
        stmt.setInt(5, articleVendu.getMiseAPrix());
        stmt.setInt(6, articleVendu.getPrixVente());
        stmt.setInt(7, articleVendu.getEtatVente());

            //* Exécuter la requête
            stmt.executeUpdate();

            //* Renvoi en tableau de résultat
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                articleVendu.setNoArticle(rs.getString(1));
            }
    } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("erreur insert", e);
    }
}

    //*Partie SELECT_BY_ID
    public ArticleVendu selectById(Integer i) throws DALException{

        //*Initialisation d'un article
        ArticleVendu articleVendu =null;

        //* se connecter à la Base de donnée
            try (Connection conn = ConnectionProvider.getConnection()) {

                //*Préparation de la Requête SQL SELECT_ID
                PreparedStatement stmt = conn.prepareStatement(SELECT_ID);

                //* Valoriser les paramètres  SELECT_ID
                stmt.setInt(1,i);

                //* Récupération de l'article by ID
                ResultSet rs = stmt.executeQuery();
                if (rs.next()){
                    articleVendu = new ArticleVendu(
                            rs.getString("nom"),
                            rs.getString("description"),
                            rs.getDate("debutEnchere"),
                            rs.getDate("finEnchere"),
                            rs.getInt("miseAPrix"),
                            rs.getInt("prixVente"),
                            rs.getInt("etatVente")
                    );
                }
            }

            //*message d'erreur si un problème est rencontré
            catch (SQLException e) {
                System.out.println(e.getMessage());
                throw new DALException("Erreur a la selection d'un article by id");
            }
            // *Return l'article Sélectionné
            return articleVendu;
    }


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
    public void update(ArticleVendu articleVendu) throws DALException {

        // *Connection à la base de donnée
        try(Connection conn = ConnectionProvider.getConnection()) {

            // *Préparation à la requête SQL UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE);

            // *Valoriser les paramètres de l'article
            stmt.setString( 1, articleVendu.getNomArticle());
            stmt.setString( 2, articleVendu.getDescription());
            stmt.setDate( 3, articleVendu.getDateDebutEncheres());
            stmt.setDate( 4, articleVendu.getDateFinEncheres());
            stmt.setInt(5, articleVendu.getMiseAPrix());
            stmt.setInt(6, articleVendu.getPrixVente());
            stmt.setInt(7, articleVendu.getEtatVente());


            // Exécuter la Mise à jour
            stmt.executeUpdate();

            //message d'erreur si un problème est rencontré
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur a la modification d'un article");
        }
    }


}

