<%--
  Created by IntelliJ IDEA.
  User: Josafat
  Date: 21/07/2022
  Time: 11:42 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
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
    <link rel="stylesheet" href="${context}/css/cliente/payment-details.css">
    <link rel="stylesheet" href="${context}/css/cliente/layout.css">
</head>

<body>

<!-- Navbar -->
<%@ include file="nav.jsp" %>

<!-- Main content -->
<main class="my-5">
    <div class="container">
        <div class="row">
            <div class="col-12 mb-4">
                <div class="service-info p-md-4">
                    <p class="service-name fw-bold">${payment.service.name}</p>
                    <p>$${payment.service.price}</p>
                    <p>${payment.service.description}</p>
                </div>
            </div>
        </div>

        <div class="products mb-5">
            <div class="row pb-3">

                <c:forEach items="${payment.products}" var="product">
                    <div class="col-12 col-md-4">
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


        <div class="col-12">
            <div class="row">

                <div class="col-12 col-md-4 mb-4">
                    <div class="car-card mb-4">
                        <div class="car-card-title text-center">
                            <p class="card-title">${payment.vehicle.brand} ${payment.vehicle.model} ${payment.vehicle.year}</p>
                        </div>
                        <div
                                class="car-card-plates text-center py-2 d-flex align-items-center justify-content-center">
                            <h4>${payment.vehicle.plates}</h4>
                        </div>
                        <div class="car-card-footer text-center">
                            <p>
                                Color: ${payment.vehicle.color}
                            </p>
                        </div>
                    </div>

                    <div class="payment-remainder d-flex align-items-center flex-column">
                        <div class="mb-2 payment-remainder-${payment.status == "Finalizado" ? "paid" : "unpaid"}">
                            ${payment.status == "Finalizado" ? "Pagado" : "Pendiente de pago"}
                        </div>
                        ${payment.status == "Finalizado" ? "" : "<p>¿Cómo hacer el pago?</p>"}
                    </div>
                </div>

                <div class="col-12 col-md-8">
                    <div class="payment-details">

                        <div class="payment-detail d-flex justify-content-between mb-3">
                            <p>${payment.service.name}</p>
                            <p>$${payment.service.price}</p>
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
