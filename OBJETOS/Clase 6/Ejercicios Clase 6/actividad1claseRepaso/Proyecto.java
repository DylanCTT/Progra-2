public class Proyecto {
  private String nombre;
  private int cod;
  private String director;
  private Investigador[] vecInv;
  private int diml;
  
  public Proyecto (String nombre,int cod,String director){
      this.nombre=nombre;
      this.cod=cod;
      this.director=director;
      vecInv=new Investigador[50];
      diml=0;
  }
  
  public Proyecto (){
      
  }
  
  public String getNombre() {
    return nombre;
  }
  
  public int getCod() {
    return cod;
  }
  
  public String getDirector() {
    return director;
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;
  }
  
  public void setCod(int cod) {
    this.cod = cod;
  }
  
  public void setDirector(String director) {
    this.director = director;
  }
  
  public void agregarInvestigador (Investigador inv) {
    if (diml<50){
      vecInv[diml] = inv;
      diml++;
    }
  }
  
  public double dineroTotalOtorgado(){
      double tot=0;
      for (int i=0;i<diml;i++){
          tot+=vecInv[i].subM();
      }
      return tot;
  }
  
  public void otorgarTodos(String nombreLlegada){
    for (int j=0;j<diml;j++){
      if (vecInv[j].getNombre().equals(nombreLlegada))  
        vecInv[j].habilitar(nombreLlegada);
    }
  }
  
  @Override
  public String toString() {
    String aux;
    aux = "Nombre del proyecto: " + getNombre() + ". Codigo: " + getCod() + ". Nombre director: " + getDirector() + ". Dinero total otorgado: " + dineroTotalOtorgado() + ". Informacion investigadores: ";
    for (int k=0; k<diml; k++) {
      aux += vecInv[k].toString();
    }
    return aux;
  }
  
}