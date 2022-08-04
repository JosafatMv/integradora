<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cobro</title>

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
    <link rel="stylesheet" href="css/components/filter-tab.css">
    <link rel="stylesheet" href="css/components/input-search.css">
    <link rel="stylesheet" href="css/components/service-status.css">
    <link rel="stylesheet" href="css/cashier/list-charges.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <h1 class="my-3">Cobros</h1>
        <div class="row">

            <div class="col-md-3 col-12">
                <div class="filter-tab py-4 mb-4">
                    <button class="tab-active mb-3 d-block text-start" id="all">Todos</button>
                    <button class="mb-3 d-block text-start" id="completed">Finalizados</button>
                    <button class="d-block text-start" id="uncompleted">Sin pagar</button>
                </div>
            </div>

            <div class="col-md-9 col-12">

                <form action="" class="my-3">
                    <div class="d-flex justify-content-center">
                        <div class="search">
                            <input type="text" class="search-input" placeholder="Buscar RFC, nombre" name="search">
                            <button type="submit" class="search-icon"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                </form>

                <div class="row">
                    <div class="col-12 d-flex status-symbology my-4">
                        <div class="status-paid d-flex align-items-center me-4">
                            <div class="circle-paid"></div>
                            <p>Finalizados</p>
                        </div>

                        <div class="status-unpaid d-flex">
                            <div class="circle-unpaid"></div>
                            <p>Sin pagar</p>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <c:forEach items="${payments}" var="payment">
                        <div class="col-12 mb-4 car-card-${payment.status=='Finalizado' ? "paid" : "unpaid"}">
                            <div class="row g-md-0">
                                <div class="col-12 col-md-11">
                                    <div class="charge-card p-3 p-md-2 ps-md-5">
                                        <div class="charge-info-title d-flex align-items-center mb-2">
                                            <div class="service-status service-status-${payment.status=='Finalizado' ? "paid" : "unpaid"}"></div>
                                            <p><span class="fw-bold">Numero de Servicio:</span> ${payment.historyId}</p>
                                        </div>
                                        <div class="charge-info-content">
                                            <p class="mb-md-1">
                                                <span class="fw-bold">Monto total:</span> $${payment.totalAmount}
                                            </p>
                                            <p>
                                                ${payment.lastDateUpdate}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-1">
                                    <a href="${context}/charge/${payment.historyId}"
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

<!-- Toastify js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

<!-- Custom script -->
<script src="js/components/notify.js"></script>
<script src="js/cashier/list-charges.js"></script>

</body>

</html>


