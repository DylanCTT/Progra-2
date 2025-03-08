public class Entrenador extends Empleado {
  private int camp;
  
  public Entrenador (String nombre, int dni, double sueldo, int camp) {
    super(nombre,dni,sueldo);
    this.setCamp(camp);
  }
  
  public Entrenador () {
      
  }
  
  public int getCamp() {
    return camp;    
  }
  
  public void setCamp(int camp) {
    this.camp = camp;
  }
  
  public double calcularSueldoACobrar () {
    double sueldoTot=getSueldo();
    if ((camp>=1) && (camp<=4)) sueldoTot+=5000;
    else if ((camp>=5) && (camp<=10)) sueldoTot+=30000;
    else if (camp>=10) sueldoTot+=50000;
    return sueldoTot;
  }
   public String toString () {
      String aux;
      aux= super.toString() + ("Campeonatos ganados: " + this.getCamp());
      return aux;
  }
}