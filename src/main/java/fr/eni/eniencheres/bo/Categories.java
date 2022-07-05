package fr.eni.eniencheres.bo;

public class Categories {
    private Integer noCategorie;
    private String libelle;

    public Categories(String libelle) {
        this.libelle = libelle;
    }

    public Categories(Integer noCategorie, String libelle) {
        this.noCategorie = noCategorie;
        this.libelle = libelle;
    }

    public Integer getNoCategorie() {
        return noCategorie;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setNoCategorie(Integer noCategorie) {
        this.noCategorie = noCategorie;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @Override
    public String toString() {
        return "Categorie{" +
                "noCategorie=" + noCategorie +
                ", libelle='" + libelle + '\'' +
                '}';
    }
}

