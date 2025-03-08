public class Jugador extends Empleado {
  private int part,goles;
  
  public Jugador (String nombre, int dni, double sueldo, int part, int goles) {
    super(nombre,dni,sueldo);
    this.setPart(part);
    this.setGoles(goles);
  }
  
  public Jugador() {
      
  }
  
  public int getPart() {
    return part;    
  }
  
  public int getGoles() {
    return goles;
  }
  
  public void setPart(int part) {
    this.part = part;
  }
  
  public void setGoles(int goes) {
    this.goles = goles;
  }
  
  public double calcularSueldoACobrar () {
    double sueldoTot=getSueldo();
    double promedio = getGoles()/getPart();
    if (promedio>0.5) sueldoTot=sueldoTot*2;
    return sueldoTot;
  }
  
  public String toString () {
      String aux;
      aux= super.toString() + ("Goles: " + this.getGoles() + " Partidos: " + this.getPart());
      return aux;
  }
}