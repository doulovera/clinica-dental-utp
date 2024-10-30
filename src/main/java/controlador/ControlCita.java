package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import modelo.*;

/**
 * ControlCita es un servlet que maneja las operaciones relacionadas con las citas.
 */
public class ControlCita extends HttpServlet {

    CrudCitaDAO obj = new CrudCitaDAO();  // Ajustado para usar CrudCitaDAO

    /**
     * Procesa las solicitudes HTTP tanto GET como POST.
     *
     * @param request  el objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response el objeto HttpServletResponse que contiene la respuesta que el servlet devuelve
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException      si hay un error de entrada/salida
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                mostrarDatos(request, response);
                break;
            case 2:
                actualizarDatos(request, response);
                break;
            case 3:
                eliminarDatos(request, response);
                break;
            case 4:
                cargarFormularioEdicion(request, response);
                break;
            case 5:
                cargarDetalles(request, response);
                break;
            default:
                mostrarDatos(request, response);
                break;
        }
    }

    /**
     * Muestra los datos de la cita en la interfaz correspondiente.
     *
     * @param request  el objeto HttpServletRequest que contiene la solicitud del cliente
     * @param response el objeto HttpServletResponse que contiene la respuesta que el servlet devuelve
     * @throws ServletException si ocurre un error específico del servlet
     * @throws IOException      si hay un error de entrada/salida
     */
    private void mostrarDatos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los datos desde el CrudCitaDAO
        List<Map<String, Object>> citasCompletas = obj.mostrarCita();  // Asegúrate de que mostrarCita devuelve los datos completos de las citas
        request.setAttribute("citasCompletas", citasCompletas);  // Pasar la lista de citas completas a la JSP
        request.setAttribute("mensaje", "Datos listados correctamente.");

        String pag = "/admin/Cita/Citas.jsp";  // Define tu página JSP de resultados
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void actualizarDatos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Log para verificar que el método se está ejecutando
            System.out.println("Ejecutando actualizarDatos...");

            // Verificar los valores recibidos desde el formulario
            String nombreCliente = request.getParameter("nombreCliente");
            System.out.println("Nombre Cliente Recibido: " + nombreCliente);

            // Crear y poblar los objetos
            Cliente cliente = new Cliente();
            cliente.setId(Integer.parseInt(request.getParameter("idCliente")));
            cliente.setNombre(nombreCliente);
            cliente.setApellidos(request.getParameter("apellidosCliente"));
            cliente.setCorreo(request.getParameter("correoCliente"));
            cliente.setDireccion(request.getParameter("direccionCliente"));

            // Obtener la fecha del formulario y convertirla
            String fechaFormulario = request.getParameter("fechaCita");
            System.out.println("Fecha recibida: " + fechaFormulario);

            // Transformar la fecha al formato aceptado por Timestamp
            String fechaFormateada = fechaFormulario.replace("T", " ") + ":00"; // Añadir segundos
            Timestamp fechaCita = Timestamp.valueOf(fechaFormateada);
            System.out.println("Fecha formateada: " + fechaCita);

            int idCita = Integer.parseInt(request.getParameter("idCita"));
            int idDoctor = Integer.parseInt(request.getParameter("idDoctor"));
            int idEspecialidad = Integer.parseInt(request.getParameter("idEspecialidad"));
            String mensaje = request.getParameter("mensajeCita");
            String estado = request.getParameter("estadoCita");

            // Log para verificar los valores antes de la actualización
            System.out.println("idCita: " + idCita);
            System.out.println("idEspecialidad: " + idEspecialidad);
            System.out.println("idDoctor: " + idDoctor);
            System.out.println("Fecha: " + fechaCita);
            System.out.println("Mensaje: " + mensaje);
            System.out.println("Estado: " + estado);

            // Llamar al método del CrudCitaDAO para actualizar los datos de la cita
            obj.editarCita(idCita, idEspecialidad, idDoctor, fechaCita, mensaje, estado);

            // Mostrar la lista actualizada
            mostrarDatos(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al actualizar los datos.");
            request.getRequestDispatcher("/admin/Cita/EditarCita.jsp").forward(request, response);
        }
    }

    protected void eliminarDatos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idCita = Integer.parseInt(request.getParameter("idCita"));

        // Llama al método del CrudCitaDAO para eliminar los datos
        obj.eliminarCita(idCliente, idCita);

        // Después de eliminar los datos, vuelve a cargar los datos
        mostrarDatos(request, response);
    }

    protected void cargarFormularioEdicion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idCita = Integer.parseInt(request.getParameter("idCita"));

            // Llamar al CrudCitaDAO para obtener los datos relacionados a partir del idCita
            Map<String, Object> datosRelacionados = obj.obtenerDatosRelacionados(idCita);

            // Pasar los datos al formulario de edición
            request.setAttribute("cliente", datosRelacionados.get("cliente"));
            request.setAttribute("especialidad", datosRelacionados.get("especialidad"));
            request.setAttribute("doctor", datosRelacionados.get("doctor"));
            request.setAttribute("cita", datosRelacionados.get("cita"));

            // Redirigir al formulario de edición
            request.getRequestDispatcher("/admin/Cita/EditarCita.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al cargar los datos.");
            mostrarDatos(request, response);  // Volver a la lista de citas en caso de error
        }
    }

    protected void cargarDetalles(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idCita = Integer.parseInt(request.getParameter("idCita"));

            // Llamar al CrudCitaDAO para obtener los datos relacionados a partir del idCita
            Map<String, Object> datosRelacionados = obj.obtenerDatosRelacionados(idCita);

            // Pasar los datos al detalle de la cita
            request.setAttribute("cliente", datosRelacionados.get("cliente"));
            request.setAttribute("especialidad", datosRelacionados.get("especialidad"));
            request.setAttribute("doctor", datosRelacionados.get("doctor"));
            request.setAttribute("cita", datosRelacionados.get("cita"));

            // Redirigir al detalle de la cita
            request.getRequestDispatcher("/admin/Cita/DetalleCita.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al cargar los datos.");
            mostrarDatos(request, response);  // Volver a la lista de citas en caso de error
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
