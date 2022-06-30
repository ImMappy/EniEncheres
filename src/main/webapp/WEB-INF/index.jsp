<%@ page import="java.util.List" %>
<%@ page import="fr.eni.eniencheres.bo.Categories" %>
<%@ page import="fr.eni.eniencheres.bll.CategoriesManager" %>
<%@ page import="java.util.ArrayList" %>
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

</head>
<body>

<header id="top">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-transparent shadow-0">
        <!-- Container wrapper -->
        <div class="container">
            <!-- Navbar brand -->
            <a class="navbar-brand me-2" href="<%=request.getContextPath()%>">
                <img src="img/logo-navbar.png" height="35" alt="ENI LOGO" loading="lazy" style="margin-top: -1px;"/>
            </a>
            <!-- Toggle button -->
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarButtonsExample" aria-controls="navbarButtonsExample" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <!-- Collapsible wrapper -->
            <div class="collapse navbar-collapse" id="navbarButtonsExample">
                <!-- Left links -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="<%=request.getContextPath()%>">ENI ENCHERES</a>
                    </li>
                </ul>
                <!-- Left links -->

                <div class="d-flex align-items-center">
                    <ul class="navbar-nav me-3 mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Encheres</a>
                        </li>
                        <c:if test="${!isAllowed}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/venteArticleServlet">Vendre un Article</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/profilServlet">Mon Profil</a>
                        </li>
                    </ul>
                    </c:if>
                    <c:if test="${isAllowed}">
                        <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-secondary px-3 ms-2 me-2 shadow-2">CONNEXION</button></a>
                        <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-primary me-3 shadow-2">CREER UN COMPTE</button></a>
                    </c:if>
                    <c:if test="${!isAllowed}">
                        <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-warning me-3 shadow-2">DECONNEXION</button></a>
                    </c:if>
                </div>
            </div>
            <!-- Collapsible wrapper -->
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
                <div class="col-1   ">
                    <label for="category" class="mt-2">Categorie</label>
                </div>
                <div class="col-11">
                    <select name="category" id="category" class="form-select ms-3 w-75">
                        <c:forEach var = "cat" items="${categoriesList}">
                        <option value="${cat.key}">${cat.value}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <c:if test="${isAllowed}">
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
                    <input type="radio" name="filterRadio" id="ventes" ${disableRadio}>
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
            </c:if>
            <button type="button" class="btn btn-light w-100 text-center mt-5 shadow-2"><i class="fas fa-search trailing"></i> Rechercher</button>
        </form>
    </section>

    <!-- CARD ARTICLES -->
    <div id="containerCard">
        <div class="container-fluid d-flex justify-content-center">
            <div class="row mt-5">
                <div class="col-xl-3 col-lg-4 col-sm-6 col-md-6 col-12 mt-3">
                    <div class="card">
                        <img src="img/articles-img/ASUSA15-TUF507RE-HN012W.png" class="card-img-top" width="100%">
                        <div class="card-body pt-0 px-0">
                            <div class="d-flex flex-row justify-content-between mb-0 px-3">
                                <small class="text-muted mt-1">PRIX</small>
                                <h6>210 POINTS</h6>
                            </div>
                            <hr class="mt-2 mx-3">
                            <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                <div class="d-flex flex-column"><span class="text-muted">ASUS A15 TUF507RE-HN012W</span><small class="text-muted">AMD Ryzen 7 6800H 16 Go SSD 512 Go 15.6" LED Full HD 144 Hz NVIDIA GeForce RTX 3050 Ti 4 Go Wi-Fi 6/Bluetooth Webcam Windows 11 Famille</small></div>
                            </div>
                            <div class="d-flex flex-row justify-content-between p-3 mid">
                                <div class="d-flex flex-column"><small class="text-muted mb-1">VENDEUR</small><div class="d-flex flex-row"><div class="d-flex flex-column ml-1"><h6 class="ml-1">JOJO44</h6></div></div></div>
                                <div class="d-flex flex-column"><small class="text-muted mb-1">FIN DE L'ENCHERE</small><div class="d-flex flex-row"><h6 class="ml-1">10/08/2022</h6></div></div>
                            </div>
                            <div class="mx-3 mt-1 mb-2"><a href="${pageContext.request.contextPath}/articleDetail"><button type="button" class="btn btn-danger btn-block"><small>DETAIL DE L'ARTICLE</small></button></a></div>
                            <small class="d-flex justify-content-center text-muted">*enregistrez-vous pour enchèrir</small>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-sm-6 col-md-6 col-12 mt-3">
                    <div class="card">
                        <img src="img/articles-img/ASUS-CHROMEBOOK-PRO-C436FFA-E10309.png" class="card-img-top" width="100%">
                        <div class="card-body pt-0 px-0">
                            <div class="d-flex flex-row justify-content-between mb-0 px-3">
                                <small class="text-muted mt-1">PRIX</small>
                                <h6>420 POINTS</h6>
                            </div>
                            <hr class="mt-2 mx-3">
                            <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                <div class="d-flex flex-column"><span class="text-muted">ASUS Pro Flip 14 C436FFA-E10309</span><small class="text-muted">Intel Core i5-10210U 16 Go SSD 128 Go 14" LED Tactile Full HD Wi-Fi AX/Bluetooth Webcam Chrome OS Fréquence 75 Hz - Autonomie 18 Heures</small></div>
                            </div>
                            <div class="d-flex flex-row justify-content-between p-3 mid">
                                <div class="d-flex flex-column"><small class="text-muted mb-1">VENDEUR</small><div class="d-flex flex-row"><div class="d-flex flex-column ml-1"><h6 class="ml-1">DADA85</h6></div></div></div>
                                <div class="d-flex flex-column"><small class="text-muted mb-1">FIN DE L'ENCHERE</small><div class="d-flex flex-row"><h6 class="ml-1">17/10/2022</h6></div></div>
                            </div>
                            <div class="mx-3 mt-1 mb-2"><a href="${pageContext.request.contextPath}/articleDetail"><button type="button" class="btn btn-danger btn-block"><small>DETAIL DE L'ARTICLE</small></button></a></div>
                            <small class="d-flex justify-content-center text-muted">*enregistrez-vous pour enchèrir</small>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-sm-6 col-md-6 col-12 mt-3">
                    <div class="card">
                        <img src="img/articles-img/STEELSERIES-AEROX-3-WIRELESS.png" class="card-img-top" width="100%">
                        <div class="card-body pt-0 px-0">
                            <div class="d-flex flex-row justify-content-between mb-0 px-3">
                                <small class="text-muted mt-1">PRIX</small>
                                <h6>60 POINTS</h6>
                            </div>
                            <hr class="mt-2 mx-3">
                            <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                <div class="d-flex flex-column"><span class="text-muted">SteelSeries Aerox 3 Wireless</span><small class="text-muted">Souris sans fil pour gamer - droitier - Bluetooth/RF 2.4 GHz - capteur optique 18000 dpi - 6 boutons programmables - rétro-éclairage RGB</small></div>
                            </div>
                            <div class="d-flex flex-row justify-content-between p-3 mid">
                                <div class="d-flex flex-column"><small class="text-muted mb-1">VENDEUR</small><div class="d-flex flex-row"><div class="d-flex flex-column ml-1"><h6 class="ml-1">RORO44</h6></div></div></div>
                                <div class="d-flex flex-column"><small class="text-muted mb-1">FIN DE L'ENCHERE</small><div class="d-flex flex-row"><h6 class="ml-1">03/11/2022</h6></div></div>
                            </div>
                            <div class="mx-3 mt-1 mb-2"><a href="${pageContext.request.contextPath}/articleDetail"><button type="button" class="btn btn-danger btn-block"><small>DETAIL DE L'ARTICLE</small></button></a></div>
                            <small class="d-flex justify-content-center text-muted">*enregistrez-vous pour enchèrir</small>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3 col-lg-4 col-sm-6 col-md-6 col-12 mt-3">
                    <div class="card">
                        <img src="img/articles-img/Brother-DCP-1612WVB.png" class="card-img-top" width="100%">
                        <div class="card-body pt-0 px-0">
                            <div class="d-flex flex-row justify-content-between mb-0 px-3">
                                <small class="text-muted mt-1">PRIX</small>
                                <h6>125 POINTS</h6>
                            </div>
                            <hr class="mt-2 mx-3">
                            <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                <div class="d-flex flex-column"><span class="text-muted">Brother DCP-1612WVB All In Box</span><small class="text-muted">Imprimante multifonction laser monochrome 3-en-1 (USB 2.0/Wi-Fi) / Idéale pour les professionnels qui travaillent chez eux ainsi que pour les petites entreprises</small></div>
                            </div>
                            <div class="d-flex flex-row justify-content-between p-3 mid">
                                <div class="d-flex flex-column"><small class="text-muted mb-1">VENDEUR</small><div class="d-flex flex-row"><div class="d-flex flex-column ml-1"><h6 class="ml-1">LUIS95</h6></div></div></div>
                                <div class="d-flex flex-column"><small class="text-muted mb-1">FIN DE L'ENCHERE</small><div class="d-flex flex-row"><h6 class="ml-1">21/07/2022</h6></div></div>
                            </div>
                            <div class="mx-3 mt-1 mb-2"><button type="button" class="btn btn-danger btn-block"><small>DETAIL DE L'ARTICLE</small></button></div>
                            <small class="d-flex justify-content-center text-muted">*enregistrez-vous pour enchèrir</small>
                        </div>
                    </div>
                </div>
            </div>
            <!-- FIN CARD ARTICLES -->
        </div>
    </div>

    <!-- FOOTER -->
    <section class="">
        <!-- Footer -->
        <footer class="text-center text-white rounded-2 mb-2" style="background-color: #0a4275;">
            <!-- Grid container -->
            <div class="container p-4 pb-0 mt-5">
                <!-- Section: CTA -->
                <c:if test="${isAllowed}">
                    <section class="">
                        <p class="d-flex justify-content-center align-items-center">
                            <span class="me-3">Enregistrez-vous Gratuitement</span>
                            <a class="h2 text-primary mx-3" href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-outline-light btn-rounded">
                                CREER MON COMPTE
                            </button></a>
                        </p>
                    </section>
                </c:if>
                <!-- Section: CTA -->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2022 Copyright : ROMAIN HELARD / DAVID DESTREE / LUIS MARIA</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </section>
    <!-- FIN FOOTER -->



</main>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>