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
    <link rel="stylesheet" href="${context2}/css/attendee/vehicle-register.css">
    <link rel="stylesheet" href="${context2}/css/components/buttons.css">

</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">

    <div class="container my-5">

        <h1>Registro de vehículo</h1>


        <form action="vehicle-save" method="post" id="form-register">
            <div class="profile-info p-3">
                <div class="mb-md-3 row">
                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="rfc" class="text-lg-end col-lg-3 col-form-label">RFC del cliente:</label>
                            <div class="col-lg-9">
                                <input type="text" name="rfc" class="form-control" id="rfc" placeholder="RFC"
                                       required pattern="{6,13}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="plates" class="text-lg-end col-lg-3 col-form-label">Placas:</label>
                            <div class="col-lg-9">
                                <input type="text" name="plates" class="form-control" id="plates"
                                       placeholder="Placas del vehículo" required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-md-3 row">
                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="engineNumber" class="text-lg-end col-lg-3 col-form-label">
                                Número de motor:
                            </label>
                            <div class="col-lg-9">
                                <input type="text" name="engineNumber" class="form-control" id="engineNumber"
                                       placeholder="Número de motor" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="serialNumber" class="text-lg-end col-lg-3 col-form-label">
                                Número de serie:
                            </label>
                            <div class="col-lg-9">
                                <input type="text" name="serialNumber" class="form-control" id="serialNumber"
                                       placeholder="Número de serie" required>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="mb-md-3 row">
                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="brand" class="text-lg-end col-lg-3 col-form-label">Marca:</label>
                            <div class="col-lg-9">
                                <input type="text" name="brand" class="form-control" id="brand" placeholder="Marca"
                                       required pattern="[a-zA-Z ]{2,20}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="model" class="text-lg-end col-lg-3 col-form-label">Modelo:</label>
                            <div class="col-lg-9">
                                <input type="text" name="model" class="form-control" id="model" placeholder="Modelo"
                                       required>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-md-3 row">
                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="year" class="text-lg-end col-lg-3 col-form-label">Año:</label>
                            <div class="col-lg-9">
                                <input type="number" name="year" min="4" class="form-control" id="year"
                                       placeholder="Año" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="color" class="text-lg-end col-lg-3 col-form-label">Color:</label>
                            <div class="col-lg-9">
                                <input type="text" name="color" class="form-control" id="color" placeholder="Color"
                                       required pattern="[a-zA-Z ]{2,20}">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mb-md-3 row">
                    <div class="col-md-6 col-12 mb-3">
                        <div class="row">
                            <label for="type" class="text-lg-end col-lg-3 col-form-label">Tipo:</label>
                            <div class="col-lg-9">
                                <input type="text" name="type" class="form-control" id="type" placeholder="Tipo"
                                       required pattern="[a-zA-Z ]{2,20}">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-12 mb-3">

                    </div>
                </div>
            </div>

            <div class="text-end my-3">
                <button class="button-custom" type="submit">
                    Añadir
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
<script src="js/components/registerSwal.js"></script>

</body>

</html>


