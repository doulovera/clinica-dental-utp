package modelo;

import java.sql.Timestamp;

public class Cita {
    private int id;
    private int idDoctor;
    private int idCliente;
    private Timestamp fecha;
    private String mensaje;
    private String estado;

    // Constructor vacío
    public Cita() {}

    public Cita(int id, int idDoctor, int idCliente, Timestamp fecha, String mensaje, String estado) {
        this.id = id;
        this.idDoctor = idDoctor;
        this.idCliente = idCliente;
        this.fecha = fecha;
        this.mensaje = mensaje;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}