package fr.eni.eniencheres.dal;

import fr.eni.eniencheres.bo.Utilisateurs;

import java.util.List;

public interface UtilisateursDAO {
    public void insertUtilisateur(Utilisateurs user) throws DALException;
    public void deleteUtilisateur(int id) throws DALException;
    public void updateUtilisateur(Utilisateurs user) throws DALException;
    public Utilisateurs selectUtilisateurById(int id)throws DALException;
    public List selectAllUtilisateurs()throws DALException;

}
