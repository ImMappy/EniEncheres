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
  <link href="${pageContext.request.contextPath}/css/style.css">
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
  <p class="h4 my-3 text-center">AJOUTER UN ARTICLE</p>
  <div class="container col-12 col-sm-6 col-md-5 col-lg-4 w-responsive">
    <section class="container d-flex justify-content-center border rounded-2 p-4 bg-white shadow-1">

        <!-- Formulaire Nouvelle Vente -->
      <form action="${pageContext.request.contextPath}/venteArticleServlet" method="post">
        <div class="d-flex flex-column">

            <div class="col-12">
                <input type="hidden" name="registerNoUtilisateur" value="${user.noUtilisateur}">

                <div class="form-outline mb-3">
                  <input type="text" id="formNomArticle" name="registerArticle" class="form-control" required/>
                  <label class="form-label" name="registerArticle" for="formNomArticle">Article</label>
                </div>

                <div class="form-outline mb-3">
                  <textarea class="form-control" id="textAreaDescription" name="registerDescription" rows="4" required></textarea>
                  <label class="form-label" name="registerDescription" for="textAreaDescription">Description</label>
                </div>

                <div class="form-group mb-3">
                  <select class="form-select" name="registerCategorie" aria-label="Default select example" required>
                    <option selected>Catégories</option>
                    <option value="1">Informatique</option>
                    <option value="2">Ameublement</option>
                    <option value="3">Vêtements</option>
                    <option value="4">Sport & Loisirs</option>
                  </select>
                </div>

                <div class="form-outline mb-3">
                  <input type="text" id="textAreaURLPhoto" name="registerPhoto" class="form-control" required/>
                  <label class="form-label" name="registerPhoto" for="textAreaURLPhoto">URL Photo (local : img/articles-img/image.png)</label>
                </div>

                <div class="form-outline mb-3">
                  <input type="number" id="typeNumber" name="registerMisaAPrix" class="form-control" required/>
                  <label class="form-label" name="registerMisaAPrix" for="typeNumber">Mise à prix</label>
                </div>

                  <div class="form-outline mb-3">
                    <input type="date" id="typeDateDebut" name="registerDateDebut" class="form-control" required/>
                    <label class="form-label" name="registerDateDebut" for="typeDateDebut">Date Début Enchère</label>
                  </div>

                  <div class="form-outline mb-3">
                    <input type="date" id="typeDateFin" name="registerDateFin" class="form-control" required/>
                    <label class="form-label" name="registerDateFin" for="typeDateFin">Date Fin Enchère</label>
                  </div>
            </div>

              <div class="col-12">
                <p class="h4 my-3 text-center">ADRESSE DE RETRAIT</p>

                <div class="form-outline mb-3">
                  <input type="text" id="formRetraitRue" name="registerRetraitRue" class="form-control"  value="${user.rue}" disabled/>
                  <label class="form-label" name="registerRetraitRue" for="formRetraitRue">Rue</label>
                </div>

                <div class="d-flex gap-2">
                  <div class="form-outline mb-3">
                    <input type="number" id="formRetraitCodePostal" name="registerRetraitCodePostal" class="form-control" value="${user.codePostal}" disabled/>
                    <label class="form-label" name="registerRetraitCodePostal" for="formRetraitCodePostal">Code Postal</label>
                  </div>

                  <div class="form-outline mb-3">
                    <input type="text" id="formRetraitVille" name="registerRetraitVille" class="form-control" value="${user.ville}" disabled/>
                    <label class="form-label" name="registerRetraitVille" for="formRetraitVille">Ville</label>
                  </div>
                </div>
              </div>

              <div class="col-12 mt-3 text-center">
                <button type="submit" class="btn btn-primary shadow-1 mb-2">Enregistrer</button>
                <button type="reset" class="btn btn-secondary shadow-1 mb-2">Effacer</button>
                <a href="<%=request.getContextPath()%>"><button type="button" class="btn btn-outline-danger shadow-1 mb-2">Annuler la vente</button></a>
              </div>

        </div>

      </form>
    </section>
  </div>

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