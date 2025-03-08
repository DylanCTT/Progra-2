public abstract class Surtidor {

  private int nroSurtidor;
  private double impTot;
  private int dni;
  private String nombre;
  private String apellido;

  public Surtidor (int nroSurtidor, double impTot, int dni, String nombre, String apellido){
    this.setNroSurtidor(nroSurtidor); 
    this.setImpTot(impTot);
    this.setDni(dni);
    this.setNombre(nombre);
    this.setApellido(apellido);
  }
  public Surtidor () {
 
  }
  
  public int getNroSurtidor() {
    return nroSurtidor;
  }
  public void setNroSurtidor(int nroSurtidor) {
    this.nroSurtidor = nroSurtidor;
  }
  public double getImpTot() {
    return impTot;
  }
  public void setImpTot(double impTot) {
    this.impTot = impTot;
  }
  public int getDni() {
    return dni;
  }
  public void setDni(int dni) {
    this.dni = dni;
  }
  public String getNombre() {
    return nombre;
  }
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  public String getApellido() {
    return apellido;
  }
  public void setApellido(String apellido) {  
    this.apellido = apellido;
  }
  public abstract double calcularImpuestoAPagar();
  
  public String toString(){
      return ("numero de surtidor: "+ getNroSurtidor() + 
      "Importe total Facturado: "+ getImpTot()+ 
      "Dni del playero: "+ getDni()+"Nombre y apellido del Playero: "+getNombre()+getApellido());
  }
}
