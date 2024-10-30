package modelo;

public class Doctor {

    private int id;
    private int idEspecialidad;
    private String nombre;
    private String apellidos;
    private int edad;

    // Constructor vacío
    public Doctor() {
    }

    // Constructor completo
    public Doctor(int id, int idEspecialidad, String nombre, String apellidos, int edad) {
        this.id = id;
        this.idEspecialidad = idEspecialidad;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdEspecialidad() {
        return idEspecialidad;
    }

    public void setIdEspecialidad(int idEspecialidad) {
        this.idEspecialidad = idEspecialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
}
