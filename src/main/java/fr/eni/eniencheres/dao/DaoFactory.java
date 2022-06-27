package fr.eni.eniencheres.dao;

import fr.eni.eniencheres.dal.UtilisateursDAO;
import fr.eni.eniencheres.dal.UtilisateursDAOImpl;

public class DaoFactory {
public static UtilisateursDAO getUtilisateursDao(){
        return new UtilisateursDAOImpl();
    }
}
