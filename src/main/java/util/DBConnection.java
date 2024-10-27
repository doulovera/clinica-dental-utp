package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String DB_NAME = "asistencia_prueba";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME; // URL
    private static final String USER = "root"; // Usuario
    private static final String PASSWORD = ""; // Contraseña

    private static Connection connection = null;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Conexión exitosa a la base de datos '" + DB_NAME + "'");
            } catch (ClassNotFoundException e) {
                System.err.println("Error: Driver no encontrado.");
            } catch (SQLException e) {
                System.err.println("Error en la conexión: " + e.getMessage());
            }
        }
        return connection;
    }

    // Método para cerrar la conexión
    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Conexión cerrada.");
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
