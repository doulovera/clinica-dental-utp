
package dao;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.MySQLConexion;

public class ReportesDAO {

    public int contarClientesRegistrados() {
        int totalClientes = 0;
        String sql = "{CALL contarClientesRegistrados()}";

        try (Connection cn = MySQLConexion.getConexion();
             CallableStatement cs = cn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            if (rs.next()) {
                totalClientes = rs.getInt("total_clientes");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalClientes;
    }

    public int contarCitasPendientesHoy() {
        int totalPendientes = 0;
        String sql = "{CALL contarCitasPendientesHoy()}";

        try (Connection cn = MySQLConexion.getConexion();
             CallableStatement cs = cn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            if (rs.next()) {
                totalPendientes = rs.getInt("total_pendientes_hoy");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalPendientes;
    }

    public int contarCitasVencidasHoy() {
        int totalVencidas = 0;
        String sql = "{CALL contarCitasVencidasHoy()}";

        try (Connection cn = MySQLConexion.getConexion();
             CallableStatement cs = cn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            if (rs.next()) {
                totalVencidas = rs.getInt("total_vencidas_hoy");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalVencidas;
    }
}
