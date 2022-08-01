<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<c:set var="context" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-md">
    <div class="container-fluid">
        <a class="navbar-brand" href="${context}/home">
            <img src="${context}/imgs/logo.png" alt="Logo de Motor Express" class="d-inline-block align-text-top">
            Motor Express
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="nav navbar-nav me-auto mb-2 mb-md-0">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Registrar
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item" ${pagina.endsWith('/client-register') ? 'active' : ''}
                               href="${context}/client-register">Clientes</a>
                        </li>
                        <li>
                            <a class="dropdown-item ${pagina.endsWith('/vehicle-register') ? 'active' : ''}"
                               href="${context}/vehicle-register">Vehiculos</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/list-clients') ? 'active' : ''}"
                       href="${context}/list-clients">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/vehicles-service') ? 'active' : ''}"
                       href="${context}/vehicles-service">Servicios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/list-services') ? 'active' : ''}"
                       href="${context}/list-services">Catalogo</a>
                </li>

            </ul>
            <ul class="nav navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Josafat</a>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a href="${context}/logout" class="dropdown-item">
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
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rol") != "asistente") {
        response.sendRedirect("login");
    }
%>