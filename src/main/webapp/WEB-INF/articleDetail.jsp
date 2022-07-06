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
    <link href="css/style.css" rel="stylesheet" />
    <title>Detail de l'article</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
                            <a class="nav-link" href="<%=request.getContextPath()%>">Encheres</a>
                        </li>
                        <c:if test="${isAllowed}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/venteArticleServlet">Vendre un Article</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/profilServlet">Mon Profil</a>
                        </li>
                    </ul>
                </div>
                <div class="d-flex">
                    </c:if>
                    <c:if test="${!isAllowed}">
                        <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-secondary me-3 mb-2 shadow-2">CONNEXION</button></a>
                        <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-primary me-3 shadow-2">CREER UN COMPTE</button></a>
                    </c:if>
                    <c:if test="${isAllowed}">
                        <a class="nav-link" href="${pageContext.request.contextPath}/profilServlet"><button type="button" class="btn btn-outline-success me-3 shadow-2">${user.pseudo}, ${user.credit} Crédits</button></a>
                        <a href="${pageContext.request.contextPath}/connexion?action=deconnexion"><button type="button" class="btn btn-warning me-3 shadow-2">DECONNEXION</button></a>
                    </c:if>
                </div>
            </div>
            <!-- Collapsible wrapper -->
        </div>
        <!-- Container wrapper -->
    </nav>
    <!-- Navbar -->
</header>
<main>

    <div class="container img-article mt-3 d-flex justify-content-center">
        <img src="${pageContext.request.contextPath}/img/logo-ENI-full.png" width="200"/>
    </div>
    <p class="h4 my-3 text-center">DETAIL DE LA VENTE</p>

    <div class="container">
        <div class="container d-flex justify-content-center">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-5 offset-md-1 mb-4">
                    <div class="card">
                        <img src="https://www.visitdubai.com/fr/places-to-visit/img-worlds-of-adventure" class="card-img-top" width="100%">
                        <div class="card-body pt-0 px-0">
                            <hr class="mt-2 mx-3">
                            <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                <div class="d-flex flex-column"><span class="text-muted">${article.nomArticle}</span><small class="text-muted">${article.description}</small></div>
                            </div>
                        </div>
                    </div>
                </div>

                        <div class="col-12 col-sm-12 col-md-6">
                            <div class="card w-responsive">
                                <button type="button" class="btn btn-secondary shadow-1" disabled><h4 class="text-center pt-2">PRIX DE DÉPART : ${article.prixInitial} POINTS</h4></button>
                                <div class="card-body pt-0 px-0">
                                    <div class="d-flex flex-row justify-content-between mb-0 px-3 mt-2">
                                        <small class="text-muted mt-1">FIN DE L'ENCHÈRE <strong>${article.dateFinEncheres}</strong></small>
                                        <small class="text-muted mt-1 pseudoUtilisateur">VENDU PAR : ${userPseudo.pseudo}</small>
                                    </div>
                                    <hr class="mt-2 mx-3">
                                    <div class="d-flex flex-row justify-content-between px-3 pb-2">
                                        <div class="d-flex"><span class="text-muted pseudoUtilisateur">ADRESSE DE RETRAIT :<br><strong> ${retrait.rue} <br>${retrait.codePostal} ${retrait.ville}</strong></span></div>
                                        <button type="button" class="btn btn-success btnNewPrice shadow-1 mb-2" disabled>
                                            <h6 class="text-center pt-1">DERNIER PRIX :<br> ${enchere.montantEnchere} POINTS</h6>
                                            <small class="pseudoUtilisateur">PAR ${userPseudo.pseudo}</small></button>
                                    </div>

                                    <div class="d-flex flex-row justify-content-center p-3 mid">
                                        <c:if test="${!isAllowed}">
                                            <small class="text-center">*enregistrez-vous pour enchèrir</small>
                                        </c:if>
                                        <c:if test="${isAllowed}">
                                        <form action="${pageContext.request.contextPath}/articleDetail" method="post" class="row g-3 align-items-center">
                                            <div class="col-9 col-sm-8">
                                                <div class="input-group">
                                                    <div class="input-group-text">POINTS</div>
                                                    <input type="number" class="form-control" id="inlineFormInputGroupUsername" name="creditEnchere" placeholder="${article.prixInitial}" min="${article.prixInitial}" step="10" />
                                                </div>
                                            </div>
                                            <div class="col-3 col-sm-4">
                                                <button type="submit" class="btn btn-primary shadow-1" >ENCHERIR</button>
                                            </div>
                                        </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div>
</main>
<!-- FOOTER -->
<section class="">
    <!-- FOOTER -->
    <section class="container">
        <!-- Footer -->
        <footer class="text-center text-white rounded-2 mb-2" style="background-color: #A1A0A0FF;">
            <!-- Grid container -->
            <div class="container p-4 pb-0 mt-5">
                <!-- Section: CTA -->
                <c:if test="${!isAllowed}">
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

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>