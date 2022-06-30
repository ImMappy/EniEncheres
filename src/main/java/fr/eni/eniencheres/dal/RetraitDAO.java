package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.Retrait;

import java.util.List;

public interface RetraitDAO {

    void insert(Retrait retrait)throws DALException;

    Retrait selectById(Integer i) throws DALException;

    void delete(Integer id) throws DALException;

    void update(Retrait retrait) throws DALException;


}
