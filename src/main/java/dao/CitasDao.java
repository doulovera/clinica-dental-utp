package dao;

import models.Citas;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CitasDao {
    private Connection connection;

    public CitasDao() {
        connection = DBConnection.getConnection();
    }

    public boolean agregarCita(Citas cita) {
        String sql = "INSERT INTO citas (idDoctor, idCliente, fecha, mensaje, estado) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, cita.getIdDoctor());
            stmt.setInt(2, cita.getIdCliente());
            stmt.setTimestamp(3, new Timestamp(cita.getFecha().getTime()));
            stmt.setString(4, cita.getMensaje());
            stmt.setString(5, cita.getEstado());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean actualizarCita(Citas cita) {
        String sql = "UPDATE citas SET idDoctor = ?, idCliente = ?, fecha = ?, mensaje = ?, estado = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, cita.getIdDoctor());
            stmt.setInt(2, cita.getIdCliente());
            stmt.setTimestamp(3, new Timestamp(cita.getFecha().getTime()));
            stmt.setString(4, cita.getMensaje());
            stmt.setString(5, cita.getEstado());
            stmt.setInt(6, cita.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean eliminarCita(int id) {
        String sql = "DELETE FROM citas WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Citas> obtenerCitasDoctor(int idDoctor) {
        List<Citas> citasList = new ArrayList<>();
        String sql = "SELECT * FROM citas WHERE idDoctor = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, idDoctor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Citas cita = new Citas(
                        rs.getInt("id"),
                        rs.getInt("idDoctor"),
                        rs.getInt("idCliente"),
                        rs.getTimestamp("fecha"),
                        rs.getString("mensaje"),
                        rs.getString("estado")
                );
                citasList.add(cita);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return citasList;
    }
}
