package controlador;

import dao.EmpleadoDao;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;

public class EmpleadoControlador extends HttpServlet {

    Empleado emp = new Empleado();
    EmpleadoDao dao = new EmpleadoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int op = Integer.parseInt(request.getParameter("opc"));
        switch (op) {
            case 1:
                listarEmpleados(request, response);
                break;
            case 2:
                adicionarEmpleado(request, response);

                break;
            case 3:
                buscarEmpleado(request, response);
                break;
            case 4:
                modificarEmpleado(request, response);
                break;
            case 5:
                eliminarEmpleado(request, response);
                break;
        }
    }

    // Método para listar empleados
    protected void listarEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("dato", dao.listar());
        request.setAttribute("empleado", emp);
        request.setAttribute("titulo", "Registrar");
        request.setAttribute("nro", 2);
        String pag = "/admin/usuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    // Método para agregar empleado
    protected void adicionarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Empleado e = new Empleado();
        e.setDni(request.getParameter("txtdni"));
        e.setNom(request.getParameter("txtnom"));
        e.setEdad(request.getParameter("txtedad"));
        e.setTel(request.getParameter("txttel"));
        e.setEstado(request.getParameter("txtestado"));
        e.setRol(request.getParameter("txtrol"));
        e.setUser(request.getParameter("txtuser"));
        e.setPass(request.getParameter("txtpass"));
        dao.agregar(e);

        // Redirige con un parámetro que indique el éxito de la operación
        response.sendRedirect("EmpleadoControlador?opc=1&success=1");
    }

    // Método para eliminar empleado
    protected void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.eliminar(id);
        request.setAttribute("dato", dao.listar());
        request.setAttribute("empleado", new Empleado());
        request.setAttribute("titulo", "Registrar");
        request.setAttribute("nro", 2);
        String pag = "/admin/usuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    // Método para buscar empleado
    protected void buscarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("dato", dao.listar());
        request.setAttribute("empleado", dao.obtenerPorId(id));
        request.setAttribute("titulo", "Actualizar");
        request.setAttribute("nro", 4);
        String pag = "/admin/usuarios.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

    // Método para modificar empleado
    protected void modificarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Empleado e = new Empleado();
        e.setId(Integer.parseInt(request.getParameter("txtid")));
        e.setDni(request.getParameter("txtdni"));
        e.setNom(request.getParameter("txtnom"));
        e.setEdad(request.getParameter("txtedad"));
        e.setTel(request.getParameter("txttel"));
        e.setEstado(request.getParameter("txtestado"));
        e.setRol(request.getParameter("txtrol"));
        e.setUser(request.getParameter("txtuser"));
        e.setPass(request.getParameter("txtpass"));
        dao.actualizar(e);

        // Redirige con un parámetro que indique el éxito de la operación
        response.sendRedirect("EmpleadoControlador?opc=1&success=1");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EmpleadoControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
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
