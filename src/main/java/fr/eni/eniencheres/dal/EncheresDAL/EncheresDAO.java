package fr.eni.eniencheres.dal.EncheresDAL;

import fr.eni.eniencheres.Exceptions.DALException;
import fr.eni.eniencheres.bo.Enchere;

import java.util.List;

public interface EncheresDAO {
    void insertEnchere(Enchere enchere) throws DALException;
    Enchere selectEnchereId(int id) throws DALException;
    Enchere selectMontant(int id) throws DALException;
}
