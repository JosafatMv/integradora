<%--
  Created by IntelliJ IDEA.
  User: Josafat
  Date: 17/07/2022
  Time: 09:10 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vehiculos</title>

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
    <link rel="stylesheet" href="css/cliente/vehicles.css">
    <link rel="stylesheet" href="css/cliente/layout.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <h1 class="mb-4">Vehiculos</h1>

        <div class="row">

            <c:forEach items="${vehicles}" var="vehicle">

                <div class="col-sm-6 col-md-4 mb-4">
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
                </div>

            </c:forEach>

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
