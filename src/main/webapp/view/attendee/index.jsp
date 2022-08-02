
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>

    <!-- Bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

    <!-- Custom css -->
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/attendee/index.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <h1 class="text-center mb-4">¿Qué quieres consultar?</h1>

    <div class="container">
        <div class="row align-items-center justify-content-center mb-md-5">
            <div class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
                <a href="information" class="card-action card-information">
                    <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                        <h2>MI INFORMACIÓN</h2>
                    </div>

                </a>
            </div>
            <div class="col-12 col-md-6">
                <div class="row gx-md-3 justify-content-center align-items-center">
                    <div class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
                        <a href="client-register" class="card-action card-register-client">
                            <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                                <h2>REGISTRAR CLIENTE</h2>
                            </div>

                        </a>
                    </div>
                    <div class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
                        <a href="vehicle-register" class="card-action card-register-vehicle">
                            <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                                <h2>REGISTRAR VEHICULO</h2>
                            </div>

                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row align-items-center justify-content-center">
            <div class="col-12 col-md-6 mb-4">
                <div class="row gx-md-3 justify-content-center align-items-center">
                    <div class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
                        <a href="list-clients" class="card-action card-list-clients">
                            <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                                <h2>VISUALIZAR CLIENTES</h2>
                            </div>

                        </a>
                    </div>
                    <div class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
                        <a href="list-services" class="card-action card-list-catalogue">
                            <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                                <h2>VISUALIZAR CATALOGO</h2>
                            </div>

                        </a>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 d-flex justify-content-center mb-md-4">
                <a href="vehicles-service" class="card-action card-services">
                    <div class="bg-black bg-opacity-75 w-100 h-100 text-center card-background">
                        <h2>SERVICIOS</h2>
                    </div>
                </a>
            </div>
        </div>
    </div>

</main>

<!-- Footer -->
<%@ include file="../../footer.jsp" %>

<!-- Bootstrap script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
</script>

<!-- Fontawesome Icons -->
<script src="https://kit.fontawesome.com/d35d510498.js" crossorigin="anonymous"></script>

</body>

</html>


