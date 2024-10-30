<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Doctores</title>
        <!-- Bootstrap ya está incluido en header.jsp -->
        <script>
            // Abrir el modal si el parámetro modalOpen=true
            window.onload = function() {
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.get('modalOpen') === 'true') {
                    const modal = new bootstrap.Modal(document.getElementById('especialidadModal'));
                    modal.show();
                }
            };
        </script>
    </head>
    <body>
        <%@include file="../header.jsp" %>
        
        <div class="container my-5">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h1 class="mb-0">Lista de Doctores</h1>
                <div>
                    <!-- Botones de agregar doctores y especialidades -->
                    <a href="${pageContext.request.contextPath}/ControlDoctor?opc=2" class="btn btn-primary me-2">Agregar Nuevo Doctor</a>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#especialidadModal">Agregar Especialidad</button>
                </div>
            </div>

            <!-- Tabla de Doctores -->
            <table class="table table-bordered table-hover mt-4">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Edad</th>
                        <th>Especialidad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="doctor" items="${listaDoctores}">
                        <tr>
                            <td>${doctor.id}</td>
                            <td>${doctor.nombre}</td>
                            <td>${doctor.apellidos}</td>
                            <td>${doctor.edad}</td>
                            <td>
                                <c:forEach var="especialidad" items="${especialidades}">
                                    <c:if test="${especialidad.id == doctor.idEspecialidad}">
                                        ${especialidad.tipo}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <a href="ControlDoctor?opc=3&id=${doctor.id}" class="btn btn-sm btn-primary">Editar</a>
                                <a href="ControlDoctor?opc=5&id=${doctor.id}&idEspecialidad=${doctor.idEspecialidad}" 
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('¿Estás seguro de eliminar este doctor?')">Eliminar</a>
                                   <a href="ControlDoctor?opc=9&id=${doctor.id}" class="btn btn-info btn-sm">Historial</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <!-- Modal para listar y agregar especialidades -->
            <div class="modal fade" id="especialidadModal" tabindex="-1" aria-labelledby="especialidadModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5>Agregar Nueva Especialidad</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <!-- Formulario para agregar especialidad -->
                            <form action="${pageContext.request.contextPath}/ControlDoctor?opc=7" method="post">
                                <div class="mb-3">
                                    <label for="tipo" class="form-label">Tipo de Especialidad:</label>
                                    <input type="text" id="tipo" name="tipo" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Agregar Especialidad</button>
                            </form>

                            <hr>

                            <h5>Lista de Especialidades</h5>
                            <!-- Tabla de especialidades -->
                            <table class="table table-bordered mt-3">
                                <thead class="table-secondary">
                                    <tr>
                                        <th>ID</th>
                                        <th>Tipo</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="especialidad" items="${especialidades}">
                                        <tr>
                                            <td>${especialidad.id}</td>
                                            <td>${especialidad.tipo}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/ControlDoctor?opc=8&id=${especialidad.id}" 
                                                   class="btn btn-sm btn-danger"
                                                   onclick="return confirm('¿Estás seguro de eliminar esta especialidad?')">Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../footer.jsp" %>
    </body>
</html>
