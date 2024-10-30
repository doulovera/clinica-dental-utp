package dao;

import dao.CitasDAO;
import modelo.Cita;
import modelo.Cliente;
import util.MySQLConexion;

import java.sql.Timestamp;
import java.util.List;

public class CitasDAOManualTest {

    public static void main(String[] args) {
        try {
            CitasDAO citasDAO = new CitasDAO();

            // 1. Prueba agregar una cita
            Cita cita = new Cita(1, 1, new Timestamp(System.currentTimeMillis()), "Prueba mensaje", "pendiente");
            int citaId = citasDAO.agregar(cita);
            System.out.println("Prueba agregar: Cita agregada con ID = " + citaId);

            // 2. Prueba listar citas
            List<Cita> citas = citasDAO.listar();
            System.out.println("Prueba listar: Número de citas en la lista = " + citas.size());

            // 3. Prueba actualizar una cita
            cita.setId(citaId);
            cita.setMensaje("Mensaje actualizado");
            cita.setEstado("atendido");
            citasDAO.actualizar(cita);
            System.out.println("Prueba actualizar: Cita con ID " + citaId + " actualizada.");

            // 4. Prueba eliminar una cita
            citasDAO.eliminar(citaId);
            System.out.println("Prueba eliminar: Cita con ID " + citaId + " eliminada.");

            // 5. Prueba verificar disponibilidad
            int idDoctor = 1;
            Timestamp fecha = new Timestamp(System.currentTimeMillis() + 86400000); // Fecha futura
            boolean disponibilidad = citasDAO.verificarDisponibilidad(idDoctor, fecha);
            System.out.println("Prueba verificar disponibilidad: Disponibilidad = " + disponibilidad);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}