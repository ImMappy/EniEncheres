package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.Utilisateurs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateursDAOImpl implements UtilisateursDAO {

    private static final String INSERT_UTILISATEUR = "INSERT INTO UTILISATEURS (pseudo,nom,prenom,email,telephone,rue,code_postal,ville,mot_de_passe, administrateur, credit)" + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
    private static final String SELECT_UTILISATEUR_BY_ID = "SELECT * FROM UTILISATEURS WHERE no_utilisateur = ? ";
    private static final String UPDATE_UTILISATEUR = "UPDATE UTILISATEURS SET pseudo = ?, nom = ?, prenom = ?, email = ?, telephone = ?, rue = ?, code_postal = ?, ville = ?, mot_de_passe = ?";
    private static final String SELECT_ALL_UTILISATEURS = "SELECT * FROM UTILISATEURS";
    private static final String DELETE_UTILISATEUR = "DELETE UTILISATEURS WHERE no_utilisateur = ?";
    private static final String SELECT_INFOS_USER = "SELECT pseudo,mot_de_passe FROM UTILISATEURS WHERE pseudo = ? AND mot_de_passe = ?";


    /**
     * @param id
     * @return un utilisateur par son id
     * @throws DALException
     */

    public Utilisateurs selectUtilisateurById(int id ) throws DALException{
        Utilisateurs user = null;
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_UTILISATEUR_BY_ID, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1,id);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            if(rs.next()){
                user = new Utilisateurs(rs.getString("pseudo"),rs.getString("nom"),rs.getString("prenom"),rs.getString("email"),rs.getString("telephone"),rs.getString("rue"),rs.getString("codePostal"),rs.getString("ville"),rs.getString("motDePasse"),rs.getInt("credit"),rs.getByte("administrateur"));
            }
        } catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur select id utilisateurs",e);
        }
        return user;
    }

    /**
     * @return la liste de tous les utilisateurs enregistrés
     * @throws DALException
     */
    public List selectAllUtilisateurs() throws DALException{
        List<Utilisateurs> utilisateursList = null;
        Utilisateurs user = null;
        try(Connection connection = ConnectionProvider.getConnection()){
//            TODO: Exécution script SQL SELECT_ALL_UTILISATEUR
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_UTILISATEURS);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            while(rs.next()){
                 utilisateursList= new ArrayList<>();
                user = new Utilisateurs(rs.getString("pseudo"),rs.getString("nom"),rs.getString("prenom"),rs.getString("email"),rs.getString("telephone"),rs.getString("rue"),rs.getString("codePostal"),rs.getString("ville"),rs.getString("motDePasse"),rs.getInt("credit"),rs.getByte("administrateur"));
                utilisateursList.add(user);
            }

        }catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur select all utisateurs",e);
        }
        return utilisateursList;
    }

    /**
     *
     * @param user
     * @throws DALException
     */

    public void insertUtilisateur(Utilisateurs user)throws DALException{
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_UTILISATEUR, PreparedStatement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,user.getPseudo());
            preparedStatement.setString(2,user.getNom());
            preparedStatement.setString(3,user.getPrenom());
            preparedStatement.setString(4,user.getTelephone());
            preparedStatement.setString(5,user.getEmail());
            preparedStatement.setString(6,user.getMotDePasse());
            preparedStatement.setString(7,user.getCodePostal());
            preparedStatement.setString(8,user.getVille());
            preparedStatement.setString(9,user.getRue());
            preparedStatement.setByte(10,user.setAdministrateur((byte) 0));
            preparedStatement.setInt(11, user.setCredit(100));
            preparedStatement.executeUpdate();
            ResultSet rs = preparedStatement.getGeneratedKeys();
            if(rs.next()){
                user.setNoUtilisateur(rs.getInt(1));
            }
        }catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur insert utilisateur",e);
        }
    }

    /**
     *
     * @param user
     * @throws DALException
     */

    public void updateUtilisateur(Utilisateurs user) throws DALException{
        Utilisateurs utilisateur = null;
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_UTILISATEUR);
            preparedStatement.setString(1,user.getPseudo());
            preparedStatement.setString(2,user.getNom());
            preparedStatement.setString(3,user.getPrenom());
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5, user.getTelephone());
            preparedStatement.setString(6, user.getRue());
            preparedStatement.setString(7,user.getCodePostal());
            preparedStatement.setString(8, user.getVille());
            preparedStatement.setString(9, user.getMotDePasse());
            preparedStatement.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur update",e);
        }
    }

    /**
     *
     * @param id
     * @throws DALException
     */
    public void deleteUtilisateur(int id) throws DALException{
        try(Connection connection = ConnectionProvider.getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_UTILISATEUR);
            preparedStatement.setInt(1,id);
        } catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur delete",e);
        }
    }


    public Utilisateurs selectInfosUser(String pseudo, String motDePasse) throws DALException {
        Utilisateurs user = null;
        try(Connection connection = ConnectionProvider.getConnection() ){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_INFOS_USER);
            preparedStatement.setString(1,pseudo);
            preparedStatement.setString(2,motDePasse);
            preparedStatement.executeQuery();
            ResultSet rs = preparedStatement.getResultSet();
            if(rs.next()){
                user= new Utilisateurs(rs.getString("pseudo"),rs.getString("mot_de_passe"));
            }
        }catch (SQLException e){
            e.printStackTrace();
            throw new DALException("Erreur select_infos");
        }
        return user;
    }
}

