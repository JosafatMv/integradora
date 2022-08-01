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
    <link rel="stylesheet" href="${context2}/css/components/buttons.css">
    <link rel="stylesheet" href="${context2}/css/components/filter-tab.css">
    <link rel="stylesheet" href="${context2}/css/components/car-card.css">
    <link rel="stylesheet" href="${context2}/css/components/input-search.css">
    <link rel="stylesheet" href="${context2}/css/attendee/vehicles-service.css">

</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">

    <div class="container my-5">
        <h1 class="my-3">Servicios a vehículos</h1>


        <div class="row">

            <div class="col-md-3 col-12">
                <div class="filter-tab py-4 mb-4">
                    <button class="tab-active mb-3 d-block text-start" id="btn-start">Iniciar</button>
                    <button class="mb-3 d-block text-start" id="btn-inprogress">En proceso</button>
                    <button class="d-block text-start" id="btn-end">Finalizar</button>
                </div>
            </div>

            <div class="col-md-9 col-12">

                <form action="" class="mb-5">

                    <div class="d-flex justify-content-center">
                        <div class="search">
                            <input type="text" class="search-input" placeholder="Buscar RFC, nombre" name="search">
                            <button type="submit" class="search-icon"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                </form>

                <div class="row ">

                    <c:forEach items="${histories}" var="history">

                        <div class="col-12 col-md-6 col-12 mb-3 ${history.status == null ? "car-start" :
                                history.status == "Salida" ? "car-end" : "car-inprogress"}">
                            <div class="car-card" id="${history.historyId != 0 ? history.historyId : history.vehicle.plates}">
                                <div class="car-card-title text-center">
                                    <p class="card-title">
                                            ${history.vehicle.brand} ${history.vehicle.model} ${history.vehicle.year}
                                    </p>
                                </div>
                                <div class="car-card-plates text-center py-2 d-flex align-items-center justify-content-center">
                                    <h4>${history.vehicle.plates}</h4>
                                </div>
                                <div class="car-card-footer text-center">
                                    <p>
                                        Color: ${history.vehicle.color}
                                    </p>
                                </div>
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </div>
        </div>

        <form action="change-status" method="POST" id="form-register">
            <input type="hidden" name="plates" value="0" id="plates"/>
            <input type="hidden" name="historyId" value="0" id="historyId"/>
            <input type="hidden" name="status" value="start" id="status"/>
            <input type="hidden" name="rfcMechanic" id="rfcMechanic"/>

            <div class="text-end my-3">
                <button class="button-custom" type="submit" id="btn-submit">
                    Iniciar
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
<script src="js/attendee/vehicles-service.js"></script>
<script src="js/components/filterTab.js"></script>

</body>

</html>



