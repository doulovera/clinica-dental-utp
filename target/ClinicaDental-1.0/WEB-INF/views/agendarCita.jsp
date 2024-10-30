<%@ page contentType="text/html; charset=UTF-8" %>
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

<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<main class="main">
    <c:if test="${not empty responseMessage}">
        <div class="alert alert-info">${responseMessage}</div>
    </c:if>

    <section class="container">
        <form action="agendar-cita" method="post">
            <div class="form-group">
                <label for="idDoctor">ID Doctor:</label>
                <input type="number" class="form-control" id="idDoctor" name="idDoctor" required>
            </div>
            <div class="form-group">
                <label for="idCliente">ID Cliente:</label>
                <input type="number" class="form-control" id="idCliente" name="idCliente" required>
            </div>
            <div class="form-group">
                <label for="fecha">Fecha y Hora:</label>
                <input type="datetime-local" class="form-control" id="fecha" name="fecha" required>
            </div>
            <div class="form-group">
                <label for="mensaje">Mensaje:</label>
                <input type="text" class="form-control" id="mensaje" name="mensaje">
            </div>
            <!--
            <div class="form-group">
                <label for="estado">Estado:</label>
                <input type="text" class="form-control" id="estado" name="estado">
            </div>
            -->

            <div class="form-group">
                <label for="estado">Estado:</label>
                <select class="form-control" id="estado" name="estado">
                    <option value="pendiente">Pendiente</option>
                    <option value="cancelado">Cancelado</option>
                    <option value="vencido">Vencido</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Agendar Cita</button>
        </form>
    </section>
</main>

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>


</body>

</html>
