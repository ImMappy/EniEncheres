package fr.eni.eniencheres.bll.RetraitBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.Retrait;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.dal.RetraitDAL.RetraitDAO;
import fr.eni.eniencheres.dao.DaoFactory;

import java.util.ArrayList;
import java.util.List;

public class RetraitManagerImpl implements RetraitManager {
    public static RetraitManagerImpl instance;
    private RetraitDAO daoRetrait;

    public static RetraitManagerImpl getInstance(){
        if(instance==null){
            instance=new RetraitManagerImpl();
        }
        return instance;
    }

    public RetraitManagerImpl() {daoRetrait= DaoFactory.getRetraitDAO();}
    @Override
    //* ajout article
    public void ajouterRetrait(Retrait retrait) throws BLLException {
        try {
            daoRetrait.insert(retrait);
        } catch (DALException e) {
            throw new BLLException("Erreur ajout article", e);
        }
    }

    //*supprimer article
    @Override
    //
    public void supprimerRetrait(Integer id) throws BLLException {
        try {
            Retrait newRetrait = new Retrait();
            newRetrait.setNoAtricle(id);
            daoRetrait.delete(Integer.valueOf(id));
        } catch (DALException e) {
            e.printStackTrace();
            throw new BLLException("Erreur suppression pizza", e);
        }
    }

    //*modifier article
    @Override
    public void modifierRetrait(Retrait retrait) throws BLLException {
        try {
            daoRetrait.update(retrait);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur modification article", e);
        }
    }

    public List<Retrait> selectAllRetraits() throws BLLException {
        List<Retrait> retraitList = new ArrayList<>();
        try{
            retraitList = daoRetrait.selectAll();
        } catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur all retrait",e);
        }
        return retraitList;
    }
    public Retrait selectRetrait(int id)throws BLLException{
        Retrait retrait = null;
        try {
            retrait = daoRetrait.selectRetrait(id);
        }catch (DALException e){
            e.printStackTrace();
            throw new BLLException("Erreur select retrait ",e);
        }
        return retrait;
    }

}
