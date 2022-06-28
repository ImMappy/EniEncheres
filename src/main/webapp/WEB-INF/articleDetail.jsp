<%--
  Created by IntelliJ IDEA.
  User: luis
  Date: 28/06/2022
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Search Meta -->
    <meta name="title" content="ENI - ENCHERES - HD2WM-144" />
    <meta name="description" content="Sites Enchères en ligne ENI" />
    <meta name="author" content="Romain.Helard" />

    <!-- FavIcons Settings -->
    <link rel="icon" href="img/favicon.png" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet"/>
    <!-- BOOTSTRAP -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- Normalize CSS and Steelsheets -->
    <link href="css/normalize.css" rel="stylesheet" />
    <title>Detail de l'article</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<body>
    <h2>Detail vente</h2>
    <section class="container">
        <div class="img-article">
            Image
        </div>
        <div class="details">
            <ul>
                <li class="h3">PC Gamer pour travailler</li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Description</span>
                        <p>Description text</p>
                    </div>
                </li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Categorie</span>
                        <span>Informatique</span>
                    </div>
                </li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Meilleure offre</span>
                        <span>Offre 1</span>
                        <span>Offre 2</span>
                    </div>

                </li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Fin de l'enchere</span>
                        <span>Date</span>
                    </div>
                </li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Retrait :</span>
                        <span>Adresse</span>
                    </div>
                </li>
                <li>
                    <div class="d-flex">
                        <span class="h3">Vendeur :</span>
                        <span>Utilisateur</span>
                    </div>
                </li>
                <li>
                    <form method="post" action="">
                        <div class="d-flex">
                            <label for="montant">Proposition</label>
                            <input type="number" name="montant" id="montant">
                        </div>
                        <button type="button" class="btn btn-primary">Encherir</button>
                    </form>
                </li>
            </ul>
        </div>
    </section>

</body>
</html>
