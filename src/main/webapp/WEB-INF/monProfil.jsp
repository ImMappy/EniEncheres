<%@ page import="fr.eni.eniencheres.bo.Utilisateurs" %>
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
    <link href="css/styles.css" rel="stylesheet"/>
    <title>Mon Profil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>
<body>
<body>
<% Utilisateurs user = (Utilisateurs) session.getAttribute("user"); %>
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
                        <li class="nav-item "><a class="nav-link mx-2" href="${pageContext.request.contextPath}/venteArticleServlet">Vendre un article</a></li>
                        <li class="nav-item "><a class="nav-link mx-2" href="${pageContext.request.contextPath}/profilServlet">Mon profil</a></li>
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
${user}
<main>

                <div id="MonProfil" class="d-flex justify-content-center my-4">
                    <h2>Mon Profil</h2>
                </div>
                <section class="vh-100">
                    <div class="container-fluid">
                        <div >
                            <div >

                                <form class="w-25 mx-auto" method="post" action="${pageContext.request.contextPath}/profilServlet">
                                    <input type="hidden" name="noUtilisateur" value="${user.noUtilisateur}"/>
                                    <!-- Username input -->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerPseudo" id="registerUsername" class="form-control" value="${user.pseudo}" />
                                            <label class="form-label" for="registerUsername">Pseudo</label>
                                        </div>

                                        <!-- Name input -->
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerNom" id="registerName" class="form-control"value="${user.nom}"/>
                                            <label class="form-label" for="registerName">Nom</label>
                                        </div>
                                    </div>
                                    <!-- Surname input-->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerPrenom" id="registerSurname" class="form-control" value="${user.prenom}"/>
                                            <label class="form-label" for="registerSurname">Prénom</label>
                                        </div>

                                        <!-- E-Mail input -->
                                        <div class="form-outline mb-4">
                                            <input type="email" name="registerEmail" id="registerEmail" class="form-control" value="${user.email}" />
                                            <label class="form-label" for="registerEmail">E-mail</label>
                                        </div>
                                    </div>
                                    <!-- Phone input -->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerTelephone" id="registerTel" class="form-control" value="${user.telephone}" />
                                            <label class="form-label" for="registerTel">Téléphone</label>
                                        </div>

                                        <!-- Rue input -->
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerRue" id="registerRue" class="form-control" value="${user.rue}" />
                                            <label class="form-label" for="registerRue">Rue</label>
                                        </div>
                                    </div>
                                    <!-- Code Postal input -->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerCodePostal" id="registerPostalCode" class="form-control" value="${user.codePostal}" />
                                            <label class="form-label" for="registerPostalCode">Code Postal</label>
                                        </div>

                                        <!-- Ville input -->
                                        <div class="form-outline mb-4">
                                            <input type="text" name="registerVille" id="registerVille" class="form-control" value="${user.ville}" />
                                            <label class="form-label" for="registerVille">Ville</label>
                                        </div>
                                    </div>

                                    <!-- Password input -->
                                    <div class="col-12">
                                        <div class="form-outline mb-4">
                                            <input type="password" name="registerPassword" id="registerPassword" class="form-control"/>
                                            <label class="form-label" for="registerPassword">Mot de Passe</label>
                                        </div>
                                    </div>
                                    <!-- New Password input -->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <input type="password" name="registerPassword" id="registerPassword" class="form-control" />
                                            <label class="form-label" for="registerPassword">Nouveau Mot de Passe</label>
                                        </div>

                                        <!-- Check new password input -->
                                        <div class="form-outline mb-4">
                                            <input type="password" name="registerPassword" id="registerPassword" class="form-control" />
                                            <label class="form-label" for="registerPassword">Confirmation</label>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="Credit" class="col-sm-2 col-form-label">Crédit</label>
                                        <div class="col-sm-10">
                                            <input type="text" readonly class="form-control-plaintext" id="Credit" value="${user.credit}" >
                                        </div>
                                    </div>

                                    <!-- Bouton Input -->
                                    <div class="col d-flex gap-4">
                                        <div class="form-outline mb-4">
                                            <button type="submit" class="btn btn-primary btn-block mb-3" >ENREGISTRER</button>
                                        </div>
                                        <div class="form-outline mb-4">
                                            <a href="/profilServlet?action=supprimer&noUtilisateur=${user.noUtilisateur}/profilServlet"><button type="submit" class="btn btn-primary btn-block mb-3" >SUPPRIMER</button></a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section >
</main>
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


                <!-- Bootstrap JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
                <!-- MDB -->
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
</body>
</html>