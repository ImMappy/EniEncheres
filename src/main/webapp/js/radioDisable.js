function check() {
    if (document.getElementById('achats').checked) {
        document.getElementById('ventesEnCours').disabled = true;
        document.getElementById('ventesNonCommencees').disabled = true;
        document.getElementById('ventesTerminees').disabled = true;

        document.getElementById('encheresOuvertes').disabled = false;
        document.getElementById('mesEncheres').disabled = false;
        document.getElementById('encheresRemportees').disabled = false;

    } else if (document.getElementById('ventes').checked) {
        document.getElementById('ventesEnCours').disabled = false;
        document.getElementById('ventesNonCommencees').disabled = false;
        document.getElementById('ventesTerminees').disabled = false;

        document.getElementById('encheresOuvertes').disabled = true;
        document.getElementById('mesEncheres').disabled = true;
        document.getElementById('encheresRemportees').disabled = true;
    }
}