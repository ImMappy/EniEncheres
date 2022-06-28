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
    <link href="css/login.css" rel="stylesheet"/>
    <title>ENI - ENCHERES CONNEXION</title>

</head>
<body>
<section class="vh-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-6 text-black">
                <!-- Logo Login ENI -->
                <div class="mt-5 mb-5 col-md-12 d-flex justify-content-center">
                    <img src="img/logo-ENI-full.png" alt="logo eni" width="150vh">
                </div>
                <!-- Container Left Side -->
                <div id="containerformulaire">
                    <div class="container">
                        <!-- Pills navs -->
                        <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login" role="tab"
                                   aria-controls="pills-login" aria-selected="true">Connexion</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-register" role="tab"
                                   aria-controls="pills-register" aria-selected="false">Créer un compte</a>
                            </li>
                        </ul>
                        <!-- Pills navs -->

                        <!-- Pills content -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
                                <form action="${pageContext.request.contextPath}/connexion" method="post">
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="text" name="pseudo" id="loginName" class="form-control" required/>
                                        <label class="form-label" for="loginName">Nom d'Utilisateur</label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" name="password" id="loginPassword" class="form-control" required/>
                                        <label class="form-label" for="loginPassword">Mot de Passe</label>
                                    </div>

                                    <!-- Error Login -->
                                    <c:if test="${isNotAllowed}">
                                        <div class="mt-2 d-flex justify-content-center">
                                            <p id="nullConnexion">Nom d'Utilisateur ou Mot de Passe INCORRECT !</p>
                                        </div>
                                    </c:if>

                                    <!-- Error Password -->
                                    <c:if test="${errorPassword}">
                                        <div class="mt-2 d-flex justify-content-center">
                                            <p id="nullPassword">Saisie du Mot de Passe Incorrect, Recommencez !</p>
                                        </div>
                                    </c:if>

                                    <!-- 2 column grid layout for inline styling -->
                                    <div class="row mb-4">
                                        <div class="col d-flex justify-content-center">
                                            <!-- Checkbox -->
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                                                <label class="form-check-label" for="form2Example31">Se souvenir de moi</label>
                                            </div>
                                        </div>

                                        <!-- Simple link -->
                                        <div class="col">
                                            <a href="#!">Mot de passe oublié ?</a>
                                        </div>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-4">Se connecter</button>

                                    <!-- 1 column grid layout -->
                                    <div class="row mb-4">
                                        <div class="col-md-12 d-flex justify-content-center">
                                            <span id="gitname"><i class="fa-brands fa-github"></i>romainhelard ImMappy DadaBzh</span>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
                                <form action="${pageContext.request.contextPath}/inscription" method="post">
                                    <!-- Username input -->
                                    <div class="form-outline mb-3">
                                        <input type="hidden" name="idUser" value=""/>
                                        <input type="text" name="registerPseudo" id="registerUsername" class="form-control" required/>
                                        <label class="form-label" for="registerUsername">Pseudo</label>
                                    </div>

                                    <!-- Surname input -->
                                    <div class="col d-flex gap-2">
                                    <div class="form-outline mb-3">
                                        <input type="text" name="registerPrenom" id="registerSurname" class="form-control" required/>
                                        <label class="form-label" for="registerSurname">Prénom</label>
                                    </div>

                                    <!-- Name input -->
                                    <div class="form-outline mb-3">
                                        <input type="text" name="registerNom" id="registerName" class="form-control" required/>
                                        <label class="form-label" for="registerName">Nom</label>
                                    </div>
                                    </div>

                                    <!-- Telephone input -->
                                    <div class="form-outline mb-3">
                                        <input type="number" name="registerTelephone" id="registerTel" class="form-control" required/>
                                        <label class="form-label" for="registerTel">Téléphone</label>
                                    </div>

                                    <!-- Email input -->
                                    <div class="form-outline mb-3">
                                        <input type="email" name="registerEmail" id="registerEmail" class="form-control" required/>
                                        <label class="form-label" for="registerEmail">E-mail</label>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-3">
                                        <input type="password" name="registerPassword" id="registerPassword" class="form-control" required/>
                                        <label class="form-label" for="registerPassword">Mot de Passe</label>
                                    </div>

                                    <!-- Repeat Password input -->
                                    <div class="form-outline mb-3">
                                        <input type="password" name="registerPassword2" id="registerRepeatPassword" class="form-control" required/>
                                        <label class="form-label" for="registerRepeatPassword">Confirmation</label>
                                    </div>

                                    <!-- Error Password -->
                                    <c:if test="${errorPassword}">
                                        <div class="d-flex justify-content-center">
                                            <p id="nullPassword">Mot de Passe Incorrect !</p>
                                        </div>
                                    </c:if>

                                    <!-- Postal Code input -->
                                    <div class="col d-flex gap-2">
                                    <div class="form-outline mb-3">
                                        <input type="number" name="registerCodePostal" id="registerPostalCode" class="form-control" required/>
                                        <label class="form-label" for="registerPostalCode">Code Postal</label>
                                    </div>

                                    <!-- Ville input -->
                                    <div class="form-outline mb-3">
                                        <input type="text" name="registerVille" id="registerVille" class="form-control" required/>
                                        <label class="form-label" for="registerVille">Ville</label>
                                    </div>
                                    </div>

                                    <!-- Rue input -->
                                    <div class="form-outline mb-3">
                                        <input type="text" name="registerRue" id="registerRue" class="form-control" required/>
                                        <label class="form-label" for="registerRue">Rue</label>
                                    </div>

                                    <!-- Checkbox -->
                                    <div class="form-check d-flex justify-content-center mb-4">
                                        <input class="form-check-input me-2" type="checkbox" value="" id="registerCheck"
                                               aria-describedby="registerCheckHelpText" required/>
                                        <label class="form-check-label" for="registerCheck">J'ai lu et j'accepte les termes et conditions</label>
                                    </div>

                                    <!-- Submit button -->
                                    <button type="submit" class="btn btn-primary btn-block mb-3">Créer mon compte</button>
                                </form>
                            </div>
                        </div>
                        <!-- Pills content -->
                    </div>
                </div>
            </div>
            <div class="col-sm-6 px-0 d-none d-sm-block">
                <img src="img/Intro-connexionbackground.png"
                     alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
</body>
</html>