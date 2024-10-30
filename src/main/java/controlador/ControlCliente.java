package controlador;

import modelo.Cliente;
import dao.ClienteDAO;
import java.util.List;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlCliente extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                listarCliente(request, response);
                break;
            case 2:
                adicionarCliente(request, response);

                break;
            case 3:
                buscarCliente(request, response);
                break;
            case 4:
                modificarCliente(request, response);
                break;
            case 5:
                eliminarCliente(request, response);
                break;
            case 6:
               mostrarHistorial(request, response);
                break;
        }
    }

    protected void listarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> listaClientes = clienteDAO.listar();
        request.setAttribute("listaClientes", listaClientes);
        request.getRequestDispatcher("/admin/Cliente/listarCliente.jsp").forward(request, response);
    }

    protected void adicionarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        // Verifica si el parámetro 'nombre' está presente para determinar si es una solicitud POST
        String nombre = request.getParameter("nombre");

        if (nombre == null || nombre.isEmpty()) {
            // Si no se envió el parámetro 'nombre', redirige al formulario de agregarCliente.jsp
            request.getRequestDispatcher("/admin/Cliente/agregarCliente.jsp").forward(request, response);
        } else {
            // Si se envió el parámetro 'nombre', procesa los datos del formulario
            String apellidos = request.getParameter("apellidos");
            String correo = request.getParameter("correo");
            String direccion = request.getParameter("direccion");

            Cliente cliente = new Cliente();
            cliente.setNombre(nombre);
            cliente.setApellidos(apellidos);
            cliente.setCorreo(correo);
            cliente.setDireccion(direccion);

            ClienteDAO clienteDAO = new ClienteDAO();
            clienteDAO.agregar(cliente);

            // Redirecciona al listado de clientes después de agregar
            response.sendRedirect("ControlCliente?opc=1");
        }
    }

    protected void buscarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO clienteDAO = new ClienteDAO();
        Cliente cliente = clienteDAO.obtenerClientePorId(id); // Suponiendo que exista un método obtenerPorId en ClienteDAO
        request.setAttribute("cliente", cliente);
        request.getRequestDispatcher("/admin/Cliente/editarCliente.jsp").forward(request, response);
    }

    protected void modificarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String direccion = request.getParameter("direccion");

        Cliente cliente = new Cliente();
        cliente.setId(id);
        cliente.setNombre(nombre);
        cliente.setApellidos(apellidos);
        cliente.setCorreo(correo);
        cliente.setDireccion(direccion);

        ClienteDAO clienteDAO = new ClienteDAO();
        clienteDAO.actualizar(cliente);
        response.sendRedirect("ControlCliente?opc=1"); // Redirecciona al listado de clientes
    }

    protected void eliminarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        ClienteDAO clienteDAO = new ClienteDAO();
        clienteDAO.eliminar(id);
        response.sendRedirect("ControlCliente?opc=1"); // Redirecciona al listado de clientes
    }

    protected void mostrarHistorial(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ClienteDAO clienteDAO = new ClienteDAO();
        try {
            int idCliente = Integer.parseInt(request.getParameter("id"));

            // Obtener el historial de citas del cliente
            List<Map<String, Object>> citas = clienteDAO.mostrarHistorialCitasPorCliente(idCliente);

            // Obtener los datos del cliente
            Cliente cliente = clienteDAO.obtenerClientePorId(idCliente);
            if (cliente == null) {
                throw new ServletException("No se encontró el cliente con ID: " + idCliente);
            }

            // Concatenar nombre completo del cliente
            String nombreCompletoCliente = cliente.getNombre() + " " + cliente.getApellidos();

            // Pasar los datos al JSP
            request.setAttribute("citas", citas);
            request.setAttribute("titulo", "Historial del Paciente:  " + nombreCompletoCliente);

            // Redirigir a la página de historial del cliente
            String pag = "/admin/Cliente/historialCliente.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        } catch (NumberFormatException e) {
            throw new ServletException("ID del cliente inválido", e);
        } catch (Exception e) {
            throw new ServletException("Error al mostrar el historial del cliente", e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ControlCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ControlCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
