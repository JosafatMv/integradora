<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cobros</title>

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
    <link rel="stylesheet" href="${context}/css/components/service-status.css">
    <link rel="stylesheet" href="${context}/css/components/buttons.css">
    <link rel="stylesheet" href="${context}/css/components/service-card.css">
    <link rel="stylesheet" href="${context}/css/components/charge-card.css">
    <link rel="stylesheet" href="${context}/css/components/product-card.css">
    <link rel="stylesheet" href="${context}/css/components/products.css">
    <link rel="stylesheet" href="${context}/css/components/payment-details.css">
    <link rel="stylesheet" href="${context}/css/components/switch.css">
    <link rel="stylesheet" href="${context}/css/components/credit-card.css">
    <link rel="stylesheet" href="${context}/css/cashier/charge.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <!-- <h1 class="my-3">Pagos</h1> -->

        <div class="row">
            <div class="col-12 col-md-8">
                <div class="col-12 mb-3">
                    <div class="charge-card p-3 p-md-2 ps-md-5">
                        <div class="charge-info-title d-flex align-items-center mb-2">
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

                <div class="col-12 mb-3">
                    <div class="service-info p-md-4">
                        <p class="service-name fw-bold">${payment.service.name}</p>
                        <p>$${payment.service.price}</p>
                        <p>${payment.service.description}</p>
                    </div>
                </div>



                <div class="products mb-5">
                    <div class="row pb-3">
                        <c:forEach items="${payment.products}" var="product">
                            <div class="col-12 col-md-6">
                                <div class="card-product">
                                    <div class="row mb-3">
                                        <div class="col-4">
                                            <div class="card-product-img">
                                                <img src="${product.imgUrl}"
                                                     alt="${product.name}">
                                            </div>
                                        </div>
                                        <div class="col-8 ps-md-4">
                                            <div class="card-product-title">
                                                <h3 class="card-product-name">${product.name}</h3>
                                                <span class="card-product-price">$${product.price}</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row justify-content-center align-items-center">
                                        <div class="col-8">
                                            <div class="card-product-body">
                                                <p>
                                                        ${product.description}
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="card-product-stock text-center">
                                            <span>
                                                Cantidad
                                            </span>
                                                <span class="d-block">
                                                        ${product.used}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-12 mb-4">
                    <div class="payment-details">
                        <div class="payment-detail d-flex justify-content-between mb-3">
                            <p class="fw-bold">Resumen</p>
                            <p class="fw-bold">Precios</p>
                        </div>
                        <c:forEach items="${payment.products}" var="product">
                            <div class="payment-detail d-flex justify-content-between mb-3">
                                <p>${product.name} * ${product.used}</p>
                                <p>$${product.totalAmout}</p>
                            </div>
                        </c:forEach>
                        <div class="payment-detail d-flex justify-content-between">
                            <p class="payment-total fw-bold">Monto total</p>
                            <p>$${payment.totalAmount}</p>
                        </div>
                    </div>
                </div>

            </div>


            <div class="col-12 col-md-4">

                <c:if test="${payment.status != 'Finalizado'}">
                    <form action="${context}/save-charge" method="post" id="method-form">
                        <div class="payment-methods text-center mb-4">
                            <h3 class="mb-3">Forma de pago</h3>
                            <div class="form-check form-check-reverse mb-3">
                                <input class="form-check-input" type="radio" name="paymentMethod" value="cash" id="cash">
                                <label class="form-check-label" for="cash">
                                    Efectivo
                                </label>
                            </div>
                            <div class="form-check form-check-reverse mb-4">
                                <input class="form-check-input" type="radio" name="paymentMethod" value="credit"
                                       id="credit">
                                <label class="form-check-label" for="credit">
                                    Tarjeta bancaria
                                </label>
                            </div>
                        </div>

                        <div class="total-amount mb-4 text-center">
                            <h3>Importe de pago</h3>
                            <p>
                                Monto: <span class="fw-bold"> $${payment.totalAmount} </span>
                            </p>
                        </div>

                        <div class="text-center my-3">
                            <button class="button-custom" id="charge-btn" type="submit">
                                Cobrar
                            </button>
                        </div>
                    </form>
                </c:if>

                <c:if test="${payment.status == 'Finalizado'}">
                    <h3 class="text-center">Servicio pagado.</h3>
                </c:if>

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

<!-- Sweetalerts -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Custom js -->
<script src="${context}/js/cashier/charge.js" type="module"></script>

</body>

</html>


