package fr.eni.eniencheres.bll.EnchereBLL;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.bo.Enchere;

import java.util.List;

public interface EnchereManager {
    void ajoutEnchere(Enchere enchere)throws BLLException;
    Enchere selectEnchereId(int id) throws BLLException;
    Enchere getMontant(int id)throws BLLException;
}
