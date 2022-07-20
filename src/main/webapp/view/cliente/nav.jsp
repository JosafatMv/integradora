<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" />

<nav class="navbar navbar-expand-md">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="imgs/logo.png" alt="Logo de Motor Express" class="d-inline-block align-text-top">
            Motor Express
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/information') ? 'active' : ''}"
                       aria-current="page" href="information">Información</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/services') ? 'active' : ''}"
                       href="../mecanico/servicio.html">Servicios</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link ${pagina.endsWith('/vehicles') ? 'active' : ''}"
                       href="vehicles">Vehiculos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/payments') ? 'active' : ''}"
                       href="#">Pagos</a>
                </li>

            </ul>
            <ul class="nav navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Josafat</a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a href="logout" class="dropdown-item">
                            Logout
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rfc") == null || request.getSession().getAttribute("rol") != "cliente"){
        response.sendRedirect("login");
    }
%>

