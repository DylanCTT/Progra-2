public class Investigador {
  private String nombre,especialidad;
  private int cat;
  private Subsidio[] vecSub;
  private int dimL;
  
  public Investigador(String nombre, int cat, String especialidad) {
      this.nombre=nombre;
      this.cat=cat;
      this.especialidad=especialidad;
      vecSub = new Subsidio[5];
      dimL = 0;
  }
  
  public Investigador() {
      
  }
  
  
  public String getNombre() {
    return nombre;    
  }
  
  public int getCat() {
    return cat;    
  }
  
  public String getEspecialidad() {
    return especialidad;    
  }
  
  public void agregarSubsidio(Subsidio sub){
     if(dimL<5){
         vecSub[dimL]=sub;
         dimL++;
     }
  }
  
  public void setNombre(String nombre) {
    this.nombre = nombre;    
  }
  
  public void setCat(int cat) {
    this.cat = cat;    
  }
  
  public void setEspecialidad(String especialidad) {
    this.especialidad = especialidad;    
  }
  
  public double subM(){
      double totSub=0;
      for (int i=0;i<dimL;i++){
          if (vecSub[i].getOtorgado()){
            totSub+=vecSub[i].getMonto();
      }
      }
      return totSub;
  }
  
  public void habilitar(String nombreLlegada) {
    for (int i=0;i<dimL;i++) {
       if (getNombre().equals(nombreLlegada)) 
         vecSub[i].setOtorgado(true); 
    }
  }
  
  public String chequeo(){
      if (vecSub[0].getOtorgado())
        return("esta habilitado porque pinto esa"); 
      else return("no esta habilitado somos unos cracks");
  }
  
  public String toString() {
    String aux;
    double tot=0;
    aux = "Nombre: " + getNombre() +  ". Categoria: " + getCat() + ". Especialidad: " + getEspecialidad() + "Total dinero otorgado en subsidios: " + subM();
    return aux;
  }
}