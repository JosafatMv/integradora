<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Detalle de historial</title>

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
    <link rel="stylesheet" href="${context}/css/cliente/history-details.css">

</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container my-4">
        <h1>SEGUIMIENTO</h1>

    </div>

    <div class="container">
        <div class="status-container">
            <div class="row">
                <div class="col">
                    <div class="status-step ${history.status == "Ingresado" ? "active-status" : ""}">
                        <div class="status-circle"></div>
                        <div class="status-text">
                            <p>En espera</p>
                        </div>
                    </div>
                </div>

                <div class="separator">
                    <div class="separator-line"></div>
                </div>

                <div class="col">
                    <div class="status-step ${history.status == "Realizando" ? "active-status" : ""}">
                        <div class="status-circle"></div>
                        <div class="status-text">
                            <p>Realizando</p>
                        </div>
                    </div>
                </div>

                <div class="separator">
                    <div class="separator-line"></div>
                </div>

                <div class="col">
                    <div class="status-step ${history.status == "Pruebas" ? "active-status" : ""}">
                        <div class="status-circle"></div>
                        <div class="status-text">
                            <p>Pruebas</p>
                        </div>
                    </div>
                </div>

                <div class="separator">
                    <div class="separator-line"></div>
                </div>

                <div class="col">
                    <div class="status-step ${history.status == "Salida" ? "active-status" : ""}">
                        <div class="status-circle"></div>
                        <div class="status-text">
                            <p>Salida</p>
                        </div>
                    </div>
                </div>

                <div class="separator">
                    <div class="separator-line"></div>
                </div>

                <div class="col">
                    <div class="status-step ${history.status == "Finalizado" ? "active-status" : ""}">
                        <div class="status-circle"></div>
                        <div class="status-text">
                            <p>Finalizado</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="timeline-container">
            <h3 class="mb-4">Tu vehículo se encuentra en la etapa: <span class="fw-bold">${history.status}</span></h3>

            <div class="container">
                <div class="row">

                    <c:forEach items="${history.trackings}" var="tracking">

                        <div class="col-12">

                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col-2">
                                        <div class="timeline-status-step ${tracking.statusName == history.status ?
                                        "timeline-active-status" : ""} ">
                                            <div class="timeline-status-circle"></div>
                                            <div class="timeline-status-text">
                                                <p>${tracking.statusName}</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-7">
                                        <p class="timeline-status-description">
                                            Tu vehiculo está listo para recogerse.
                                        </p>
                                    </div>
                                    <div class="col-3">
                                        <div class="timeline-status-date">
                                            <p>${tracking.lastUpdateDate}</p>
                                            <p>${tracking.lastUpdateTime} hrs</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:if test="${tracking.statusName != 'Ingresado'}">
                            <div class="col-12">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-2">
                                            <div class="timeline-separator">
                                                <div class="timeline-separator-line"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>



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

</body>
</html>
