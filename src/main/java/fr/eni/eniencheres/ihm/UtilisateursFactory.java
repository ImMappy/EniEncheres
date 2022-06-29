package fr.eni.eniencheres.ihm;

import fr.eni.eniencheres.bll.UtilisateursManager;
import fr.eni.eniencheres.bll.UtilisateursManagerImpl;

public class UtilisateursFactory {
    public static UtilisateursManager getUtilisateursManager(){return new UtilisateursManagerImpl();
    }
}
