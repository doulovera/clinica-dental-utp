package servlet;

import dao.CitasDao;
import models.Citas;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/agendar-cita")
public class RegistrarCitaServlet extends HttpServlet {
    private CitasDao citasDao = new CitasDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/agendarCita.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String idDoctorStr = request.getParameter("idDoctor");
        String idClienteStr = request.getParameter("idCliente");
        String fechaStr = request.getParameter("fecha");
        String mensaje = request.getParameter("mensaje");
        String estado = request.getParameter("estado");

        if (idDoctorStr != null && idClienteStr != null && fechaStr != null) {
            try {
                int idDoctor = Integer.parseInt(idDoctorStr);
                int idCliente = Integer.parseInt(idClienteStr);
                Date fecha = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(fechaStr);

                Citas cita = new Citas();
                cita.setIdDoctor(idDoctor);
                cita.setIdCliente(idCliente);
                cita.setFecha(fecha);
                cita.setMensaje(mensaje);
                cita.setEstado(estado);

                if (citasDao.agregarCita(cita)) {
                    request.setAttribute("responseMessage", "Cita agendada correctamente.");
                } else {
                    request.setAttribute("responseMessage", "Error al agendar la cita.");
                }
            } catch (NumberFormatException | ParseException e) {
                e.printStackTrace();
                request.setAttribute("responseMessage", "Error en los datos proporcionados.");
            }
        } else {
            request.setAttribute("responseMessage", "Parámetros faltantes.");
        }

        request.getRequestDispatcher("/WEB-INF/views/agendarCita.jsp").forward(request, response);
    }

    protected void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
