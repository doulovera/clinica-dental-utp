<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Doctor</title>
        <!-- Bootstrap ya está incluido en header.jsp -->
    </head>
    <body>
       <%@include file="../header.jsp" %>
        
        <div class="container my-5">
            <h1 class="text-center mb-4">Agregar Nuevo Doctor</h1>

            <form action="${pageContext.request.contextPath}/ControlDoctor" method="post" class="needs-validation" novalidate>
                <input type="hidden" name="opc" value="2"> <!-- Valor para la operación de agregar -->
                <input type="hidden" name="action" value="registrar"> <!-- Indicador de acción para el servlet -->

                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" name="nombre" id="nombre" class="form-control" required>
                    <div class="invalid-feedback">Por favor, ingresa el nombre.</div>
                </div>

                <div class="mb-3">
                    <label for="apellidos" class="form-label">Apellidos:</label>
                    <input type="text" name="apellidos" id="apellidos" class="form-control" required>
                    <div class="invalid-feedback">Por favor, ingresa los apellidos.</div>
                </div>

                <div class="mb-3">
                    <label for="edad" class="form-label">Edad:</label>
                    <input type="number" name="edad" id="edad" class="form-control" required>
                    <div class="invalid-feedback">Por favor, ingresa la edad.</div>
                </div>

                <div class="mb-4">
                    <label for="idEspecialidad" class="form-label">Especialidad:</label>
                    <select name="idEspecialidad" id="idEspecialidad" class="form-select" required>
                        <c:forEach var="especialidad" items="${especialidades}">
                            <option value="${especialidad.id}">${especialidad.tipo}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">Por favor, selecciona una especialidad.</div>
                </div>

                <!-- Botones de acción centrados -->
                <div class="d-flex justify-content-center gap-3">
                    <button type="submit" class="btn btn-primary">Registrar Doctor</button>
                    <a href="${pageContext.request.contextPath}/ControlDoctor?opc=1" class="btn btn-secondary">Cancelar</a>
                </div>
            </form>
        </div>

       <%@include file="../footer.jsp" %>

        <script>
            // Activación de validación de Bootstrap en el formulario
            (function() {
                'use strict';
                window.addEventListener('load', function() {
                    var forms = document.getElementsByClassName('needs-validation');
                    Array.prototype.filter.call(forms, function(form) {
                        form.addEventListener('submit', function(event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
        </script>
    </body>
</html>



