package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.bo.Retrait;

import java.util.List;

public interface RetraitManager {
    //* ajout article
    void ajouterRetrait (Retrait retrait) throws BLLException;

    //*modifier article
    void modifierRetrait(Retrait retrait) throws BLLException;

    //*SelectById
    Retrait selectById(Integer id) throws BLLException;

    List<Retrait> selectAll() throws BLLException;
}
