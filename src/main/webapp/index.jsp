<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Motor Express</title>

    <!-- CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Patua+One&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap" rel="stylesheet">

    <!-- CSS Custom -->
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/index.css">

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

<main class="mb-5">
    <div class="landing text-center text-white container-fluid">
        <div class="row justify-content-center align-items-center">

            <div class="logo-container col-12 col-md-6 my-3">
                <img src="imgs/logo-landing.png" alt="Logo de Motor Express" class="img-fluid">
            </div>
            <div class="landing-info col-12 col-md-6">
                <h1 class="mb-3">Motor Express</h1>
                <p>
                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Quisquam, quidem.lorem ipsum dolor sit amet consectetur adipisicing elit.
                    Quisquam, quidem. lorem ipsum dolor sit amet consectetur adipisicing elit.
                </p>
            </div>
        </div>
    </div>

    <div class="container my-5 register-info">

        <div class="row align-items-center">
            <div class="col-12 col-md-5 col-lg-4 mb-3 mb-md-0">
                <div class="card__register-info">
                    <h2 class="mb-4">Registrate</h2>
                    <p class="mb-4">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Delectus iste eum velit
                        possimus quo, repellendus excepturi quaerat itaque repudiandae blanditiis?
                    </p>
                </div>
            </div>

            <div class="col-12 col-md-7 col-lg-8">
                <div class="register-steps">
                    <div class="card__register-step">
                        <h3 class="mb-2">1. Vistanos</h3>
                        <p class="mb-2">
                            Visita nuestra instalación y un personal capacitado te atenderá.
                        </p>
                    </div>
                    <div class="card__register-step mt-3">
                        <h3 class="mb-2">2. No desesperes</h3>
                        <p class="mb-2">
                            Te notificamos el proceso de tu vehículo en todo momento.
                        </p>
                    </div>
                    <div class="card__register-step mt-3">
                        <h3 class="mb-2">3. ¡Vuelve pronto!</h3>
                        <p class="mb-2">
                            Acude nuevamente con nosotros para recoger tu vehículo.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 mt-5">
            <div class="mapouter">
                <div class="gmap_canvas">
                    <iframe class="gmap_iframe" width="100%"
                            src="https://maps.google.com/maps?width=600&amp;height=250&amp;hl=en&amp;q=utez&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
                    </iframe>
                </div>
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



<!-- Scrip de bootstrap -->
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