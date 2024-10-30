
package modelo;

public class Empleado {

    int id;
    private String dni;
    private String nom;
    private String edad;
    private String tel;
    private String estado;
    private String rol;
    private String user;
    private String pass;

    public Empleado() {
    }

    public Empleado(int id, String dni, String nom, String edad, String tel, String estado, String rol, String user, String pass) {
        this.id = id;
        this.dni = dni;
        this.nom = nom;
        this.edad = edad;
        this.tel = tel;
        this.estado = estado;
        this.rol = rol;
        this.user = user;
        this.pass = pass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

   
    

}