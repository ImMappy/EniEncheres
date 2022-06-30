package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bo.Retrait;
import fr.eni.eniencheres.dal.DALException;
import fr.eni.eniencheres.dal.RetraitDAO;
import fr.eni.eniencheres.dao.DaoFactory;

import java.util.List;

public class RetraitManagerImpl implements RetraitManager{
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

    //*SelectById
    @Override
    public Retrait selectById(Integer id) throws BLLException {
        Retrait retrait;
        try {
            retrait = daoRetrait.selectById(id);
        } catch (DALException e) {
            e.printStackTrace();
            throw new BLLException("Erreur select by id",e);
        }
        return retrait;
    }

    @Override
    public List<Retrait> selectAll() throws BLLException {
        return null;
    }

}
