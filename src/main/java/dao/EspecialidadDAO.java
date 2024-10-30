package dao;

import InterFace.IGenericDAO;
import modelo.Especialidad;
import util.MySQLConexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// Implementación de la interfaz genérica para la entidad Especialidad
public class EspecialidadDAO implements IGenericDAO<Especialidad> {

    @Override
    public int agregar(Especialidad especialidad) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "INSERT INTO especialidad (tipo) VALUES (?)";
        PreparedStatement st = cn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        st.setString(1, especialidad.getTipo());

        st.executeUpdate();
        ResultSet rs = st.getGeneratedKeys();
        rs.next();
        return rs.getInt(1); // Retorna el ID generado
    }

    @Override
    public List<Especialidad> listar() throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "SELECT * FROM especialidad";
        PreparedStatement st = cn.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        List<Especialidad> especialidades = new ArrayList<>();
        while (rs.next()) {
            Especialidad especialidad = new Especialidad();
            especialidad.setId(rs.getInt("id"));
            especialidad.setTipo(rs.getString("tipo"));
            especialidades.add(especialidad);
        }
        return especialidades;
    }

    @Override
    public void actualizar(Especialidad especialidad) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "UPDATE especialidad SET tipo = ? WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);

        st.setString(1, especialidad.getTipo());
        st.setInt(2, especialidad.getId());

        st.executeUpdate();
    }

    @Override
    public void eliminar(int id) throws SQLException {
        Connection cn = MySQLConexion.getConexion();
        String sql = "DELETE FROM especialidad WHERE id = ?";
        PreparedStatement st = cn.prepareStatement(sql);

        st.setInt(1, id);
        st.executeUpdate();
    }

    public List<Especialidad> obtenerEspecialidades() {
        List<Especialidad> lista = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = MySQLConexion.getConexion();
            String sql = "SELECT * FROM especialidad";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Especialidad especialidad = new Especialidad(
                        rs.getInt("id"),
                        rs.getString("tipo")
                );
                lista.add(especialidad);
            }
        } catch (SQLException ex) {
            System.out.println("Error al obtener especialidades: " + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión: " + ex.getMessage());
            }
        }
        return lista;
    }
}
