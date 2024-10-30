package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CitasDAO;
import dao.DoctorDAO;
import dao.EspecialidadDAO;
import modelo.*;

public class ControlVetInser extends HttpServlet {

    EspecialidadDAO especialidadDAO = new EspecialidadDAO();
    DoctorDAO doctorDAO = new DoctorDAO();
    CitasDAO citasDAO = new CitasDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            List<Especialidad> especialidades = especialidadDAO.listar();
            request.setAttribute("especialidades", especialidades);

            String idEspecialidadStr = request.getParameter("idEspecialidad");
            if (idEspecialidadStr != null && !idEspecialidadStr.trim().isEmpty()) {
                int idEspecialidad = Integer.parseInt(idEspecialidadStr);
                List<Doctor> doctores = doctorDAO.listarPorEspecialidad(idEspecialidad);
                request.setAttribute("doctores", doctores);
                request.setAttribute("idEspecialidad", idEspecialidadStr);
            }

            String idDoctorStr = request.getParameter("idDoctor");
            if (idDoctorStr != null) {
                request.setAttribute("idDoctor", idDoctorStr);
            }

            // Validación y procesamiento solo si la acción es "registrar"
            if ("registrar".equals(action)
                    && idDoctorStr != null && !idDoctorStr.trim().isEmpty()
                    && request.getParameter("txtFechaCita") != null && !request.getParameter("txtFechaCita").trim().isEmpty()
                    && request.getParameter("txtNombreCliente") != null
                    && request.getParameter("txtApellidosCliente") != null) {
                registrarCita(request, response);
            } else {
                // Enviar al formulario si no se ha enviado la acción de registro
                request.getRequestDispatcher("/Cita.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al cargar los datos: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void registrarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fechaCitaStr = request.getParameter("txtFechaCita");
            if (fechaCitaStr != null && !fechaCitaStr.trim().isEmpty()) {
                fechaCitaStr = fechaCitaStr.replace("T", " ") + ":00";
                Timestamp fechaCita = Timestamp.valueOf(fechaCitaStr);

                // Obtener detalles del cliente
                String nombreCliente = request.getParameter("txtNombreCliente");
                String apellidosCliente = request.getParameter("txtApellidosCliente");
                String correoCliente = request.getParameter("txtCorreoCliente");
                String direccionCliente = request.getParameter("txtDireccionCliente");

                Cliente cliente = new Cliente(nombreCliente, apellidosCliente, correoCliente, direccionCliente);
                int idDoctor = Integer.parseInt(request.getParameter("idDoctor"));
                String mensajeCita = request.getParameter("txtMensajeCita");
                String estadoCita = request.getParameter("txtEstadoCita");

                // Validar disponibilidad de cita
                if (!citasDAO.verificarDisponibilidad(idDoctor, fechaCita)) {
                    request.setAttribute("errorMessage", "La fecha y hora seleccionadas no están disponibles.");
                    request.getRequestDispatcher("/Cita.jsp").forward(request, response);
                    return;
                }

                // Registrar la cita si está disponible
                citasDAO.realizarCita(cliente, idDoctor, fechaCita, mensajeCita, estadoCita);

                // Redirigir a la página de confirmación
                request.getRequestDispatcher("/pagConfirmacionInsercion.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Debe proporcionar una fecha válida para la cita.");
                request.getRequestDispatcher("/Cita.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al registrar la cita: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para la inserción de datos en la veterinaria";
    }
}
