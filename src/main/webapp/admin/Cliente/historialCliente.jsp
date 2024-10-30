<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Historial de Citas del Paciente: </title>
</head>
<body>
    <%@ include file="../header.jsp" %>
    
    <div class="container my-5">
        <h2 class="text-center mb-4">${titulo}</h2>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID Cita</th>
                        <th>Doctor</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Mensaje</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cita" items="${citas}">
                        <tr>
                            <td>${cita.id}</td>
                            <td>${cita.doctor}</td>
                            <!-- Formatear Fecha -->
                            <td>
                                <fmt:formatDate value="${cita.fecha}" pattern="yyyy-MM-dd"/>
                            </td>
                            <!-- Formatear Hora en 12 horas con AM/PM -->
                            <td>
                                <fmt:formatDate value="${cita.fecha}" pattern="hh:mm a"/>
                            </td>
                            <td>${cita.mensaje}</td>
                            <td>${cita.estado}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="ControlCliente?opc=1" class="btn btn-secondary">Volver a la lista de clientes</a>
        </div>
    </div>

    <%@ include file="../footer.jsp" %>
</body>
</html>
