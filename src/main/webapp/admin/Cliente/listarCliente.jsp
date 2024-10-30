<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Lista de Clientes</title>
</head>
<body>
    <%@include file="../header.jsp" %>

    <div class="container my-5">
        <h2 class="text-center mb-4">Lista de Pacientes</h2>
        <div class="text-end mb-3">
            <a href="ControlCliente?opc=2" class="btn btn-primary">Agregar Cliente</a>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>Correo</th>
                        <th>Dirección</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cliente" items="${listaClientes}">
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nombre}</td>
                            <td>${cliente.apellidos}</td>
                            <td>${cliente.correo}</td>
                            <td>${cliente.direccion}</td>
                            <td>
                                <a href="ControlCliente?opc=3&id=${cliente.id}" class="btn btn-warning btn-sm me-1">Editar</a>
                                <a href="ControlCliente?opc=5&id=${cliente.id}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('¿Seguro que deseas eliminar este cliente?');">Eliminar</a>
                                <a href="ControlCliente?opc=6&id=${cliente.id}" class="btn btn-success btn-sm me-1">Historial</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <%@include file="../footer.jsp" %>
</body>
</html>

