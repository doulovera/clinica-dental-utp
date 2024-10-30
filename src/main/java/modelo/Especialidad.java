package modelo;

public class Especialidad {

    private int id;
    private String tipo;

    // Constructor vacío
    public Especialidad() {
    }

    public Especialidad(int id, String tipo) {
        this.id = id;
        this.tipo = tipo;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
