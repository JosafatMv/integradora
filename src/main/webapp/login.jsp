<%--
  Created by IntelliJ IDEA.
  User: Josafat
  Date: 14/07/2022
  Time: 09:43 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <a href="login.jsp">
            Login <i class="fa-solid fa-arrow-right-to-bracket"></i>
        </a>
    </div>
</nav>


<!-- Main content -->
<main>
    <div class='auth__container'>
        <div class='auth__login'>
            <h2 class='mb-4 text-center'>Login</h2>
            <form action="login-check" method="POST">
                <label class="form-label" for="email">Correo electronico</label>
                <input class="form-control mb-3" id="email" type='email' name='email' placeholder='Ingrese el correo' />

                <label class="form-label" for="password">Contraseña</label>
                <input class="form-control" id="password" name='password' type='password' placeholder='Contraseña' />

                <div class='d-grid gap-2 mt-4'>
                    <button type='submit' class="btn btn-primary">
                        Ingresar
                    </button>
                </div>
            </form>
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
</body>

</html>

<%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    if (request.getSession().getAttribute("rfc") != null){
        response.sendRedirect(request.getContextPath()+"/home");
    }
%>