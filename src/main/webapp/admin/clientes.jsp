
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <!-- Sección de Clientes -->
        <section id="clientes" class="admin-section section">
            <div class="container section-title" data-aos="fade-up">
                <h2>Gestión de Clientes</h2>
                <p>Revisa y administra los datos de los clientes.</p>
            </div>

            <div class="container" data-aos="fade-up">
                <h4>Lista de Clientes</h4>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Juan Pérez</td>
                            <td>juanperez@example.com</td>
                            <td>+51 987 654 321</td>
                            <td>
                                <a href="edit-client.html" class="btn btn-warning btn-sm">Editar</a>
                                <a href="delete-client.html" class="btn btn-danger btn-sm">Eliminar</a>
                                <a href="histori-client.html" class="btn btn-success btn-sm">Historial</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>María Gómez</td>
                            <td>mariagomez@example.com</td>
                            <td>+51 987 654 322</td>
                            <td>
                                <a href="edit-client.html" class="btn btn-warning btn-sm">Editar</a>
                                <a href="delete-client.html" class="btn btn-danger btn-sm">Eliminar</a>
                                <a href="histori-client.html" class="btn btn-success btn-sm">Historial</a>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Carlos Paredes</td>
                            <td>carlosparedes@example.com</td>
                            <td>+51 987 654 323</td>
                            <td>
                                <a href="edit-client.html" class="btn btn-warning btn-sm">Editar</a>
                                <a href="delete-client.html" class="btn btn-danger btn-sm">Eliminar</a>
                                <a href="histori-client.html" class="btn btn-success btn-sm">Historial</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section><!-- Fin de la Sección de Clientes -->

    </body>
    <%@include file="footer.jsp" %>
</html>
