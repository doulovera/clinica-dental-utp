<%@page import="modelo.Empleado"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administración de Usuarios</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
        <!-- SweetAlert CSS & JS -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <!-- Sección de Configuración - Administración de Usuarios -->
        <section id="configuracion" class="admin-section section">
            <div class="container section-title" data-aos="fade-up">
                <h2>Administración de Empleados</h2>
                <p>Gestiona los empleados del sistema, revisa sus credenciales y asigna roles.</p>
            </div>

            <div class="container" data-aos="fade-up">
                <div class="row">
                    <!-- Formulario de registro/edición de empleado -->
                    <div class="col-md-4">
                        <div class="d-flex justify-content-center mt-3">
                            <h4><%= request.getAttribute("titulo") != null ? request.getAttribute("titulo") : "Registrar"%> Empleado</h4>
                            
                        </div>
                            <hr>
                        <form action="EmpleadoControlador" method="post">
                            <input type="hidden" name="opc" value="<%= request.getAttribute("nro") != null ? request.getAttribute("nro") : 2%>"> <!-- Determina si es registrar o editar -->
                            <input type="hidden" name="txtid" value="<%= request.getAttribute("empleado") != null ? ((Empleado) request.getAttribute("empleado")).getId() : ""%>">

                            <div class="mb-3">
                                <label for="txtdni" class="form-label">DNI:</label>
                                <input type="text" class="form-control" id="txtdni" name="txtdni" placeholder="Ingrese DNI" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getDni() != null ? ((Empleado) request.getAttribute("empleado")).getDni() : ""%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtnom" class="form-label">Nombre y Apellidos:</label>
                                <input type="text" class="form-control" id="txtnom" name="txtnom" placeholder="Ingrese Nombre" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getNom() != null ? ((Empleado) request.getAttribute("empleado")).getNom() : ""%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtedad" class="form-label">Edad:</label>
                                <input type="number" class="form-control" id="txtedad" name="txtedad" placeholder="Ingrese Edad" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getEdad() != null ? ((Empleado) request.getAttribute("empleado")).getEdad() : ""%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="txttel" class="form-label">Teléfono:</label>
                                <input type="text" class="form-control" id="txttel" name="txttel" placeholder="Ingrese Teléfono" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getTel() != null ? ((Empleado) request.getAttribute("empleado")).getTel() : ""%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtestado" class="form-label">Estado:</label>
                                <select class="form-control" id="txtestado" name="txtestado" required>
                                    <option value="">Seleccione Estado</option>
                                    <option value="Activo" <%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getEstado() != null && ((Empleado) request.getAttribute("empleado")).getEstado().equals("Activo") ? "selected" : ""%>>Activo</option>
                                    <option value="Inactivo" <%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getEstado() != null && ((Empleado) request.getAttribute("empleado")).getEstado().equals("Inactivo") ? "selected" : ""%>>Inactivo</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="txtrol" class="form-label">Rol:</label>
                                <select class="form-control" id="txtrol" name="txtrol" required>
                                    <option value="">Seleccione Rol</option>
                                    <option value="Administrador" <%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getRol() != null && ((Empleado) request.getAttribute("empleado")).getRol().equals("Administrador") ? "selected" : ""%>>Administrador</option>
                                    <option value="Empleado" <%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getRol() != null && ((Empleado) request.getAttribute("empleado")).getRol().equals("Empleado") ? "selected" : ""%>>Empleado</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="txtuser" class="form-label">Usuario:</label>
                                <input type="text" class="form-control" id="txtuser" name="txtuser" placeholder="Ingrese Usuario" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getUser() != null ? ((Empleado) request.getAttribute("empleado")).getUser() : ""%>" required>
                            </div>
                            <div class="mb-3">
                                <label for="txtpass" class="form-label">Contraseña:</label>
                                <input type="password" class="form-control" id="txtpass" name="txtpass" placeholder="Ingrese Contraseña" 
                                       value="<%= request.getAttribute("empleado") != null && ((Empleado) request.getAttribute("empleado")).getPass() != null ? ((Empleado) request.getAttribute("empleado")).getPass() : ""%>" required>
                            </div >
                            <div class="d-flex justify-content-center mt-3">
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>

                        </form>
                    </div>

                    <!-- Tabla de Empleados -->
                    <div class="col-md-8">
                        <h4>Lista de Empleados</h4>
                        <hr>
                        <table id="empleadosTable" class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>DNI</th>
                                    <th>Nombre</th>
                                    <th>Edad</th>
                                    <th>Teléfono</th>
                                    <th>Estado</th>
                                    <th>Rol</th>
                                    <th>Usuario</th>
                                    <th>Contraseña</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Empleado> listaEmpleados = (List<Empleado>) request.getAttribute("dato");
                                    if (listaEmpleados != null) {
                                        int i = 1;
                                        for (Empleado e : listaEmpleados) {
                                %>
                                <tr>
                                    <td><%= i++%></td>
                                    <td><%= e.getDni()%></td>
                                    <td><%= e.getNom()%></td>
                                    <td><%= e.getEdad()%></td>
                                    <td><%= e.getTel()%></td>
                                    <td><%= e.getEstado()%></td>
                                    <td><%= e.getRol()%></td>
                                    <td><%= e.getUser()%></td>
                                    <td>
                                        <div class="input-group">
                                            <input type="password" class="form-control" id="password<%= i%>" value="<%= e.getPass()%>" readonly>
                                            <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password<%= i%>', this)">
                                                <i class="bi bi-eye-slash"></i>
                                            </button>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="EmpleadoControlador?opc=3&id=<%= e.getId()%>" class="btn btn-success btn-sm">
                                            <i class="bi bi-pencil-square fs-4"></i> <!-- Aumentar el tamaño con fs-4 -->
                                        </a>
                                        <a href="#" class="btn btn-danger btn-sm" onclick="confirmarEliminacion(<%= e.getId()%>)">
                                            <i class="bi bi-trash fs-4"></i> <!-- Aumentar el tamaño con fs-4 -->
                                        </a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section><!-- Fin de la Sección de Administración de Empleados -->

        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
        <!-- Inicialización de DataTables en español -->
        <script>
           $(document).ready(function () {
                $('#empleadosTable').DataTable({
                    "pageLength": 10, // Mostrar 10 registros por página
                    "lengthMenu": [10, 25, 50, 75, 100], // Opciones de registros por página
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por página",
                        "zeroRecords": "No se encontraron registros",
                        "info": "Mostrando página _PAGE_ de _PAGES_",
                        "infoEmpty": "No hay registros disponibles",
                        "infoFiltered": "(filtrado de _MAX_ registros totales)",
                        "search": "Buscar:",
                        "paginate": {
                            "first": "Primero",
                            "last": "Último",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
            });

            // Script para el botón de mostrar/ocultar contraseña
            function togglePassword(fieldId, button) {
                var input = document.getElementById(fieldId);
                if (input.type === "password") {
                    input.type = "text";
                    button.innerHTML = '<i class="bi bi-eye"></i>';  // Cambia a icono de ojo abierto
                } else {
                    input.type = "password";
                    button.innerHTML = '<i class="bi bi-eye-slash"></i>';  // Cambia a icono de ojo cerrado
                }
            }

            // Confirmación de eliminación con SweetAlert
            function confirmarEliminacion(id) {
                Swal.fire({
                    title: '¿Estás seguro?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Sí, eliminar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = 'EmpleadoControlador?opc=5&id=' + id;
                    }
                });
            }


        </script>
        <!-- Verificar si hay un parámetro 'success' en la URL -->
        <script>
            $(document).ready(function () {
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.has('success')) {
                    Swal.fire({
                        title: 'Operación Exitosa',
                        text: 'El empleado ha sido guardado exitosamente.',
                        icon: 'success',
                        confirmButtonText: 'Aceptar'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = 'EmpleadoControlador?opc=1';  // Redirige a la lista sin el parámetro 'success'
                        }
                    });
                }
            });
        </script>


        <%@include file="footer.jsp" %>
    </body>
</html>