package fr.eni.eniencheres.bll;

import fr.eni.eniencheres.Exceptions.BLLException;
import fr.eni.eniencheres.bo.Utilisateurs;

import java.util.List;

public interface UtilisateursManager {
    public void ajouterUtilisateur(Utilisateurs user) throws BLLException;
    public void supprimerUtilisateur(int id) throws BLLException;
    public void modifierUtilisateur(Utilisateurs user)throws BLLException;
    public List getAllUtilisateurs() throws BLLException;
    public Utilisateurs getUtilisateurById(int id) throws BLLException;
    Utilisateurs getUser(String pseudo, String motDePasse) throws BLLException;

    Utilisateurs getPseudo(int id) throws BLLException;
}
