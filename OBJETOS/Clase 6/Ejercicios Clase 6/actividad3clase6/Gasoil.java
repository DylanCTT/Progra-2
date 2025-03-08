public class Gasoil extends Surtidor{
  
  private String [] vecPatentes;
  private int diml;

  public Gasoil (int nroSurtidor, double impTot, int dni, String nombre, String apellido){
    super(nroSurtidor,impTot,dni,nombre,apellido);
    vecPatentes = new String [20];
    this.diml=0;
  }

  public void setPatente(String Patente){
    if (diml<20)
      vecPatentes[diml]=Patente;
      diml++;
  }
  
  public double calcularImpuestoAPagar() {
    double imp=0 ;
  if (diml<=5)
    imp=((getImpTot()*5)/100);
  else 
  if ((5<diml) && (diml<=15))
    imp=((getImpTot()*3)/100);
  else 
  if (diml>15)
    imp=((getImpTot()*1.5)/100); 
  return imp;      
 }
 
 public String toString() {
   String aux= super.toString();
   for(int i=0;i<diml;i++){
       aux=aux+"patente "+ i+ " : " + vecPatentes[i];
    }
   return aux;
}
}

