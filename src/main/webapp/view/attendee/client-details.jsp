<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context2" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cliente</title>

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
    <link rel="stylesheet" href="${context2}/css/attendee/client-details.css">
    <link rel="stylesheet" href="${context2}/css/components/car-card.css">

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
                        <img class="img-fluid" src="https://ui-avatars.com/api/?name=${client.nombre}"
                             alt="Profile picture">
                    </div>
                </div>
                <div class="col-8 col-md-11 text-start">
                    <h2>Bienvenido, ${client.nombre}</h2>
                    <p>
                        ${client.nombre} ${client.apellidoPaterno} ${client.apellidoMaterno}
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-md-8">
                <div class="info-container p-4">
                    <form>
                        <div class="mb-md-3 row">
                            <div class="col-md-6 col-12 mb-3">
                                <div class="row">
                                    <label for="name" class="text-lg-end col-lg-3 col-form-label">Nombre:</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="name" aria-label="Disabled"
                                               value="${client.nombre} ${client.apellidoPaterno} ${client.apellidoMaterno}"
                                               disabled>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-12 mb-3">
                                <div class="row">
                                    <label for="phone" class="text-lg-end col-lg-3 col-form-label">Teléfono:</label>
                                    <div class="col-lg-9">
                                        <input type="text" disabled class="form-control" id="phone"
                                               value="${client.telefono}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="mb-md-3 row">
                            <div class="col-md-6 col-12 mb-3">
                                <div class="row">
                                    <label for="email" class="text-lg-end col-lg-3 col-form-label">Correo:</label>
                                    <div class="col-lg-9">
                                        <input type="text" disabled class="form-control" id="email"
                                               value="${client.correo}">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-12 mb-3">
                                <div class="row">
                                    <label for="rfc" class="text-lg-end col-lg-3 col-form-label">RFC:</label>
                                    <div class="col-lg-9">
                                        <input type="text" disabled class="form-control" id="rfc"
                                               value="${client.rfc}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="state" class="text-lg-end col-lg-3 col-form-label">Estado:</label>
                                <div class="col-lg-9">
                                    <input type="text" class="form-control" id="state" aria-label="Disabled"
                                           value="${client.estado}" disabled>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="colony" class="text-lg-end col-lg-3 col-form-label">Colónia:</label>
                                <div class="col-lg-9">
                                    <input type="text" disabled class="form-control" id="colony"
                                           value="${client.colonia}">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-md-3 row">
                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="town" class="text-lg-end col-lg-3 col-form-label">Municipio:</label>
                                <div class="col-lg-9">
                                    <input type="text" disabled class="form-control" id="town"
                                           value="${client.municipio}">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-12 mb-3">
                            <div class="row">
                                <label for="street" class="text-lg-end col-lg-3 col-form-label">Calle:</label>
                                <div class="col-lg-9">
                                    <input type="text" disabled class="form-control" id="street"
                                           value="${client.calle}, ${client.numero}">
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
                                           value="${client.codigoPostal}">
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>

            <div class="col-md-4 col-12 mt-4 mt-md-0 mb-md-4">

                <div class="cars-list">

                    <c:forEach items="${vehicles}" var="vehicle">

                        <div class="col-12 mb-4">
                            <div class="car-card">
                                <div class="car-card-title text-center">
                                    <p class="card-title">
                                            ${vehicle.brand} ${vehicle.model} ${vehicle.year}
                                    </p>
                                </div>
                                <div class="car-card-plates text-center py-2 d-flex align-items-center justify-content-center">
                                    <h4>${vehicle.plates}</h4>
                                </div>
                                <div class="car-card-footer text-center">
                                    <p>
                                        Color: ${vehicle.color}
                                    </p>
                                </div>
                            </div>

                            <p class="mt-3 text-center ${vehicle.lastStatus == 'Finalizado' ? "status-finalized" : "status-inprogress"}">
                                    ${vehicle.lastStatus}
                            </p>

                        </div>

                    </c:forEach>

                </div>

            </div>

        </div>

        <div class="text-end mt-4">
            <a href="${context}/list-clients" class="button-custom text-end">
                Regresar
            </a>
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


