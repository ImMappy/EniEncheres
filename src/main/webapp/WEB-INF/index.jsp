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
    <title>ENI - ENCHERES</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>
<body>
<header id="top">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg  container">
        <!-- Container wrapper -->
        <div class="container-fluid">
            <!-- Toggle button -->
            <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
            >
                <i class="fas fa-bars"></i>
            </button>

            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Navbar brand -->
                <a class="navbar-brand mt-2 mt-lg-0" href="#">
                    <img
                            src="${pageContext.request.contextPath}/img/logo-navbar.png"

                            alt="ENI Encheres logo" width="100rem"

                    />
                </a>

            </div>
            <!-- Collapsible wrapper -->

            <!-- Right elements -->
            <div class="d-flex align-items-center">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                    <li class="nav-item ">
                        <a class="nav-link mx-3" href="#">Encheres</a>
                    </li>
                </ul>
                <c:if test="${!isAllowed}">
                    <a class="h2 text-primary mx-3" href="${pageContext.request.contextPath}/connexion"><i class="fa-solid fa-power-off "></i></a>
                </c:if>
                <c:if test="${isAllowed}">
                <!-- Avatar -->
                <div class="dropdown">
                    <a
                            class="dropdown-toggle d-flex align-items-center hidden-arrow"
                            href="#"
                            id="navbarDropdownMenuAvatar"
                            role="button"
                            data-mdb-toggle="dropdown"
                            aria-expanded="false"
                    >
                        <img
                                src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
                                class="rounded-circle"
                                height="25"
                                alt="Black and White Portrait of a Man"
                                loading="lazy"
                        />
                    </a>
                    <ul
                            class="dropdown-menu dropdown-menu-end"
                            aria-labelledby="navbarDropdownMenuAvatar"
                    >
                        <li>
                            <a class="dropdown-item" href="#">Vendre un article</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">Mon profil</a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="#">Deconnexion</a>
                        </li>
                    </ul>
                </div>
            </div>
            </c:if>
            <!-- Right elements -->
        </div>
        <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->
</header>
<main class="container">
    <h2 class="text-center mt-5">Liste des encheres</h2>
    <section id="filter" class="row w-75 mx-auto border border rounded p-3">
        <form method="post" action="">
            <span>Filtres :</span>
            <div class="form-outline my-2">
                <i class="fas fa-search trailing"></i>
                <input type="text" name="articleIn" class="form-control" placeholder="Le nom de l'article contient"/>
            </div>
            <div class="row my-4">
                <div class="col-6">
                    <label for="category" class="d-flex align-items-center">Categorie</label>
                </div>
                <div class="col-6">
                    <select name="category" id="category" class="form-select ml-1">
                        <option value="0">Toutes</option>
                        <option value="1">Informatique</option>
                        <option value="2">Mode</option>
                        <option value="3">Autres</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
                    <input type="radio" name="filterRadio" id="achats">
                    <label for="achats">Achats</label>
                    <div>
                        <div>
                            <input type="checkbox" name="encheresOuvertes" id="encheresOuvertes">
                            <label for="encheresOuvertes">Encheres ouvertes</label>
                        </div>
                        <div>
                            <input type="checkbox" name="mesEncheres" id="mesEncheres">
                            <label for="mesEncheres">Mes encheres</label>
                        </div>
                        <div>
                            <input type="checkbox" name="encheresRemportees" id="encheresRemportees">
                            <label for="encheresRemportees">Mes encheres remportees</label>
                        </div>

                    </div>
                </div>
                <div class="col-6">
                    <input type="radio" name="filterRadio" id="ventes">
                    <label for="ventes">Mes ventes</label>
                    <div>
                        <div>
                            <input type="checkbox" name="ventesEnCours" id="ventesEnCours">
                            <label for="ventesEnCours">Mes ventes en cours</label>
                        </div>
                        <div>
                            <input type="checkbox" name="ventesNonCommencees" id="ventesNonCommencees">
                            <label for="ventesNonCommencees">Ventes non debutees</label>
                        </div>
                        <div>
                            <input type="checkbox" name="ventesTerminees" id="ventesTerminees">
                            <label for="ventesTerminees">Ventes terminees</label>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <button type="button" class="btn btn-success w-100 text-center mt-5"><i class="fas fa-search trailing"></i> Rechercher</button>
        </form>
    </section>
    <section id="articles-grid container">
        <div class="article-card d-flex align-items-center">
            <div class="article-image w-50 mr-4">
                <img src="https://lapierre-shopware.accell.cloud/thumbnail/64/bb/9f/1648474576/E-Sensium%202.2%20MY21%20Web%20-%20View%20PNG_800x800.png" alt="velo" class="w-100">

            </div>
            <div class="article-detail">
                <span class="categorie">Categorie</span>
                <h4>Article test</h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, possimus nostrum!</p>
                <div class="prix">
                    <small>Prix</small>
                    <div class="article-lien-detail">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/icons8-auction-66.png"/> </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <a href="#top">Revenir en haut</a>
    </footer>
</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
</body>
</html>