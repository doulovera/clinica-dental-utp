package dao;

import java.sql.*;
import modelo.*;
import util.MySQLConexion;
import java.util.*;

public class CrudCitaDAO {

    public void editarCita(int idCita, int idEspecialidad, int idDoctor, Timestamp fecha, String mensaje, String estado) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "{CALL editar_cita(?, ?, ?, ?, ?, ?)}";

        try (CallableStatement cs = cn.prepareCall(sql)) {
            cs.setInt(1, idCita);
            cs.setInt(2, idEspecialidad);
            cs.setInt(3, idDoctor);
            cs.setTimestamp(4, fecha);
            cs.setString(5, mensaje);
            cs.setString(6, estado);

            cs.execute();
            System.out.println("Cita actualizada con éxito.");
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<Map<String, Object>> mostrarCita() {
        Connection cn = MySQLConexion.getConexion();
        List<Map<String, Object>> citasCompletas = new ArrayList<>();  // Lista de mapas que contendrán todos los datos relacionados
        try {
            // Obtener todos los clientes
            ClienteDAO clienteDAO = new ClienteDAO();
            List<Cliente> clientes = clienteDAO.listar();

            // Obtener todas las especialidades
            EspecialidadDAO especialidadDAO = new EspecialidadDAO();
            List<Especialidad> especialidades = especialidadDAO.listar();

            // Obtener todos los doctores
            DoctorDAO doctorDAO = new DoctorDAO();
            List<Doctor> doctores = doctorDAO.listar();

            // Obtener todas las citas
            CitasDAO citasDAO = new CitasDAO();
            List<Cita> citas = citasDAO.listar();

            // Asociar los datos relacionados y almacenarlos en un mapa para cada cita
            for (Cita cita : citas) {
                // Obtener el doctor relacionado con la cita
                Doctor doctorRelacionado = doctores.stream()
                        .filter(doc -> doc.getId() == cita.getIdDoctor())
                        .findFirst()
                        .orElse(null);

                // Obtener el cliente relacionado con la cita
                Cliente clienteRelacionado = clientes.stream()
                        .filter(cli -> cli.getId() == cita.getIdCliente())
                        .findFirst()
                        .orElse(null);

                // Obtener la especialidad del doctor relacionado
                Especialidad especialidadRelacionada = especialidades.stream()
                        .filter(espec -> espec.getId() == doctorRelacionado.getIdEspecialidad())
                        .findFirst()
                        .orElse(null);

                // Crear un mapa para almacenar los datos de la cita con todas sus relaciones
                Map<String, Object> citaCompleta = new HashMap<>();
                citaCompleta.put("cita", cita);
                citaCompleta.put("cliente", clienteRelacionado);
                citaCompleta.put("doctor", doctorRelacionado);
                citaCompleta.put("especialidad", especialidadRelacionada != null ? especialidadRelacionada.getTipo() : "N/A");

                // Añadir el mapa a la lista
                citasCompletas.add(citaCompleta);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Cerrar la conexión
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return citasCompletas;
    }

    public Map<String, Object> obtenerDatosRelacionados(int idCita) {
        Map<String, Object> datosRelacionados = new HashMap<>();
        try (Connection cn = MySQLConexion.getConexion()) {
            String sql = "SELECT c.*, cl.*, d.*, e.* "
                    + "FROM citas c "
                    + "JOIN cliente cl ON c.idCliente = cl.id "
                    + "JOIN doctor d ON c.idDoctor = d.id "
                    + "JOIN especialidad e ON d.idEspecialidad = e.id "
                    + "WHERE c.id = ?";

            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, idCita);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("cl.id"));
                cliente.setNombre(rs.getString("cl.nombre"));
                cliente.setApellidos(rs.getString("cl.apellidos"));
                cliente.setCorreo(rs.getString("cl.correo"));
                cliente.setDireccion(rs.getString("cl.direccion"));

                Especialidad especialidad = new Especialidad();
                especialidad.setId(rs.getInt("e.id"));
                especialidad.setTipo(rs.getString("e.tipo"));

                Doctor doctor = new Doctor();
                doctor.setId(rs.getInt("d.id"));
                doctor.setIdEspecialidad(rs.getInt("d.idEspecialidad"));
                doctor.setNombre(rs.getString("d.nombre"));
                doctor.setApellidos(rs.getString("d.apellidos"));
                doctor.setEdad(rs.getInt("d.edad"));

                Cita cita = new Cita();
                cita.setId(rs.getInt("c.id"));
                cita.setIdDoctor(rs.getInt("c.idDoctor"));
                cita.setIdCliente(rs.getInt("c.idCliente"));
                cita.setFecha(rs.getTimestamp("c.fecha"));
                cita.setMensaje(rs.getString("c.mensaje"));
                cita.setEstado(rs.getString("c.estado"));

                datosRelacionados.put("cliente", cliente);
                datosRelacionados.put("especialidad", especialidad);
                datosRelacionados.put("doctor", doctor);
                datosRelacionados.put("cita", cita);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return datosRelacionados;
    }

    public void eliminarCita(int idCliente, int idCita) {
        Connection cn = MySQLConexion.getConexion();
        try {
            // Desactivar auto-commit para manejar la transacción manualmente
            cn.setAutoCommit(false);

            // Primero eliminar las citas asociadas
            CitasDAO citasDAO = new CitasDAO();
            citasDAO.eliminar(idCita);

            // Finalmente, eliminar el cliente
            ClienteDAO clienteDAO = new ClienteDAO();
            clienteDAO.eliminar(idCliente);

            // Confirmar la transacción si todo ha ido bien
            cn.commit();
        } catch (Exception e) {
            // En caso de error, revertir la transacción
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            // Restaurar el auto-commit y cerrar la conexión
            try {
                if (cn != null) {
                    cn.setAutoCommit(true);
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
