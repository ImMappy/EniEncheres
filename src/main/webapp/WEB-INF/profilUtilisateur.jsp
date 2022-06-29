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
    <title>Profil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

</head>
<body>
<section class="vh-100">
    <div class="container-fluid">
        <div >
            <form class="w-25 mx-auto">

                <!-- Username input -->

                <div class="form-outline mb-4">
                    <input type="text" name="registerPseudo" id="registerUsername" class="form-control" />
                    <label class="form-label" for="registerUsername">Pseudo</label>
                </div>

                <!-- Surname input -->
                <div class="col d-flex gap-2">
                    <div class="form-outline mb-4">
                        <input type="text" name="registerPrenom" id="registerSurname" class="form-control" />
                        <label class="form-label" for="registerSurname">Prénom</label>
                    </div>

                    <!-- Name input -->
                    <div class="form-outline mb-4">
                        <input type="text" name="registerNom" id="registerName" class="form-control" />
                        <label class="form-label" for="registerName">Nom</label>
                    </div>
                </div>

                <!-- Telephone input -->
                <div class="form-outline mb-4">
                    <input type="text" name="registerTelephone" id="registerTel" class="form-control" />
                    <label class="form-label" for="registerTel">Téléphone</label>
                </div>

                <!-- Email input -->
                <div class="form-outline mb-4">
                    <input type="email" name="registerEmail" id="registerEmail" class="form-control" />
                    <label class="form-label" for="registerEmail">E-mail</label>
                </div>

                <!-- Postal Code input -->
                <div class="col d-flex gap-2">
                    <div class="form-outline mb-4">
                        <input type="text" name="registerCodePostal" id="registerPostalCode" class="form-control" />
                        <label class="form-label" for="registerPostalCode">Code Postal</label>
                    </div>

                    <!-- Ville input -->
                    <div class="form-outline mb-4">
                        <input type="text" name="registerVille" id="registerVille" class="form-control" />
                        <label class="form-label" for="registerVille">Ville</label>
                    </div>
                </div>

                <!-- Rue input -->
                <div class="form-outline mb-4">
                    <input type="text" name="registerRue" id="registerRue" class="form-control" />
                    <label class="form-label" for="registerRue">Rue</label>
                </div>


                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-3">Modifier</button>
            </form>
        </div>
    </div>
    </div>
</section >

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
</body>
</html>