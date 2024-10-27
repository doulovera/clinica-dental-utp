package models;

import java.util.Date;

public class Citas {
    private int id;
    private int idDoctor;
    private int idCliente;
    private Date fecha;
    private String mensaje;
    private String estado;

    public Citas() {}

    public Citas(int id, int idDoctor, int idCliente, Date fecha, String mensaje, String estado) {
        this.id = id;
        this.idDoctor = idDoctor;
        this.idCliente = idCliente;
        this.fecha = fecha;
        this.mensaje = mensaje;
        this.estado = estado;
    }

    // Getters y Setters
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
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
