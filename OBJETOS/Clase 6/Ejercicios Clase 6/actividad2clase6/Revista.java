public class Revista extends Ejemplar{
    private int caps;
    private String nombre;
    private int vol;

    public Revista (String cod, int pags,int año, String resumen, Responsable r, int caps, String nombre, int vol){
         super(cod,pags,año,resumen,r);
        this.caps=caps;
        this.nombre=nombre;
        this.vol=vol;    
    }
    
    public int getCaps (){
        return caps;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public int getVol(){
        return vol;
    }
    
    public void setCaps(int caps){
        this.caps=caps;
    }
    
    public void setNombre (String nombre){
        this.nombre=nombre;
    }
    
    public void setVol(int vol){
        this.vol=vol;
    }
    
    @Override
    public String toString () {
      String aux;
      aux= (" nombre: " + this.getNombre() + "N°volumen: " + this.getVol());
      return aux;
    }
    
    @Override
    public void Publicacion(){
      super.Publicacion();
      Generador g=new Generador();
      setVol(g.getNroVolumen());
    }  
}