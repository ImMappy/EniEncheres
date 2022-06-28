package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bo.Utilisateurs;
import fr.eni.eniencheres.dal.DALException;
import fr.eni.eniencheres.dal.UtilisateursDAO;
import fr.eni.eniencheres.dao.DaoFactory;

import java.util.ArrayList;
import java.util.List;

public class UtilisateursManagerImpl implements UtilisateursManager{

    private static UtilisateursManagerImpl instance;
    private UtilisateursDAO userDao;

    public static UtilisateursManagerImpl getInstance() {
        if(instance == null){
            instance = new UtilisateursManagerImpl();
        }
        return instance;
    }

    public UtilisateursManagerImpl(){
        userDao = DaoFactory.getUtilisateursDao();
    }

    /**
     *
     * @param user
     * @throws BLLException
     */
    public void ajouterUtilisateur(Utilisateurs user) throws BLLException{
        try {
            userDao.insertUtilisateur(user);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur ajout utilisateur",e);
        }
    }

    /**
     *
     * @param id
     * @throws BLLException
     */

    public void supprimerUtilisateur(int id)throws BLLException{
        try{
            userDao.deleteUtilisateur(id);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur suppression utilisateur",e);
        }
    }

    /**
     *
     * @param user
     * @throws BLLException
     */

    public void modifierUtilisateur(Utilisateurs user) throws BLLException{
        try{
            userDao.updateUtilisateur(user);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur modification utilisateur",e);
        }
    }

    /**
     *
     * @param id
     * @return un utilisateur par son id
     * @throws BLLException
     */

    public Utilisateurs getUtilisateurById(int id) throws BLLException{
        Utilisateurs user = null;
        try{
            userDao.selectUtilisateurById(id);
        } catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur affichage utilisateur by id",e);
        }
        return user;
    }

    /**
     *
     * @return une liste d'utilisateurs
     * @throws BLLException
     */

    public List getAllUtilisateurs()throws BLLException{
        List<Utilisateurs> utilisateursList = new ArrayList<>();
        try{
            utilisateursList = userDao.selectAllUtilisateurs();
        } catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur affichage de tous les utilisateurs",e);
        }
        return utilisateursList;
    }








}
