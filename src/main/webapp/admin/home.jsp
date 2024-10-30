<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="dao.ReportesDAO" %>
<%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin-Palmeras</title>
    <!-- Bootstrap y Font Awesome ya deberían estar incluidos -->
</head>

<body>
    <section id="editar-cita" class="admin-section section py-5 bg-light">
        <div class="container section-title text-center mb-5" data-aos="fade-up">
            <h1 class="text-primary mb-4">Bienvenido, <%= ((Empleado) session.getAttribute("empleado")).getNom() %>!</h1>
            <p class="lead">Aquí tienes un resumen de los datos actuales de la clínica</p>
        </div>
        
        <%
            // Instanciar el DAO para obtener los datos
            ReportesDAO rep = new ReportesDAO();
            int totalClientes = rep.contarClientesRegistrados();
            int citasPendientesHoy = rep.contarCitasPendientesHoy();
            int citasVencidasHoy = rep.contarCitasVencidasHoy();
        %>

        <!-- Sección de Resumen del Dashboard -->
        <div class="container">
            <div class="row justify-content-center">
                <!-- Total de Pacientes -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card text-center shadow-sm border-0 rounded-3 bg-white h-100">
                        <div class="card-body">
                            <i class="fas fa-user-injured fa-3x text-primary mb-3"></i>
                            <h5 class="card-title">Total de Pacientes</h5>
                            <h2 class="card-text display-5"><%= totalClientes %></h2>
                        </div>
                    </div>
                </div>
                
                <!-- Citas Programadas Hoy -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card text-center shadow-sm border-0 rounded-3 bg-white h-100">
                        <div class="card-body">
                            <i class="fas fa-calendar-check fa-3x text-success mb-3"></i>
                            <h5 class="card-title">Citas Programadas Hoy</h5>
                            <h2 class="card-text display-5"><%= citasPendientesHoy %></h2>
                        </div>
                    </div>
                </div>
                
                <!-- Alertas de Citas Perdidas -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card text-center shadow-sm border-0 rounded-3 bg-danger text-white h-100">
                        <div class="card-body">
                            <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                            <h5 class="card-title">Alertas</h5>
                            <h2 class="card-text display-5 text-white"><%= citasVencidasHoy %> cita perdidas</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Botón para agregar nueva cita -->
            <div class="text-center mt-5">
                <a href="#" class="btn btn-primary btn-lg">
                    <i class="fas fa-plus-circle me-2"></i> Agregar Nueva Cita
                </a>
            </div>
        </div>
    </section>
</body>
<%@include file="footer.jsp" %>
</html>
