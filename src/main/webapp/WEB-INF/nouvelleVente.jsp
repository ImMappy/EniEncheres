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
  <link href="${pageContext.request.contextPath}/css/style.css">
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
<main>
  <h2 class="text-center my-5">Nouvelle vente</h2>
  <section class="container">
    <div class="d-flex w-75 mx-auto justify-content-around border border rounded p-4">
      <div class="img-article me-4">
        <img src="${pageContext.request.contextPath}/img/logo-ENI-full.png" width="200"/>
      </div>
      <div class="details">
        <ul class="list-unstyled">
          <li>
            <div class="d-flex my-2">
              <label for="InputArticle" class="form-label h5 me-5">Article</label>
              <input type="text" name="username" class="form-control" id="InputArticle">
          </li>
          <li>
            <div class="d-flex my-2">
              <label for="Description" class="form-label h5 me-1">Description</label>
              <textarea class="form-control" id="Description" rows="5" style="resize: none"></textarea>
            </div>
          </li>
          <li>
            <div class="d-flex my-2">
              <label class="form-label h5 me-5" for="inlineFormCustomSelect">Catégorie</label>
              <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                <option selected>Choose...</option>
                <option value="1">One</option>
                <option value="2">Two</option>
                <option value="3">Three</option>
              </select>
            </div>
          </li>
          <li>
            <div class="d-flex my-2">
              <label for="InputArticle" class="form-label h5 me-3">Photo article</label>
              <input type="file" id="avatar" name="avatar"/>
            </div>
          </li>
          <div class="d-flex my-2">
            <label for="InputArticle" class="form-label h5 me-5">Mise à prix</label>
            <input type="number" name="username" class="form-control" id="InputArticle">
          </div>
          <li>
            <div class="d-flex my-2">
              <label for="datedebut" class="form-label h5 me-5">Début</label>
              <input type="date" name="username" class="form-control" id="datedebut">
            </div>
          </li>
          <li>
            <div class="d-flex my-2">
              <label for="datefin" class="form-label h5 me-5">Fin</label>
              <input type="date" name="username" class="form-control" id="datefin">
            </div>
          </li>
          <li>
            <form>
              <fieldset class=" border p-2">
                <legend class="scheduler-border">Retrait</legend>
                <div class="d-flex my-2">
                  <label for="InputRue" class="form-label h5 me-5">Rue</label>
                  <input type="text" name="username" class="form-control" id="InputRue">
                </div>
                <div class="d-flex my-2">
                  <label for="InputCp" class="form-label h5 me-5">Code postal</label>
                  <input type="number" name="username" class="form-control" id="InputCp">
                </div>
                <div class="d-flex my-2">
                  <label for="InputVille" class="form-label h5 me-5">Ville</label>
                  <input type="text" name="username" class="form-control" id="InputVille">
                </div>
              </fieldset>
            </form>
          </li>
          <li>
            <form method="post" action="">
              <div class="me-5">
                <button type="button" class="btn btn-primary">Enregistrer</button>
                <button type="button" class="btn btn-primary">Annuler</button>
               <a href="<%=request.getContextPath()%>"><button type="button" class="btn btn-primary">Annuler la vente</button></a>
              </div>
            </form>
          </li>
        </ul>
      </div>
    </div>
  </section>
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
</body>
</html>