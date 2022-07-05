package fr.eni.eniencheres.dal.RetraitDAL;

import fr.eni.eniencheres.bo.Retrait;
import fr.eni.eniencheres.Exceptions.DALException;

import java.util.List;

public interface RetraitDAO {

    void insert(Retrait retrait)throws DALException;

    Retrait selectRetrait(int id) throws  DALException;

    List selectAll() throws DALException;

    void delete(Integer id) throws DALException;

    void update(Retrait retrait) throws DALException;




}
