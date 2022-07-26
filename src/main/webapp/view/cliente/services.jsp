<%--
  Created by IntelliJ IDEA.
  User: Josafat
  Date: 21/07/2022
  Time: 11:42 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detalle de pago</title>

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
    <link rel="stylesheet" href="${context}/css/layout.css">
    <link rel="stylesheet" href="${context}/css/cliente/layout.css">
    <link rel="stylesheet" href="${context}/css/cliente/payments.css">
    <link rel="stylesheet" href="${context}/css/cliente/services.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <h1 class="mb-3">Servicios</h1>
        <div class="row">

            <div class="col-md-3 col-12">
                <div class="filter-tab py-4 mb-4">
                    <button class="tab-active mb-3 d-block text-start" id="all">Todos</button>
                    <button id="completed" class="mb-3 d-block text-start">Finalizados</button>
                    <button id="uncompleted" class="d-block text-start">En proceso</button>
                </div>
            </div>

            <div class="col-md-9 col-12">

                <div class="row">
                    <c:forEach items="${histories}" var="history">
                        <div class="col-12 mb-4 ${history.status=='Finalizado' ? "car-card-paid" : "car-card-unpaid"}">
                            <div class="row g-md-0">

                                <div class="col-12 col-md-4">
                                    <div class="car-card">
                                        <div class="car-card-title text-center">
                                            <p class="card-title">${history.vehicle.brand} ${history.vehicle.model} ${history.vehicle.year}</p>
                                        </div>
                                        <div
                                                class="car-card-plates text-center py-2 d-flex align-items-center justify-content-center">
                                            <h4>${history.vehicle.plates}</h4>
                                        </div>
                                        <div class="car-card-footer text-center">
                                            <p>
                                                Color: ${history.vehicle.color}
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-7">
                                    <div class="service-info p-3 p-md-2">
                                        <div class="service-info-title d-flex align-items-center mb-2">
                                            <p>${history.service.name}</p>
                                        </div>
                                        <div class="service-info-content">
                                            <p class="mb-md-1">
                                                Tu vehículo ha pasado a la etapa de: <span
                                                    class="fw-bold">${history.status}</span>
                                            </p>
                                            <p>${history.lastUpdateDate} · ${history.lastUpdateTime} hrs</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-1">
                                    <a href="#"
                                       class="arrow-container d-flex align-items-center justify-content-center">
                                        <i class="fa-solid fa-caret-right d-none d-md-block"></i>
                                        <i class="fa-solid fa-caret-down d-md-none"></i>
                                    </a>
                                </div>

                            </div>

                        </div>
                    </c:forEach>
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

<!-- Custom JS -->
<script src="js/cliente/payments.js"></script>


</body>
</html>

