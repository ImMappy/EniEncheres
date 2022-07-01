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
            <a href="${pageContext.request.contextPath}/connexion"><button type="button" class="btn btn-secondary px-3 ms-2 me-2 shadow-2">CONNEXION</button></a>
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
  <h2 class="text-center my-5">Nouvelle vente</h2>
  <section class="container">
    <div class="d-flex w-75 mx-auto justify-content-around border border rounded p-4">
      <div class="img-article me-4">
        <img src="${pageContext.request.contextPath}/img/logo-ENI-full.png" width="200"/>
      </div>

      <!-- Debut Formulaire -->
      <form action="${pageContext.request.contextPath}/venteArticleServlet" method="post">
        <!-- Vente Article -->
        <div class="d-flex my-2">
          <input type="hidden" name="registerNoUtilisateur" value="${user.noUtilisateur}">
          <label for="registerArticle" class="form-label h5 me-5">Article</label>
          <input type="text" name="registerArticle" class="form-control" id="registerArticle">
        </div>
        <!-- Vente Description -->
        <div class="d-flex my-2">
          <label for="registerDescription" class="form-label h5 me-1">Description</label>
          <textarea class="form-control" name="registerDescription" id="registerDescription" rows="5" style="resize: none"></textarea>
        </div>
        <!-- Vente Catégories -->
        <div class="d-flex my-2">
          <label class="form-label h5 me-5" for="registerCategorie">Catégorie</label>
          <select class="custom-select mr-sm-2" name="registerCategorie" id="registerCategorie">
            <option selected>Choose...</option>
            <option value="1">Informatique</option>
            <option value="2">Ameublement</option>
            <option value="3">Vetements</option>
            <option value="4">Sports & Loisirs</option>
          </select>
        </div>
        <!-- Vente Photo Article -->
        <div class="d-flex my-2">
          <label for="registerPhoto" class="form-label h5 me-3">Photo article</label>
          <input type="text" id="registerPhoto" class="form-control" name="registerPhoto"/>
        </div>
        <!-- Vente Mise à prix -->
        <div class="d-flex my-2">
          <label for="registerMisaAPrix" class="form-label h5 me-5">Mise à prix</label>
          <input type="number" name="registerMisaAPrix" class="form-control" id="registerMisaAPrix">
        </div>
        <!-- Vente Date Début -->
        <div class="d-flex my-2">
          <label for="registerDateDebut" class="form-label h5 me-5">Début</label>
          <input type="date" name="registerDateDebut" class="form-control" id="registerDateDebut">
        </div>
        <!-- Vente Date Fin -->
        <div class="d-flex my-2">
          <label for="registerDateFin" class="form-label h5 me-5">Fin</label>
          <input type="date" name="registerDateFin" class="form-control" id="registerDateFin">
        </div>

        <!-- récupération info Vendeur -->
        <fieldset class=" border p-2">
          <legend class="scheduler-border">Retrait</legend>
          <div class="d-flex my-2">
            <label for="InputRue" class="form-label h5 me-5">Rue</label>
            <input type="text" name="username" class="form-control" id="InputRue" value="${user.rue}" disabled>
          </div>
          <div class="d-flex my-2">
            <label for="InputCp" class="form-label h5 me-5">Code postal</label>
            <input type="number" name="username" class="form-control" id="InputCp" value="${user.codePostal}" disabled>
          </div>
          <div class="d-flex my-2">
            <label for="InputVille" class="form-label h5 me-5">Ville</label>
            <input type="text" name="username" class="form-control" id="InputVille" value="${user.ville}" disabled>
          </div>
        </fieldset>

        <!-- Envoi Formulaire -->
        <div class="me-5">
          <button type="submit" class="btn btn-primary">Enregistrer</button>
          <button type="reset" class="btn btn-secondary">Annuler</button>
          <a href="<%=request.getContextPath()%>"><button type="button" class="btn btn-danger">Annuler la vente</button></a>
        </div>
      </form>

    </div>
  </section>

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