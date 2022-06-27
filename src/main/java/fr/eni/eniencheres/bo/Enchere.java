package fr.eni.eniencheres.bo;

import java.time.LocalDate;

public class Enchere {
    private LocalDate dateEnchere;
    private float montantEnchere;

    public Enchere(LocalDate dateEnchere, float montantEnchere) {
        this.dateEnchere = dateEnchere;
        this.montantEnchere = montantEnchere;
    }

    public LocalDate getDateEnchere() {
        return dateEnchere;
    }

    public float getMontantEnchere() {
        return montantEnchere;
    }

    public void setDateEnchere(LocalDate dateEnchere) {
        this.dateEnchere = dateEnchere;
    }

    public void setMontantEnchere(float montantEnchere) {
        this.montantEnchere = montantEnchere;
    }

    @Override
    public String toString() {
        return "Enchere{" +
                "dateEnchere=" + dateEnchere +
                ", montantEnchere=" + montantEnchere +
                '}';
    }
}
