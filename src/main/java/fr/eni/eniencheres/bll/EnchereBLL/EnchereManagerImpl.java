package fr.eni.eniencheres.bll.EnchereBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.bo.Enchere;
import fr.eni.eniencheres.dal.EncheresDAL.EncheresDAO;
import fr.eni.eniencheres.dao.DaoFactory;


public class EnchereManagerImpl implements EnchereManager {
    private static EnchereManagerImpl instance;
    private EncheresDAO encheresDAO;

    private static EnchereManagerImpl getInstance(){
        if(instance == null){
            instance = new EnchereManagerImpl();
        }
        return instance;
    }

    public EnchereManagerImpl(){
        encheresDAO = DaoFactory.getEncheresDao();
    }

    public void ajoutEnchere(Enchere enchere)throws BLLException {
        try{
            encheresDAO.insertEnchere(enchere);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur ajout enchere",e);
        }
    }

    public Enchere selectEnchereId(int id) throws BLLException{
        Enchere enchere;
        try {
            enchere = encheresDAO.selectEnchereId(id);
        } catch (DALException e) {
            e.printStackTrace();
            throw new BLLException("Erreur select enchere liste",e);
        }
        return enchere;
    }
    public Enchere getMontant(int id) throws BLLException{
        Enchere montant;
        try{
            montant = encheresDAO.selectMontant(id);
        }catch(DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur get montant",e);
        }
        return montant;
    }

}
