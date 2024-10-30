<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Empleado"%>
<%@page session="true"%>

<%
    Empleado emplea = null;
    // Verificar si el usuario ha iniciado sesión
    if (session.getAttribute("empleado") != null && emplea == null) {
        emplea = (Empleado) session.getAttribute("empleado");
    }

    if (emplea == null) {
        // Si no ha iniciado sesión, redirigir al login
        response.sendRedirect("index.jsp");
        return;
    }

    // Obtener el rol del usuario
    String rol = emplea.getRol();
%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Administración - Clínica Dental Palmeras</title>
        <meta name="description" content="Panel de administración de la Clínica Dental Palmeras para la gestión de citas, clientes e historial">
        <meta name="keywords" content="administración, clínica dental, citas, historial, clientes">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- FullCalendar CSS Files -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.11.0/main.min.css" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">

        <!-- FullCalendar JS Files -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/5.11.0/main.min.js"></script>



    </head>

    <body class="admin-page">

        <header id="header" class="header sticky-top">


            <div class="branding d-flex align-items-center">
                <div class="container position-relative d-flex align-items-center justify-content-between">
                    <a href="home.jsp" class="logo d-flex align-items-center me-auto">
                        <h1 class="sitename">Admin - Palmeras</h1>
                    </a>

                    <nav id="navmenu" class="navmenu">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/admin/home.jsp" class="active"><i class="bi bi-house-door me-2 fs-4"></i> Inicio</a></li>
                            <li><a href="${pageContext.request.contextPath}/ControlCita?opc=1">Citas</a></li>
                            <li><a href="${pageContext.request.contextPath}/ControlCliente?opc=1">Pacientes</a></li>
                            <li><a href="${pageContext.request.contextPath}/ControlDoctor?opc=1">Doctores</a></li>
                            <li><a href="${pageContext.request.contextPath}/admin/reportes.jsp">Reportes</a></li>
                                <% if ("Administrador".equals(rol)) {%>
                            <li><a href="<%= request.getContextPath()%>/EmpleadoControlador?opc=1"><i class="bi bi-person-check me-2 fs-4"></i> Usuarios</a></li>
                                <% }%>
                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>
                    <!-- Dropdown para mostrar el nombre del usuario y su rol -->
                    <div class="cta-btn d-none d-sm-block ms-3">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle me-2"></i> <%= emplea.getNom()%> <!-- Aquí se muestra el nombre del usuario -->
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton">
                            <li class="d-flex flex-column align-items-center p-3">
                                <img src="${pageContext.request.contextPath}/admin/assets/img/dark.png" alt="Usuario" class="rounded-circle mb-2" width="60" height="60"/>
                                <span class="fw-bold"><%= emplea.getNom()%> </span> <!-- Agrega el nombre del usuario -->
                                <span class="text-muted"><%= emplea.getRol()%></span> <!-- Mostrar el rol -->
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li class="text-center">
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/login">Cerrar Sesión</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </header>
    </body>
</html>
