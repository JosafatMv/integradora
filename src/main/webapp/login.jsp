
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cliente</title>

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
    <link rel="stylesheet" href="css/login.css">

</head>

<body>
<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">
            <img src="imgs/logo.png" alt="Logo de Motor Express" class="d-inline-block align-text-top">
            Motor Express
        </a>
        <a href="login">
            Login <i class="fa-solid fa-arrow-right-to-bracket"></i>
        </a>
    </div>
</nav>

<!-- Main content -->
<main>
    <div class="landing text-center text-white container-fluid pb-5">
        <div class="row justify-content-center align-items-center">

            <div class="logo-container col-12 col-sm-6 my-3">
                <img src="imgs/logo-landing.png" alt="Logo de Motor Express" class="img-fluid">
            </div>

            <div class="col-12 col-sm-6 text-start d-flex justify-content-center">
                <form action="login-check" method="POST" class="px-4">

                    <h1 class="text-center py-3">INICIAR SESIÓN</h1>

                    <c:if test="${param['result-login']!=null}">
                        <c:if test="${param['result-login']=='error'}">
                            <div class="alert alert-danger mb-3" role="alert">
                                La contraseña o el correo son invalidos.
                            </div>
                        </c:if>

                    </c:if>

                    <div class="input-group mb-4">
                            <span class="input-group-text" id="campo-correo">
                                <i class="fa-solid fa-envelope"></i>
                            </span>
                        <input type="email" class="form-control" placeholder="Correo" aria-label="Correo"
                               aria-describedby="campo-correo" name="email" required>
                    </div>

                    <div class="input-group mb-4">
                            <span class="input-group-text" id="campo-contraseña">
                                <i class="fa-solid fa-lock"></i>
                            </span>
                        <input type="password" class="form-control" placeholder="Contraseña" aria-label="Contraseña"
                               aria-describedby="campo-contraseña" name="password" required>
                    </div>

                    <div class="my-4 form-check form-check-reverse">
                        <input type="checkbox" class="form-check-input p-2" id="isCliente">
                        <label class="form-check-label" for="isCliente">No soy cliente</label>
                    </div>


                    <div class="d-grid gap-2 text-center mb-4">
                        <button type="submit" class="btn btn-primary mx-auto">Iniciar</button>
                        <a href="">¿Olvidaste tu contraseña?</a>
                    </div>

                </form>
            </div>

        </div>
    </div>
</main>

<footer id="footer">

    <div class="footer-info">
        <h4>¡Siguenos en todas nuestras redes sociales!</h4>
        <p>
            Para que no te pierdas de nada relacionado al taller, siguenos en nuestras redes sociales donde
            publicaremos
            todas las novedades. Tambien nos gusta leerlos a ustedes asi que no olviden dejarnos tu opinión acerca
            de
            nuestros servicios. ¡Gracias!
        </p>
        <div class="social-icons">
            <a href="https://facebook.com" target="_blank">
                <i class="fab fa-facebook-square"></i>
            </a>
            <a href="https://twitter.com" target="_blank">
                <i class=" fab fa-twitter-square"></i>
            </a>
            <a href="https://instagram.com" target="_blank">
                <i class=" fab fa-instagram"></i>
            </a>
            <a href="https://tiktok.com" target="_blank">
                <i class="fab fa-tiktok"></i>
            </a>
        </div>
    </div>

    <div class="footer-copyright">
        <p>
            Motor Express &copy; 2022. Todos los derechos reservados.
        </p>
    </div>
</footer>


<!-- Bootstrap script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous">
</script>

<!-- Fontawesome Icons -->
<script src="https://kit.fontawesome.com/d35d510498.js" crossorigin="anonymous"></script>

</body>

</html>

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rfc") != null){
        response.sendRedirect(request.getContextPath()+"/home");
    }
%>