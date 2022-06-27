package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.Utilisateurs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtilisateursDAOImpl implements UtilisateursDAO {

    private final String INSERT_UTILISATEUR = "INSERT (pseudo,nom,prenom,email,telephone,rue,codePostal,ville,motDePasse) VALUES(?,?,?,?,?,?,?,?,?,?)";
    private final String SELECT_UTILISATEUR_BY_ID = "SELECT * FROM Utilisateur WHERE id = ? ";
    private final String UPDATE_UTILISATEUR = "UPDATE Utilisateur SET pseudo = ?, nom = ?, prenom = ?, email = ?, telephone = ?, rue = ? codePostal = ?, ville = ?, motDePasse = ?";
    private final String SELECT_ALL_UTILISATEURS = "SELECT * FROM Utilisateur";
    private final String DELETE_UTILISATEUR = "DELETE Utilisateur WHERE noUtilisateur ?";



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
                user = new Utilisateurs(rs.getString("pseudo"),rs.getString("nom"),rs.getString("prenom"),rs.getString("email"),rs.getString("telephone"),rs.getString("rue"),rs.getString("codePostal"),rs.getString("ville"),rs.getString("motDePasse"),rs.getInt("credit"),rs.getBoolean("administrateur"));
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
                user = new Utilisateurs(rs.getString("pseudo"),rs.getString("nom"),rs.getString("prenom"),rs.getString("email"),rs.getString("telephone"),rs.getString("rue"),rs.getString("codePostal"),rs.getString("ville"),rs.getString("motDePasse"),rs.getInt("credit"),rs.getBoolean("administrateur"));
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
            preparedStatement.setString(4,user.getEmail());
            preparedStatement.setString(5, user.getTelephone());
            preparedStatement.setString(6, user.getRue());
            preparedStatement.setString(7,user.getCodePostal());
            preparedStatement.setString(8, user.getVille());
            preparedStatement.setString(9, user.getMotDePasse());
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
}

