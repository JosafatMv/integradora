<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context2" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registrar cliente</title>

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
    <link rel="stylesheet" href="${context2}/css/layout.css">
    <link rel="stylesheet" href="${context2}/css/attendee/client-register.css">
    <link rel="stylesheet" href="${context2}/css/components/buttons.css">

</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">


    <div class="container">

        <h1>Registrar Cliente</h1>
        <form action="client-save" method="post" id="form-register">
            <div class="profile-info">
                <div class="info-container p-4">
                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="name" class="text-lg-end col-lg-4 col-form-label">Nombre:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="name" class="form-control" id="name" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="email" class="text-lg-end col-lg-4 col-form-label">Correo:</label>
                                <div class="col-lg-8">
                                    <input type="email" name="email" class="form-control" id="email" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="apellidoP" class="text-lg-end col-lg-4 col-form-label">Apellido
                                    Paterno:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="firstLastName" class="form-control" id="apellidoP"
                                           required>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="phone" class="text-lg-end col-lg-4 col-form-label">Telefono:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="phone" class="form-control" id="phone" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="apellidoM" class="text-lg-end col-lg-4 col-form-label">Apellido
                                    Materno:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="secondLastName" class="form-control" id="apellidoM">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="rfc" class="text-lg-end col-lg-4 col-form-label">RFC:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="rfc" class="form-control" id="rfc" required>
                                </div>
                            </div>
                        </div>
                    </div>





                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="state" class="text-lg-end col-lg-4 col-form-label">Estado:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="state" class="form-control" id="state" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="colony" class="text-lg-end col-lg-4 col-form-label">Colonia:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="colony" class="form-control" id="colony" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="town" class="text-lg-end col-lg-4 col-form-label">Municipio:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="town" class="form-control" id="town" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="street" class="text-lg-end col-lg-4 col-form-label">Calle:</label>
                                <div class="col-lg-8">
                                    <input type="text" name="street" class="form-control" id="street" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="cp" class="text-lg-end col-lg-4 col-form-label">C.P:</label>
                                <div class="col-lg-8">
                                    <input type="number" name="cp" class="form-control" id="cp" required>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="number" class="text-lg-end col-lg-4 col-form-label">Numero:</label>
                                <div class="col-lg-8">
                                    <input type="number" name="numer" class="form-control" id="number">
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="password"
                                       class="text-lg-end col-lg-4 col-form-label">Contraseña:</label>
                                <div class="col-lg-8">
                                    <input type="password" name="password" class="form-control" id="password"
                                           required>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="text-end mt-4">
                <button class="button-custom" type="submit">
                    Registrar
                </button>
            </div>
        </form>
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

<!-- Sweetalerts -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Custom script -->
<script src="js/attendee/client-register.js"></script>

</body>

</html>


