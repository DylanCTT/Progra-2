public class Nafta extends Surtidor{
  private double lts;
  
  public Nafta (int nroSurtidor, double impTot, int dni, String nombre, String apellido,double lts){
      super(nroSurtidor,impTot,dni,nombre,apellido);
      this.setLts(lts);
  }
  public double getLts(){
      return lts;
  }
  
  public void setLts(double lts){
      this.lts=lts;
  }
  
  public double calcularImpuestoAPagar() {
   double imp =((2*getLts())/100);
   return imp;    
  }
  
  public String toString(){
      String aux=super.toString()+ ("Litros cargados: "+getLts());
      return aux;
  }
   
}