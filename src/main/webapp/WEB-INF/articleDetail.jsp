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
<header id="top">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg container bg-transparent shadow-0">
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
                <a class="navbar-brand mt-2 mt-lg-0" href="<%=request.getContextPath()%>">
                    <img src="${pageContext.request.contextPath}/img/logo-navbar.png" alt="ENI Encheres logo" width="80"/>
                </a>
            </div>
            <!-- Collapsible wrapper -->

            <!-- Right elements -->
            <div class="d-flex align-items-center">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item "><a class="nav-link mx-2" href="#">Encheres</a></li>
                    <c:if test="${!isAllowed}">
                        <li class="nav-item "><a class="nav-link mx-2" href="#">Vendre un article</a></li>
                        <li class="nav-item "><a class="nav-link mx-2" href="#">Mon profil</a></li>
                    </c:if>
                    <c:if test="${isAllowed}">
                        <li class="nav-item "><a class="nav-link mx-2" href="#">Créer mon Profil</a></li>
                    </c:if>
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
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                        <li><a class="dropdown-item" href="#">Vendre un article</a></li>
                        <li><a class="dropdown-item" href="#">Mon profil</a></li>
                        <li><a class="dropdown-item" href="#">Deconnexion</a></li>
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
<main>
    <h2 class="text-center">Detail de la vente</h2>
    <section class="container w-50 border border p-3">
        <div class="row ">
            <div class="col-12 col-sm-5">
                <img src="${pageContext.request.contextPath}/img/logo-ENI-full.png" width="180">
            </div>
            <div class="col-12 col-sm-7 ">
                <div class="row">
                    <div class="col-12 col-sm-12 my-3">
                        <span class="h5">PC Gamer pour travailler</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Description</span>
                    </div>
                    <div class="col-12 col-sm-7">
                        <div class="w-75">
                            <p>TEXT TEXT TEXT TEXTTEXT TEXTTEXT TEXTTEXT TEXTTEXT TEXT</p>
                        </div>

                    </div>
                </div>
                <div class="row ">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Meilleure offre</span>
                    </div>
                    <div class="col-12 col-sm-7">
                        <span>210 points</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Mise a prix :</span>
                    </div>
                    <div class="col-12 col-sm-7">
                       <span>185 points</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-7 offset-5">
                <div class="row">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Fin de l'enchere</span>
                    </div>
                    <div class="col-12 col-sm-7">
                        <p>09/10/2018</p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Retrait</span>
                    </div>
                    <div class="col-12 col-sm-7">
                        <p>10 Allee des Alouettes 44800 Saint Herblain</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 col-sm-5">
                        <span class="h5">Vendeur</span>
                    </div>
                    <div class="col-12 col-sm-7">
                        <span>Jojo44</span>
                    </div>
                </div>
                <div class="row">
                       <form action="${pageContext.request.contextPath}/articleDetail">
                           <div class="d-flex my-3">
                               <div class="col-12 col-sm-5">
                                   <label class="form-label" for="proposition">Proposition</label>
                               </div>
                               <div class="col-12 col-sm-7">
                                    <input class="form-control w-50" type="number" name="proposition" id="proposition"/>
                               </div>
                           </div>
                           <button type="button" class="btn btn-primary" name="enchere">Encherir</button>
                       </form>
                   </div>
                </div>
            </div>
        </div>

    </section>
</main>
</body>
</html>
