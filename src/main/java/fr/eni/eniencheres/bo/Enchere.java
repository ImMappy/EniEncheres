package fr.eni.eniencheres.bo;

import java.time.LocalDate;

public class Enchere {
    private int noEnchere;
    private LocalDate dateEnchere;
    private int montantEnchere;
    private int noArticle;
    private int noUtilisateur;

    public Enchere(int montantEnchere) {
        this.montantEnchere = montantEnchere;
    }

    @Override
    public String toString() {
        return String.valueOf(montantEnchere);
    }

    public Enchere(int noEnchere, LocalDate dateEnchere, int montantEnchere, int noArticle, int noUtilisateur) {
        this.noEnchere = noEnchere;
        this.dateEnchere = dateEnchere;
        this.montantEnchere = montantEnchere;
        this.noArticle = noArticle;
        this.noUtilisateur = noUtilisateur;
    }

    public Enchere(LocalDate dateEnchere, int montantEnchere, int noArticle, int noUtilisateur) {
        this.dateEnchere = dateEnchere;
        this.montantEnchere = montantEnchere;
        this.noArticle = noArticle;
        this.noUtilisateur = noUtilisateur;
    }

    public int getNoEnchere() {
        return noEnchere;
    }

    public void setNoEnchere(int noEnchere) {
        this.noEnchere = noEnchere;
    }

    public LocalDate getDateEnchere() {
        return dateEnchere;
    }

    public void setDateEnchere(LocalDate dateEnchere) {
        this.dateEnchere = dateEnchere;
    }

    public int getMontantEnchere() {
        return montantEnchere;
    }

    public void setMontantEnchere(int montantEnchere) {
        this.montantEnchere = montantEnchere;
    }

    public int getNoArticle() {
        return noArticle;
    }

    public void setNoArticle(int noArticle) {
        this.noArticle = noArticle;
    }

    public int getNoUtilisateur() {
        return noUtilisateur;
    }

    public void setNoUtilisateur(int noUtilisateur) {
        this.noUtilisateur = noUtilisateur;
    }
}
