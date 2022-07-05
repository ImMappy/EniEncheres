package fr.eni.eniencheres.bo;

public class Retrait {
    private int noAtricle;
    private String rue;
    private String codePostal;
    private String ville;

    public Retrait() {
    }

    public Retrait(int noAtricle, String rue, String codePostal, String ville) {
        this.noAtricle = noAtricle;
        this.rue = rue;
        this.codePostal = codePostal;
        this.ville = ville;
    }

    public Retrait(String rue, String codePostal, String ville) {
        this.rue = rue;
        this.codePostal = codePostal;
        this.ville = ville;
    }

    public String getRue() {
        return rue;
    }


    public int getNoAtricle() {
        return noAtricle;
    }

    public void setNoAtricle(int noAtricle) {
        this.noAtricle = noAtricle;
    }

    public String getCodePostal() {
        return codePostal;
    }

    public String getVille() {
        return ville;
    }

    public void setRue(String rue) {
        this.rue = rue;
    }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    @Override
    public String toString() {
        return "Retrait{" +
                "noAtricle=" + noAtricle +
                ", rue='" + rue + '\'' +
                ", codePostal='" + codePostal + '\'' +
                ", ville='" + ville + '\'' +
                '}';
    }
}
