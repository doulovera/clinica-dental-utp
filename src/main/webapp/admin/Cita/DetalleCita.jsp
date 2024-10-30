<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Detalles de la Cita</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <%@include file="../header.jsp" %>
    <body>
        <section>
            <div class="container mt-5">
                <h1 class="mb-4 text-center">Detalles de la Cita</h1>
                <div class="card shadow-sm rounded">
                    <div class="card-body">
                       
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h6 class="text-secondary border-bottom pb-1">Detalles del Cliente</h6>
                                
                                <p><strong>Nombre del Cliente:</strong> ${cliente.nombre} ${cliente.apellidos}</p>
                                <p><strong>Correo del Cliente:</strong> ${cliente.correo}</p>
                                <p><strong>Dirección del Cliente:</strong> ${cliente.direccion}</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h6 class="text-secondary border-bottom pb-1">Detalles del Doctor</h6>
                                <p><strong>Doctor:</strong> ${doctor.nombre} ${doctor.apellidos}</p>
                                <p><strong>Especialidad:</strong> ${especialidad.tipo}</p>
                                
                                <!-- Agregar margen superior para más separación -->
                                <h6 class="text-secondary border-bottom pb-1 mt-4">Información de la Cita</h6>
                                <p><strong>Fecha:</strong> <span id="fecha"></span></p>
                                <p><strong>Hora:</strong> <span id="hora"></span></p>
                                <p><strong>Mensaje:</strong> ${cita.mensaje}</p>
                                <p><strong>Estado:</strong> 
                                    <span class="badge ${cita.estado == 'Cancelado' ? 'bg-danger' : 'bg-success'}">
                                        ${cita.estado}
                                    </span>
                                </p>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <a href="ControlCita?opc=1" class="btn btn-primary">
                                <i class="bi bi-arrow-left"></i> Volver al listado de citas
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                // Obtener la fecha y hora desde el backend
                const fechaCompleta = '${cita.fecha}'; // Formato esperado: yyyy-MM-dd HH:mm:ss

                // Función para formatear la fecha y la hora
                function formatearFechaHora(fechaCompleta) {
                    const fecha = new Date(fechaCompleta);
                    const opcionesFecha = {year: 'numeric', month: 'long', day: 'numeric'};
                    const opcionesHora = {hour: 'numeric', minute: '2-digit', hour12: true};

                    const fechaFormateada = fecha.toLocaleDateString('es-ES', opcionesFecha);
                    const horaFormateada = fecha.toLocaleTimeString('es-ES', opcionesHora);

                    document.getElementById('fecha').innerText = fechaFormateada;
                    document.getElementById('hora').innerText = horaFormateada;
                }

                // Llamar a la función para formatear
                formatearFechaHora(fechaCompleta);
            </script>
        </section>
    </body>
    <%@include file="../footer.jsp" %>
</html>




