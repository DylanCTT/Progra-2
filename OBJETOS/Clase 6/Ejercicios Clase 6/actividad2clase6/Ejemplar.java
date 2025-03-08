public abstract class Ejemplar {
  private int pags;
  private String cod;
  private String resumen;
  private int año;
  private Responsable r;
  
  public Ejemplar (String cod, int pags,int año, String resumen, Responsable r) {
    this.año=año;
    this.setPags(pags);
    this.setCod(cod);
    this.setResumen(resumen);
    this.setResponsable(r);
  }
  
  public Ejemplar () {
    
  }
  
  public int getPags() {
    return pags;
  }
  
  public String getCod(){
      return cod;
  }
  
  public String getResumen() {
    return resumen;
  }
  
  public Responsable getResponsable () {
    return r;
  }
  
  public void setPags(int pags) {
    this.pags = pags;
  }
  
  public void setCod(String cod) {
    this.cod = cod;
  }
  
  public void setResumen(String resumen){
      this.resumen=resumen;
  }
  
  public void setResponsable (Responsable r){//preguntar sobre esto
    this.r = r;
  }
  
   public void setAño (int año){
    this.año = año;
  }

  public abstract String toString ();
  
  public void Publicacion (){
    this.setAño(2024);   
  }
}