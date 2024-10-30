<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${titulo}</title>
        <!-- Bootstrap y otros estilos están en el include -->
    </head>
    <body>
        <%@include file="../header.jsp" %>

        <div class="container my-5">
            <h1 class="text-center mb-4">${titulo}</h1>

            <!-- Tabla de historial de citas -->
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
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
                            <td>${cita.cliente}</td>
                            <!-- Separar la fecha en formato dd-MM-yyyy -->
                            <td><fmt:formatDate value="${cita.fecha}" pattern="dd-MM-yyyy" /></td>
                            <!-- Mostrar la hora en formato de 12 horas con AM/PM -->
                            <td><fmt:formatDate value="${cita.fecha}" pattern="hh:mm a" /></td>
                            <td>${cita.mensaje}</td>
                            <td>
                                <span class="badge 
                                    <c:choose>
                                        <c:when test="${cita.estado == 'Pendiente'}">bg-warning text-dark</c:when>
                                        <c:when test="${cita.estado == 'Completada'}">bg-success</c:when>
                                        <c:when test="${cita.estado == 'Cancelada'}">bg-danger</c:when>
                                        <c:otherwise>bg-secondary</c:otherwise>
                                    </c:choose>
                                ">
                                    ${cita.estado}
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${citas.isEmpty()}">
                        <tr>
                            <td colspan="6" class="text-center">No hay citas registradas para este doctor.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <!-- Botón de regreso -->
            <div class="text-center mt-4">
                <a href="${pageContext.request.contextPath}/ControlDoctor?opc=1" class="btn btn-secondary">Regresar</a>
            </div>
        </div>

        <%@include file="../footer.jsp" %>
    </body>
</html>

