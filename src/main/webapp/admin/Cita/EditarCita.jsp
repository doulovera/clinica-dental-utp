<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cita</title>
    <link rel="stylesheet" href="styles.css">
</head>
<%@include file="../header.jsp" %>
<body>
    <div class="container mt-5">
        <h1 class="mb-4 text-center">Editar Cita</h1>

        <c:if test="${not empty mensaje}">
            <div class="alert alert-info" role="alert">
                ${mensaje}
            </div>
        </c:if>

        <form action="ControlCita" method="post" class="card p-4 shadow-sm">
            <input type="hidden" name="opc" value="2">
            <input type="hidden" name="idCita" value="${cita.id}">
            <input type="hidden" name="idCliente" value="${cliente.id}">

            <div class="mb-3">
                <label for="nombreCliente" class="form-label">Nombre del Cliente:</label>
                <input type="text" id="nombreCliente" name="nombreCliente" class="form-control" value="${cliente.nombre}" required>
            </div>

            <div class="mb-3">
                <label for="apellidosCliente" class="form-label">Apellidos del Cliente:</label>
                <input type="text" id="apellidosCliente" name="apellidosCliente" class="form-control" value="${cliente.apellidos}" required>
            </div>

            <div class="mb-3">
                <label for="correoCliente" class="form-label">Correo del Cliente:</label>
                <input type="email" id="correoCliente" name="correoCliente" class="form-control" value="${cliente.correo}" required>
            </div>

            <div class="mb-3">
                <label for="direccionCliente" class="form-label">Dirección del Cliente:</label>
                <input type="text" id="direccionCliente" name="direccionCliente" class="form-control" value="${cliente.direccion}" required>
            </div>

            <div class="mb-3">
                <label for="idEspecialidad" class="form-label">Especialidad:</label>
                <select id="idEspecialidad" name="idEspecialidad" class="form-select" required>
                    <option value="${especialidad.id}" selected>${especialidad.tipo}</option>
                    <!-- Agrega más opciones aquí según las especialidades disponibles -->
                </select>
            </div>

            <div class="mb-3">
                <label for="idDoctor" class="form-label">Doctor:</label>
                <select id="idDoctor" name="idDoctor" class="form-select" required>
                    <option value="${doctor.id}" selected>${doctor.nombre} ${doctor.apellidos}</option>
                    <!-- Agrega más opciones aquí según los doctores disponibles -->
                </select>
            </div>

            <div class="mb-3">
                <label for="fechaCita" class="form-label">Fecha y Hora de la Cita:</label>
                <input type="datetime-local" id="fechaCita" name="fechaCita" class="form-control" value="${cita.fecha.toLocalDateTime().toString().substring(0, 16)}" required>
            </div>

            <div class="mb-3">
                <label for="mensajeCita" class="form-label">Mensaje:</label>
                <textarea id="mensajeCita" name="mensajeCita" rows="5" class="form-control">${cita.mensaje}</textarea>
            </div>

            <div class="mb-3">
                <label for="estadoCita" class="form-label">Estado:</label>
                <select id="estadoCita" name="estadoCita" class="form-select" required>
                    <option value="Pendiente" ${cita.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                    <option value="Atendido" ${cita.estado == 'Atendido' ? 'selected' : ''}>Atendido</option>
                    <option value="Cancelado" ${cita.estado == 'Cancelado' ? 'selected' : ''}>Cancelado</option>
                    <option value="Vencido" ${cita.estado == 'Vencido' ? 'selected' : ''}>Vencido</option>
                </select>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">
                    <i class="bi bi-save"></i> Actualizar Cita
                </button>
                <a href="ControlCita?opc=1" class="btn btn-secondary ms-2">
                    <i class="bi bi-arrow-left"></i> Volver al listado de citas
                </a>
            </div>
        </form>
    </div>
</body>
<%@include file="../footer.jsp" %>
</html>


