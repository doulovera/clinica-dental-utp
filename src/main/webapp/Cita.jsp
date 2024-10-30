<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.Especialidad" %>
<%@ page import="modelo.Doctor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Cita</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <section id="services" class="services section">
            <div class="container section-title" data-aos="fade-up">
                <h2>Cita</h2>
                <p>Agenda tu cita con nosotros de manera rápida y sencilla, la mejor atención dental.</p>
                <div class="container mt-5">
                    <% if (request.getAttribute("errorMessage") != null) {%>
                    <div class="alert alert-danger">
                        <%= request.getAttribute("errorMessage")%>
                    </div>
                    <% }%>

                    <form action="ControlVetInser" method="post">
                        <!-- Campo oculto para enviar la acción -->
                        <input type="hidden" name="action" value="registrar">

                        <!-- Datos del cliente -->
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <input type="text" class="form-control" id="txtNombreCliente" name="txtNombreCliente" required 
                                       placeholder="Tu Nombre"
                                       value="<%= request.getParameter("txtNombreCliente") != null ? request.getParameter("txtNombreCliente") : ""%>"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <input type="text" class="form-control" id="txtApellidosCliente" name="txtApellidosCliente" required 
                                       placeholder="Tus Apellidos"
                                       value="<%= request.getParameter("txtApellidosCliente") != null ? request.getParameter("txtApellidosCliente") : ""%>"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <input type="email" class="form-control" id="txtCorreoCliente" name="txtCorreoCliente" required 
                                       placeholder="Tu Correo Electrónico"
                                       value="<%= request.getParameter("txtCorreoCliente") != null ? request.getParameter("txtCorreoCliente") : ""%>"/>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <input type="text" class="form-control" id="txtDireccionCliente" name="txtDireccionCliente" required 
                                       placeholder="Tu Dirección"
                                       value="<%= request.getParameter("txtDireccionCliente") != null ? request.getParameter("txtDireccionCliente") : ""%>"/>
                            </div>
                            <div class="col-md-4 mb-3">
                                <select id="idEspecialidad" name="idEspecialidad" class="form-select" onchange="enviarFormularioEspecialidad()">
                                    <option value="">Seleccione una especialidad</option>
                                    <%
                                        List<Especialidad> especialidades = (List<Especialidad>) request.getAttribute("especialidades");
                                        String idEspecialidadSeleccionada = (String) request.getAttribute("idEspecialidad");
                                        if (especialidades != null) {
                                            for (Especialidad especialidad : especialidades) {
                                    %>
                                    <option value="<%= especialidad.getId()%>" 
                                            <%= especialidad.getId() == Integer.parseInt(idEspecialidadSeleccionada != null ? idEspecialidadSeleccionada : "0") ? "selected" : ""%>>
                                        <%= especialidad.getTipo()%>
                                    </option>
                                    <%      }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="col-md-4 mb-3">
                                <select id="idDoctor" name="idDoctor" class="form-select" required>
                                    <option value="">Seleccione un doctor</option>
                                    <%
                                        List<Doctor> doctores = (List<Doctor>) request.getAttribute("doctores");
                                        String idDoctorSeleccionado = (String) request.getAttribute("idDoctor");
                                        if (doctores != null) {
                                            for (Doctor doctor : doctores) {
                                    %>
                                    <option value="<%= doctor.getId()%>"
                                            <%= (idDoctorSeleccionado != null && !idDoctorSeleccionado.isEmpty() && doctor.getId() == Integer.parseInt(idDoctorSeleccionado)) ? "selected" : ""%>>
                                        Dr. <%= doctor.getNombre()%> <%= doctor.getApellidos()%>
                                    </option>
                                    <%      }
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <!-- Selección de Fecha y Hora -->
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <input type="datetime-local" class="form-control" id="txtFechaCita" name="txtFechaCita" required 
                                       placeholder="Seleccione la fecha y hora"
                                       min="<%= java.time.LocalDateTime.now().toString().substring(0, 16)%>"
                                       value="<%= request.getParameter("txtFechaCita") != null ? request.getParameter("txtFechaCita") : ""%>"/>
                            </div>
                            <div class="col-md-12 mb-3">
                                <textarea class="form-control" id="txtMensajeCita" name="txtMensajeCita" placeholder="Mensaje (opcional)"
                                          rows="5"><%= request.getParameter("txtMensajeCita") != null ? request.getParameter("txtMensajeCita") : ""%></textarea>
                            </div>
                            <input type="hidden" id="txtEstadoCita" name="txtEstadoCita" value="Pendiente">
                        </div>

                        <!-- Botón de Envío -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Registrar Cita</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>

        <%@include file="footer.jsp" %>

        <!-- Script para Validación de Fecha y Hora -->
        <script>
            function enviarFormularioEspecialidad() {
                document.forms[0].submit(); // Enviar el formulario solo al cambiar la especialidad
            }

            window.onload = function () {
                const idDoctorSeleccionado = "<%= request.getAttribute("idDoctor") != null ? request.getAttribute("idDoctor") : ""%>";
                if (idDoctorSeleccionado) {
                    document.getElementById("idDoctor").value = idDoctorSeleccionado;
                }
            };
        </script>
    </body>
</html>

