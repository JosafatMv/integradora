<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clientes</title>

    <!-- Bootstrap css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

    <!-- toastify js -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">

    <!-- Custom css -->
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/attendee/list-clients.css">
    <link rel="stylesheet" href="css/components/input-search.css">

</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <h1>Lista de clientes</h1>

        <form action="" class="my-3">

            <div class="d-flex justify-content-center">
                <div class="search">
                    <input type="text" class="search-input" placeholder="Buscar RFC, nombre" name="search">
                    <button type="submit" class="search-icon"><i class="fa fa-search"></i></button>
                </div>
            </div>

        </form>

        <div class="row mt-5">

            <c:forEach items="${clients}" var="client">
                <div class="col-12 col-md-6 mb-4">
                    <div class="row g-md-0">
                        <div class="col-12 col-md-10">
                            <div class="user-info p-3 p-md-2 ps-md-5">
                                <div class="user-info-title mb-2">
                                    <h3>${client.nombre} ${client.apellidoPaterno} ${client.apellidoMaterno}</h3>
                                </div>
                                <div class="user-info-content">
                                    <p class="mb-md-1">
                                        RFC: ${client.rfc}
                                    </p>
                                    <p>
                                        ${client.numCars} vehículos
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-1">
                            <a href="${context}/client/${client.rfc}"
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
</main>

<!-- Footer -->
<%@ include file="../../footer.jsp" %>

<!-- Bootstrap script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
</script>

<!-- Fontawesome Icons -->
<script src="https://kit.fontawesome.com/d35d510498.js" crossorigin="anonymous"></script>

<!-- Toastify js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

<!-- Custom script -->
<script src="js/attendee/list-clients.js"></script>

</body>

</html>


