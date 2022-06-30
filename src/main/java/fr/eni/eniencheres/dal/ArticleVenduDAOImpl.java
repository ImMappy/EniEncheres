package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.ArticleVendu;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


public class ArticleVenduDAOImpl implements ArticleVenduDAO{
    private static final String INSERT = "insert into ARTICLES_VENDUS (nom_article, description, date_debut_encheres, date_fin_encheres, prix_initial, prix_vente, no_utilisateur, no_categorie)"+ "values (?,?,?,?,?,?,?,?)";
    private static final String SELECT_ID = "SELECT * FROM ARTICLES_VENDUS WHERE no_article = ?";
    private static final String DELETE = "DELETE FROM ARTICLES_VENDUS WHERE no_article = ?";
    private static final String UPDATE = "UPDATE ARTICLES_VENDUS SET nom_article=?, description=?, date_debut_encheres=?, date_fin_encheres=?,prix_initial=?,prix_vente=? WHERE no_article = ?";

    private static final String SELECT_ALL_ARTICLES = "SELECT * FROM Articles_Vendus";


    //* partie INSERT
    //* se connecter à la Base de donnée
    @Override
    public void insert(ArticleVendu articleVendu)throws DALException {
        try (Connection conn = ConnectionProvider.getConnection()) {

        //* Préparation Requête SQL
        PreparedStatement stmt = conn.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
        //* Valoriser les paramêtres
        stmt.setString( 1, articleVendu.getNomArticle());
        stmt.setString( 2, articleVendu.getDescription());
        stmt.setDate( 3, Date.valueOf(articleVendu.getDateDebutEncheres()));
        stmt.setDate( 4, Date.valueOf(articleVendu.getDateFinEncheres()));
        stmt.setInt(5, articleVendu.getPrixInitial());
        stmt.setInt(6, articleVendu.getPrixVente());
        stmt.setInt(7, articleVendu.getNoUtilisateur());
        stmt.setInt(8, articleVendu.getNoCategorie());

            //* Exécuter la requête
            stmt.executeUpdate();

            //* Renvoi en tableau de résultat
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()){
                articleVendu.setNoArticle(rs.getInt(1));
            }
    } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("erreur insert", e);
    }
}

    //*Partie SELECT_BY_ID
    @Override
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
                            rs.getString(articleVendu.getNomArticle()),
                            rs.getString(articleVendu.getDescription()),
                            rs.getObject("date_debut_encheres",LocalDate.class),
                            rs.getObject("date_fin_encheres",LocalDate.class),
                            rs.getInt(articleVendu.getPrixInitial()),
                            rs.getInt(articleVendu.getPrixVente()),
                            rs.getInt(articleVendu.getNoUtilisateur()),
                            rs.getInt(articleVendu.getNoCategorie())

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
    public void update(ArticleVendu articleVendu) throws DALException {

        // *Connection à la base de donnée
        try(Connection conn = ConnectionProvider.getConnection()) {

            // *Préparation à la requête SQL UPDATE
            PreparedStatement stmt = conn.prepareStatement(UPDATE);

            // *Valoriser les paramètres de l'article
            stmt.setString( 1, articleVendu.getNomArticle());
            stmt.setString( 2, articleVendu.getDescription());
            stmt.setDate( 3, Date.valueOf(articleVendu.getDateDebutEncheres()));
            stmt.setDate( 4, Date.valueOf(articleVendu.getDateFinEncheres()));
            stmt.setInt(5, articleVendu.getPrixInitial());
            stmt.setInt(6, articleVendu.getPrixVente());


            //* Exécuter la Mise à jour
            stmt.executeUpdate();

            //*message d'erreur si un problème est rencontré
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DALException("Erreur a la modification d'un article");
        }
    }


    //* SelectALL
    @Override
    public List<ArticleVendu> selectAll()  throws DALException {
        //*création Liste article
        List<ArticleVendu> listeArticle = new ArrayList<>();

        try (Connection conn = ConnectionProvider.getConnection()){

            Statement stmt = conn.createStatement();
            ResultSet rs =stmt.executeQuery(SELECT_ALL_ARTICLES);

            while (rs.next()){
                ArticleVendu article = new ArticleVendu(rs.getString("nomArticle"),
                                rs.getString("description"),
                                rs.getObject("date_debut_encheres",LocalDate.class),
                                rs.getObject("date_fin_encheres",LocalDate.class),
                                rs.getInt("prixInitial"),
                                rs.getInt("prixVente"),
                                rs.getInt("noUtilisateur"),
                                rs.getInt("noCategorie")
                );
                listeArticle.add(article);
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new DALException("Erreur a la selection des articles");

        } return listeArticle;
    }

}

