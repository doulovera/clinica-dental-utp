package InterFace;

import java.sql.SQLException;
import java.util.List;

// Interfaz genérica para operaciones CRUD
public interface IGenericDAO<T> {
    int agregar(T entidad) throws SQLException;
    List<T> listar() throws SQLException;
    void actualizar(T entidad) throws SQLException;
    void eliminar(int id) throws SQLException;
}

