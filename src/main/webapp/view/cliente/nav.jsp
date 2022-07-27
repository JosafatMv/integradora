<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pagina" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="context" value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-md">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
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
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/information') ? 'active' : ''}"
                       aria-current="page" href="${context}/information">Información</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/histories') ? 'active' : ''}"
                       href="${context}/histories">Historiales</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link ${pagina.endsWith('/vehicles') ? 'active' : ''}"
                       href="${context}/vehicles">Vehiculos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${pagina.endsWith('/payments') ? 'active' : ''}"
                       href="${context}/payments">Pagos</a>
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
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rfc") == null || request.getSession().getAttribute("rol") != "cliente"){
        response.sendRedirect("login");
    }
%>

