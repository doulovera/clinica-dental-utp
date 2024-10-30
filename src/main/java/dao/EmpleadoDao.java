package dao;

import InterFace.IGenericDAO;
import modelo.Empleado;
import util.MySQLConexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Implementación de la interfaz genérica para la entidad Empleado
public class EmpleadoDao implements IGenericDAO<Empleado> {

    @Override
    public List<Empleado> listar() {
        List<Empleado> lista = new ArrayList<>();
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM empleado");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Empleado emp = new Empleado();
                emp.setId(rs.getInt("id"));
                emp.setDni(rs.getString("dni"));
                emp.setNom(rs.getString("nom"));
                emp.setEdad(rs.getString("edad"));
                emp.setTel(rs.getString("tel"));
                emp.setEstado(rs.getString("estado"));
                emp.setRol(rs.getString("rol"));
                emp.setUser(rs.getString("user"));
                emp.setPass(rs.getString("pass"));
                lista.add(emp);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar empleados: " + ex.getMessage());
        }
        return lista;
    }

    @Override
    public int agregar(Empleado emp) throws SQLException {
        String sql = "INSERT INTO empleado (dni, nom, edad, tel, estado, rol, user, pass) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, emp.getDni());
            ps.setString(2, emp.getNom());
            ps.setString(3, emp.getEdad());
            ps.setString(4, emp.getTel());
            ps.setString(5, emp.getEstado());
            ps.setString(6, emp.getRol());
            ps.setString(7, emp.getUser());
            ps.setString(8, emp.getPass());

            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1); // Retorna el ID generado
            }
        }
        return -1;
    }

    @Override
    public void actualizar(Empleado emp) throws SQLException {
        String sql = "UPDATE empleado SET dni = ?, nom = ?, edad = ?, tel = ?, estado = ?, rol = ?, user = ?, pass = ? WHERE id = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getDni());
            ps.setString(2, emp.getNom());
            ps.setString(3, emp.getEdad());
            ps.setString(4, emp.getTel());
            ps.setString(5, emp.getEstado());
            ps.setString(6, emp.getRol());
            ps.setString(7, emp.getUser());
            ps.setString(8, emp.getPass());
            ps.setInt(9, emp.getId());

            ps.executeUpdate();
        }
    }

    @Override
    public void eliminar(int id) throws SQLException {
        String sql = "DELETE FROM empleado WHERE id = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // Método adicional: obtener empleado por ID
    public Empleado obtenerPorId(int id) {
        Empleado emp = null;
        String sql = "SELECT * FROM empleado WHERE id = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    emp = new Empleado();
                    emp.setId(rs.getInt("id"));
                    emp.setDni(rs.getString("dni"));
                    emp.setNom(rs.getString("nom"));
                    emp.setEdad(rs.getString("edad"));
                    emp.setTel(rs.getString("tel"));
                    emp.setEstado(rs.getString("estado"));
                    emp.setRol(rs.getString("rol"));
                    emp.setUser(rs.getString("user"));
                    emp.setPass(rs.getString("pass"));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener empleado por ID: " + ex.getMessage());
        }
        return emp;
    }

    // Método adicional: validar usuario
    public Empleado validarUsuario(String user, String pass) {
        Empleado emp = null;
        String sql = "SELECT * FROM empleado WHERE user = ? AND pass = ?";
        try (Connection con = MySQLConexion.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user);
            ps.setString(2, pass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    emp = new Empleado();
                    emp.setId(rs.getInt("id"));
                    emp.setDni(rs.getString("dni"));
                    emp.setNom(rs.getString("nom"));
                    emp.setEdad(rs.getString("edad"));
                    emp.setTel(rs.getString("tel"));
                    emp.setEstado(rs.getString("estado"));
                    emp.setRol(rs.getString("rol"));
                    emp.setUser(rs.getString("user"));
                    emp.setPass(rs.getString("pass"));
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error al validar el usuario: " + ex.getMessage());
        }
        return emp;
    }
}
