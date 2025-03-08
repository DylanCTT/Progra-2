public abstract class Empleado{
    private String nombre;
    private int dni;
    private double sueldo;
    
    public Empleado (String nombre, int dni, double sueldo) {
      this.setNombre(nombre);    
      this.setDni(dni);
      this.setSueldo(sueldo);
    }
    
    public Empleado () {
        
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public int getDni() {
        return dni;
    }
    
    public double getSueldo() {
      return sueldo;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void setDni(int dni) {
        this.dni = dni;
    }
    
    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public abstract double calcularSueldoACobrar();
    
    public String toString() {
      String aux;
      aux = "Nombre: " + this.getNombre() + " DNI: " + this.getDni() + " Sueldo: " + this.getSueldo();
      return aux;
    }
}
  