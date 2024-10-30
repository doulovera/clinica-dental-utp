package dao;

import InterFace.IGenericDAO;
import modelo.Cliente;
import util.MySQLConexion;

import java.sql.*;
import java.util.*;

// Implementación de la interfaz genérica para la entidad Cliente
public class ClienteDAO implements IGenericDAO<Cliente> {

    @Override
    public int agregar(Cliente cliente) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO cliente (nombre, apellidos, correo, direccion) VALUES (?,?,?,?)";
        PreparedStatement st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        st.setString(1, cliente.getNombre());
        st.setString(2, cliente.getApellidos());
        st.setString(3, cliente.getCorreo());
        st.setString(4, cliente.getDireccion());

        st.executeUpdate();
        ResultSet rs = st.getGeneratedKeys();
        rs.next();
        return rs.getInt(1); // Retorna el ID generado
    }

    @Override
    public List<Cliente> listar() throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM cliente";
        PreparedStatement st = cn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        List<Cliente> clientes = new ArrayList<>();
        while (rs.next()) {
            Cliente cliente = new Cliente();
            cliente.setId(rs.getInt("id"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellidos(rs.getString("apellidos"));
            cliente.setCorreo(rs.getString("correo"));
            cliente.setDireccion(rs.getString("direccion"));
            clientes.add(cliente);
        }
        return clientes;
    }

    @Override
    public void actualizar(Cliente cliente) throws SQLException {
        String sql = "UPDATE cliente SET nombre = ?, apellidos = ?, correo = ?, direccion = ? WHERE id = ?";
        try (Connection cn = MySQLConexion.getConexion(); PreparedStatement st = cn.prepareStatement(sql)) {

            st.setString(1, cliente.getNombre());
            st.setString(2, cliente.getApellidos());
            st.setString(3, cliente.getCorreo());
            st.setString(4, cliente.getDireccion());
            st.setInt(5, cliente.getId());

            int rowsUpdated = st.executeUpdate();
            System.out.println("Filas actualizadas en Cliente: " + rowsUpdated);
            if (rowsUpdated == 0) {
                throw new SQLException("No se pudo actualizar el cliente, ID no encontrado.");
            }
        }
    }

    @Override
    public void eliminar(int id) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "DELETE FROM cliente WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);

        st.setInt(1, id);
        st.executeUpdate();
    }

    // Método modificado para obtener historial de citas por cliente con nombre completo del doctor
    public List<Map<String, Object>> mostrarHistorialCitasPorCliente(int idCliente) {
        Connection cn = MySQLConexion.getConexion();
        List<Map<String, Object>> lista = new ArrayList<>();
        try {
            String sql = "SELECT c.id, CONCAT(d.nombre, ' ', d.apellidos) AS doctor, c.fecha, c.mensaje, c.estado "
                    + "FROM citas c "
                    + "JOIN doctor d ON c.iddoctor = d.id "
                    + "WHERE c.idcliente = ?";
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", rs.getInt("id"));
                map.put("doctor", rs.getString("doctor")); // Nombre completo del doctor
                map.put("fecha", rs.getTimestamp("fecha"));
                map.put("mensaje", rs.getString("mensaje"));
                map.put("estado", rs.getString("estado"));
                lista.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log para depuración
        }
        return lista;
    }

    // Método adicional para obtener un cliente por ID
    public Cliente obtenerClientePorId(int idCliente) {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT id, nombre, apellidos, correo, direccion FROM cliente WHERE id = ?";
        try (PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idCliente);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente cliente = new Cliente();
                    cliente.setId(rs.getInt("id"));
                    cliente.setNombre(rs.getString("nombre"));
                    cliente.setApellidos(rs.getString("apellidos"));
                    cliente.setCorreo(rs.getString("correo"));
                    cliente.setDireccion(rs.getString("direccion"));
                    return cliente;
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log de error para depuración
        }
        return null; // Retorna null si no encuentra el cliente
    }

}
