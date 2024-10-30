package dao;

import InterFace.IGenericDAO;
import modelo.Doctor;
import util.MySQLConexion;
import java.sql.*;
import java.util.*;

public class DoctorDAO implements IGenericDAO<Doctor> {

    @Override
    public int agregar(Doctor doctor) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO doctor (idespecialidad, nombre, apellidos, edad) VALUES (?,?,?,?)";
        PreparedStatement st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        st.setInt(1, doctor.getIdEspecialidad());
        st.setString(2, doctor.getNombre());
        st.setString(3, doctor.getApellidos());
        st.setInt(4, doctor.getEdad());

        st.executeUpdate();
        ResultSet rs = st.getGeneratedKeys();
        rs.next();
        return rs.getInt(1); // Retorna el ID generado
    }

    @Override
    public List<Doctor> listar() throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM doctor";
        PreparedStatement st = cn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        List<Doctor> doctores = new ArrayList<>();
        while (rs.next()) {
            Doctor doctor = new Doctor();
            doctor.setId(rs.getInt("id"));
            doctor.setIdEspecialidad(rs.getInt("idespecialidad"));
            doctor.setNombre(rs.getString("nombre"));
            doctor.setApellidos(rs.getString("apellidos"));
            doctor.setEdad(rs.getInt("edad"));
            doctores.add(doctor);
        }
        return doctores;
    }

    @Override
    public void actualizar(Doctor doctor) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "UPDATE doctor SET idespecialidad = ?, nombre = ?, apellidos = ?, edad = ? WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);

        st.setInt(1, doctor.getIdEspecialidad());
        st.setString(2, doctor.getNombre());
        st.setString(3, doctor.getApellidos());
        st.setInt(4, doctor.getEdad());
        st.setInt(5, doctor.getId());

        st.executeUpdate();
    }

    @Override
    public void eliminar(int id) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "DELETE FROM doctor WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);

        st.setInt(1, id);
        st.executeUpdate();
    }

    public List<Doctor> listarPorEspecialidad(int idEspecialidad) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM doctor WHERE idespecialidad = ?";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setInt(1, idEspecialidad);

        ResultSet rs = st.executeQuery();
        List<Doctor> doctores = new ArrayList<>();

        while (rs.next()) {
            Doctor doctor = new Doctor();
            doctor.setId(rs.getInt("id"));
            doctor.setIdEspecialidad(rs.getInt("idespecialidad"));
            doctor.setNombre(rs.getString("nombre"));
            doctor.setApellidos(rs.getString("apellidos"));
            doctor.setEdad(rs.getInt("edad"));
            doctores.add(doctor);
        }
        return doctores;
    }

    public boolean registrarDoctor(Doctor doctor) {
        boolean registrado = false;
        Connection con = null;
        CallableStatement cs = null;
        try {
            // Obtener conexión
            con = MySQLConexion.getConexion();
            // Llamar al procedimiento almacenado
            String sql = "{CALL registrar_doctor(?, ?, ?, ?)}";
            cs = con.prepareCall(sql);
            // Setear los parámetros
            cs.setInt(1, doctor.getIdEspecialidad());
            cs.setString(2, doctor.getNombre());
            cs.setString(3, doctor.getApellidos());
            cs.setInt(4, doctor.getEdad());
            // Ejecutar el procedimiento
            registrado = cs.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error al registrar el doctor: " + ex.getMessage());
        } finally {
            // Cerrar conexiones
            try {
                if (cs != null) {
                    cs.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return registrado;
    }

    // Método para editar un doctor
    public boolean editarDoctor(Doctor doctor) {
        boolean editado = false;
        Connection con = null;
        CallableStatement cs = null;
        try {
            con = MySQLConexion.getConexion();
            String sql = "{CALL editar_doctor(?, ?, ?, ?, ?)}";
            cs = con.prepareCall(sql);
            cs.setInt(1, doctor.getId());
            cs.setInt(2, doctor.getIdEspecialidad());
            cs.setString(3, doctor.getNombre());
            cs.setString(4, doctor.getApellidos());
            cs.setInt(5, doctor.getEdad());
            editado = cs.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error al editar el doctor: " + ex.getMessage());
        } finally {
            try {
                if (cs != null) {
                    cs.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return editado;
    }

    public Doctor buscarPorId(int id) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM doctor WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);
        st.setInt(1, id);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            return new Doctor(
                    rs.getInt("id"),
                    rs.getInt("idespecialidad"),
                    rs.getString("nombre"),
                    rs.getString("apellidos"),
                    rs.getInt("edad")
            );
        }
        return null; // Devuelve null si no se encuentra el doctor.
    }

    //===============================================================================
    public List<Map<String, Object>> mostrarCitasPorDoctor(int idDoctor) {
        Connection cn = MySQLConexion.getConexion();
        List<Map<String, Object>> lista = new ArrayList<>();
        try {
            String sql = "SELECT c.id, cl.nombre AS nombre_cliente, cl.apellidos AS apellido_cliente, c.fecha, c.mensaje, c.estado "
                    + "FROM citas c "
                    + "JOIN cliente cl ON c.idcliente = cl.id "
                    + "WHERE c.iddoctor = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idDoctor);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", rs.getInt("id"));

                // Concatenar nombre y apellido del cliente
                String nombreCompletoCliente = rs.getString("nombre_cliente") + " " + rs.getString("apellido_cliente");
                map.put("cliente", nombreCompletoCliente);

                map.put("fecha", rs.getTimestamp("fecha"));
                map.put("mensaje", rs.getString("mensaje"));
                map.put("estado", rs.getString("estado"));
                lista.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return lista;
    }

    public Doctor obtenerDoctorPorId(int idDoctor) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT id, nombre, apellidos, edad, idespecialidad FROM doctor WHERE id = ?";
        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idDoctor);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Doctor doctor = new Doctor();
                    doctor.setId(rs.getInt("id"));
                    doctor.setNombre(rs.getString("nombre"));
                    doctor.setApellidos(rs.getString("apellidos"));
                    doctor.setEdad(rs.getInt("edad"));
                    doctor.setIdEspecialidad(rs.getInt("idespecialidad"));
                    return doctor;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log de error para depuración
        }
        return null; // Retorna null si no encuentra el doctor
    }

}
