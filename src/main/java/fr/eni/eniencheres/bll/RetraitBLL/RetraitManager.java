package fr.eni.eniencheres.bll.RetraitBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.Retrait;

import java.util.List;

public interface RetraitManager {
    //* ajout article
    void ajouterRetrait (Retrait retrait) throws BLLException;

    //*supprimer article
    //
    void supprimerRetrait(Integer id) throws BLLException;

    //*modifier article
    void modifierRetrait(Retrait retrait) throws BLLException;

    List<Retrait> selectAllRetraits() throws BLLException;

    Retrait selectRetrait(int id) throws BLLException;
}
