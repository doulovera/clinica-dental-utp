package controlador;

import dao.*;
import modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlDoctor extends HttpServlet {

    private DoctorDAO obj = new DoctorDAO();
    private EspecialidadDAO obj2 = new EspecialidadDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                listarDoctor(request, response);
                break;
            case 2:
                agregarDoctor(request, response);
                break;
            case 3:
                buscarDoctor(request, response);
                break;
            case 4:
                modificarDoctor(request, response);
                break;
            case 5:
                eliminarDoctor(request, response);
                break;
            case 6:
                listarEspecialidad(request, response);
                break;
            case 7:
                agregarEspecialidad(request, response);
                break;
            case 8:
                eliminarEspecialidad(request, response);
                break;
            case 9:
                mostrarHistorial(request, response);
                break;
        }
    }

    protected void listarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Verificar si el parámetro idEspecialidad está presente
            String idEspecialidadParam = request.getParameter("idEspecialidad");
            List<Doctor> listaDoctores;

            // Si el parámetro es nulo o vacío, lista todos los doctores
            if (idEspecialidadParam == null || idEspecialidadParam.isEmpty()) {
                listaDoctores = obj.listar(); // Este método debe listar todos los doctores sin filtrar por especialidad
            } else {
                int idEspecialidad = Integer.parseInt(idEspecialidadParam);
                listaDoctores = obj.listarPorEspecialidad(idEspecialidad);
            }

            List<Especialidad> especialidades = obj2.listar();
            request.setAttribute("listaDoctores", listaDoctores);
            request.setAttribute("especialidades", especialidades);
            request.getRequestDispatcher("/admin/Doctor/listarDoctores.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void agregarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Verifica si se solicita cargar el formulario o registrar el doctor
            String action = request.getParameter("action");
            if (action == null || action.isEmpty()) {
                // Cargar la lista de especialidades y redirigir a agregarDoctor.jsp
                List<Especialidad> especialidades = obj2.listar(); // Usando tu EspecialidadDAO para obtener la lista
                request.setAttribute("especialidades", especialidades);
                request.getRequestDispatcher("/admin/Doctor/agregarDoctor.jsp").forward(request, response);
            } else {
                // Procesar el registro del doctor
                int idEspecialidad = Integer.parseInt(request.getParameter("idEspecialidad"));
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                int edad = Integer.parseInt(request.getParameter("edad"));

                Doctor doctor = new Doctor();
                doctor.setIdEspecialidad(idEspecialidad);
                doctor.setNombre(nombre);
                doctor.setApellidos(apellidos);
                doctor.setEdad(edad);

                boolean registrado = obj.registrarDoctor(doctor);
                if (registrado) {
                    response.sendRedirect("ControlDoctor?opc=1&idEspecialidad=" + idEspecialidad);
                } else {
                    response.sendRedirect("/admin/doctor/error.jsp");
                }
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected void buscarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Doctor doctor = obj.buscarPorId(id); // Asegúrate de tener un método buscarPorId en DoctorDAO.
            List<Especialidad> especialidades = obj2.listar(); // Para mostrar las especialidades en el formulario.
            request.setAttribute("doctor", doctor);
            request.setAttribute("especialidades", especialidades);
            request.getRequestDispatcher("/admin/Doctor/editarDoctor.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void modificarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int idEspecialidad = Integer.parseInt(request.getParameter("idEspecialidad"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            int edad = Integer.parseInt(request.getParameter("edad"));

            Doctor doctor = new Doctor(id, idEspecialidad, nombre, apellidos, edad);
            boolean editado = obj.editarDoctor(doctor);

            if (editado) {
                response.sendRedirect("ControlDoctor?opc=1&idEspecialidad=" + idEspecialidad);
            } else {
                response.sendRedirect("/admin/Doctor/error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected void eliminarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            obj.eliminar(id);
            response.sendRedirect("ControlDoctor?opc=1&idEspecialidad=" + request.getParameter("idEspecialidad"));
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void listarEspecialidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Especialidad> especialidades = obj2.listar();
            request.setAttribute("especialidades", especialidades);
            request.getRequestDispatcher("/admin/Doctor/listarDoctores.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void agregarEspecialidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tipo = request.getParameter("tipo");
            Especialidad especialidad = new Especialidad();
            especialidad.setTipo(tipo);

            obj2.agregar(especialidad);

            // Redirigir a listar doctores con el parámetro modalOpen=true
            response.sendRedirect("ControlDoctor?opc=1&modalOpen=true");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void eliminarEspecialidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            obj2.eliminar(id);

            // Redirigir a listar doctores con el parámetro modalOpen=true
            response.sendRedirect("ControlDoctor?opc=1&modalOpen=true");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void mostrarHistorial(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idDoctor = Integer.parseInt(request.getParameter("id"));

            // Obtener el historial de citas del doctor
            List<Map<String, Object>> citas = obj.mostrarCitasPorDoctor(idDoctor);

            // Obtener los datos del doctor
            Doctor doctor = obj.obtenerDoctorPorId(idDoctor);
            if (doctor == null) {
                throw new ServletException("No se encontró el doctor con ID: " + idDoctor);
            }

            // Concatenar nombre completo del doctor
            String nombreCompletoDoctor = doctor.getNombre() + " " + doctor.getApellidos();

            // Pasar los datos al JSP
            request.setAttribute("citas", citas);
            request.setAttribute("titulo", "Historial de Citas del Doctor " + nombreCompletoDoctor);

            // Redirigir a la página de historial
            String pag = "/admin/Doctor/historialDoctor.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        } catch (NumberFormatException e) {
            throw new ServletException("ID del doctor inválido", e);
        } catch (Exception e) {
            throw new ServletException("Error al mostrar el historial del doctor", e);
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
        return "Controlador para la gestión de doctores";
    }
}
