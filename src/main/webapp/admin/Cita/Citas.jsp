<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    </head>
    <%@include file="../header.jsp" %>
    <body>
        <div class="container mt-4">
            <!-- Sección de Citas -->
            <section id="citas" class="admin-section section">
                <h1 class="mb-4 text-center">Listado de Citas</h1>

                <div class="table-responsive">
                    <table id="tablaCitas" class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID Cita</th>
                                <th>Cliente</th>
                                <th>Doctor</th>
                                <th>Especialidad</th>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Mensaje</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="citaCompleta" items="${citasCompletas}">
                                <tr>
                                    <td>${citaCompleta.cita.id}</td>
                                    <td>${citaCompleta.cliente.nombre} ${citaCompleta.cliente.apellidos}</td>
                                    <td>${citaCompleta.doctor.nombre} ${citaCompleta.doctor.apellidos}</td>
                                    <td>${citaCompleta.especialidad}</td>
                                    <td>
                                        <fmt:formatDate value="${citaCompleta.cita.fecha}" pattern="dd-MM-yyyy"/>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${citaCompleta.cita.fecha}" pattern="hh:mm a"/>
                                    </td>
                                    <td>${citaCompleta.cita.mensaje}</td>
                                    <td>
                                        <span class="badge 
                                              <c:choose>
                                                  <c:when test="${citaCompleta.cita.estado == 'Pendiente'}">bg-success</c:when>
                                                  <c:when test="${citaCompleta.cita.estado == 'Atendido'}">bg-primary</c:when>
                                                  <c:when test="${citaCompleta.cita.estado == 'Cancelado'}">bg-danger text-light</c:when>
                                                  <c:when test="${citaCompleta.cita.estado == 'Vencido'}">bg-dark text-light</c:when>
                                                  <c:otherwise>bg-secondary</c:otherwise>
                                              </c:choose>">
                                            ${citaCompleta.cita.estado}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="ControlCita?opc=4&idCita=${citaCompleta.cita.id}" class="btn btn-primary btn-sm">Editar</a>
                                        <a href="ControlCita?opc=5&idCita=${citaCompleta.cita.id}" class="btn btn-info btn-sm">Detalles</a>
                                        <a href="ControlCita?opc=3&idCita=${citaCompleta.cita.id}&idCliente=${citaCompleta.cliente.id}" class="btn btn-danger btn-sm"
                                           onclick="return confirm('¿Está seguro de eliminar esta cita?');">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <!-- jQuery (necesario para DataTables) -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
        <!-- Inicialización de DataTables -->
        <script>
               $(document).ready(function () {
                   $('#tablaCitas').DataTable({
                       "language": {
                           "decimal": "",
                           "emptyTable": "No hay información",
                           "info": "Mostrando _START_ a _END_ de _TOTAL_ citas",
                           "infoEmpty": "Mostrando 0 a 0 de 0 citas",
                           "infoFiltered": "(Filtrado de _MAX_ total citas)",
                           "infoPostFix": "",
                           "thousands": ",",
                           "lengthMenu": "Mostrar _MENU_ citas",
                           "loadingRecords": "Cargando...",
                           "processing": "Procesando...",
                           "search": "Buscar:",
                           "zeroRecords": "No se encontraron resultados",
                           "paginate": {
                               "first": "Primero",
                               "last": "Último",
                               "next": "Siguiente",
                               "previous": "Anterior"
                           },
                           "aria": {
                               "sortAscending": ": activar para ordenar la columna de manera ascendente",
                               "sortDescending": ": activar para ordenar la columna de manera descendente"
                           }
                       },
                       "pageLength": 10,
                       "lengthMenu": [5, 10, 20, 50],
                       "order": [[0, "desc"]]  // Ordenar por la primera columna (ID Cita) de forma descendente por defecto
                   });
               });
        </script>

    </body>
    <%@include file="../footer.jsp" %>

</html>


