package dao;

import java.sql.*;
import java.util.*;
import util.MySQLConexion;

public class GraficoDao {

    public Map<String, Integer> contarCitasVencidasPorMesUltimoAno() {
        Map<String, Integer> citasPorMes = new LinkedHashMap<>();

        String sql = "{CALL contarCitasVencidasPorMesUltimoAno()}";
        
        try (Connection cn = MySQLConexion.getConexion();
             CallableStatement cs = cn.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {
             
            while (rs.next()) {
                String mes = rs.getString("mes");
                int total = rs.getInt("total");
                citasPorMes.put(mes, total);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return citasPorMes;
    }
}




