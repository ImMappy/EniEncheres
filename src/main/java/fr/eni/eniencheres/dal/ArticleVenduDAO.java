package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.ArticleVendu;

import java.util.List;

public interface ArticleVenduDAO {
    //* partie INSERT
    //* se connecter à la Base de donnée
    void insert(ArticleVendu articleVendu)throws DALException;

    //*Partie SELECT_BY_ID
    ArticleVendu selectById(Integer i) throws DALException;

    void delete(Integer id) throws DALException;

    //*Partie UPDATE
    void update(ArticleVendu articleVendu) throws DALException;

    //* SelectALL
    List<ArticleVendu> selectAll()  throws DALException;
}
