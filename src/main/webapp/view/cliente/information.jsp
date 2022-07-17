
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Información</title>

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
    <link rel="stylesheet" href="css/cliente/information.css">
    <link rel="stylesheet" href="css/cliente/layout.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <div class="profile-header">
            <div class="row align-items-center">
                <div class="col-4 col-md-1 d-flex justify-content-center">
                    <div class="profile-image">
                        <img class="img-fluid" src="https://ui-avatars.com/api/?name=${name}" alt="Profile picture">
                    </div>
                </div>
                <div class="col-8 col-md-11 text-start">
                    <h2>Bienvenido, ${name} </h2>
                    <p>
                        ${user.nombre} ${user.apellidoPaterno} ${user.apellidoMaterno}
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <div class="profile-info">
            <div class="row">
                <div class="col-md-3 col-12">
                    <div class="info-tab py-2 mb-4">
                        <ul>
                            <li class="my-3 tab-active" data-tab="general">
                                Datos generales
                            </li>
                            <li data-tab="direccion">
                                Dirección
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9 col-12">
                    <div class="info-container p-4">

                        <form class="info-tab-content-general">
                            <div class="mb-md-3 row">
                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="name"
                                               class="text-lg-end col-lg-3 col-form-label">Nombre:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="name" aria-label="Disabled"
                                                   value="${user.nombre} ${user.apellidoPaterno} ${user.apellidoMaterno}"
                                                   disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="phone"
                                               class="text-lg-end col-lg-3 col-form-label">Teléfono:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="phone"
                                                   value="${user.telefono}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-md-3 row">
                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="email"
                                               class="text-lg-end col-lg-3 col-form-label">Correo:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="email" value="${user.correo}">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="rfc" class="text-lg-end col-lg-3 col-form-label">RFC:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="rfc"
                                                   value="${user.rfc}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <form class="info-hide info-tab-content-direccion">
                            <div class="mb-md-3 row">
                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="state"
                                               class="text-lg-end col-lg-3 col-form-label">Estado:</label>
                                        <div class="col-lg-9">
                                            <input type="text" class="form-control" id="state" aria-label="Disabled"
                                                   value="${user.estado}" disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="colony"
                                               class="text-lg-end col-lg-3 col-form-label">Colonia:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="colony"
                                                   value="${user.colonia}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-md-3 row">
                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="town"
                                               class="text-lg-end col-lg-3 col-form-label">Municipio:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="town"
                                                   value="${user.municipio}">
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="street"
                                               class="text-lg-end col-lg-3 col-form-label">Calle:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="street"
                                                   value="${user.calle}, ${user.numero}">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-md-3 row">
                                <div class="col-md-6 col-12 mb-3">
                                    <div class="row">
                                        <label for="cp" class="text-lg-end col-lg-3 col-form-label">C.P:</label>
                                        <div class="col-lg-9">
                                            <input type="text" disabled class="form-control" id="cp"
                                                   value="${user.codigoPostal}">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </form>

                    </div>
                </div>
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

<!-- Custom script -->
<script src="js/cliente/information.js"></script>

</body>

</html>


