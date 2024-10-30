package controlador;

import dao.EmpleadoDao;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Empleado;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Invalidar la sesión
        HttpSession session = request.getSession();
        session.invalidate();

        // Redirigir al login
        response.sendRedirect("admin/index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String user = request.getParameter("txtuser");
        String pass = request.getParameter("txtpass");

        // Instanciar el DAO y validar el usuario
        EmpleadoDao dao = new EmpleadoDao();
        Empleado empleado = dao.validarUsuario(user, pass);

        // Validación de credenciales
        if (empleado != null) {
            // Verificar si el estado del empleado es "Inactivo"
            if ("Inactivo".equals(empleado.getEstado())) {
                // Si el estado es "Inactivo", negar el acceso y mostrar un mensaje de error
                request.setAttribute("loginError", "Inactivo"); // Enviar un atributo indicando error de estado
                RequestDispatcher dispatcher = request.getRequestDispatcher("admin/index.jsp");
                dispatcher.forward(request, response);
            } else {
                // Si el usuario es válido y está activo, crear sesión
                HttpSession session = request.getSession();
                session.setAttribute("empleado", empleado);

                // Redirigir a la página principal
                response.sendRedirect("admin/home.jsp");
            }
        } else {
            // Si las credenciales no son válidas, enviar un mensaje de error
            request.setAttribute("loginError", "credentials"); // Enviar un atributo indicando error de credenciales
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/index.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet de manejo de inicio de sesión";
    }
}

