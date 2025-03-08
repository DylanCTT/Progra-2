public class Libro extends Ejemplar{
    private String titulo;
    private int caps;
    private boolean bolsillo;

    public Libro (String cod,int pags, String resumen, Responsable r,int año, String titulo,int caps, boolean bolsillo){
        super (cod, pags,año, resumen, r);
        this.titulo=titulo;
        this.caps=caps;
        this.bolsillo=bolsillo;    
    }
    public Libro (){
        
    }
    
    
    public int getCaps (){
        return caps;
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public boolean getBolsillo(){
        return bolsillo;
    }
    
    public void setCaps(int Caps){
        this.caps=caps;
    }
    
    public void setTitulo (String titulo){
        this.titulo=titulo;
    }
    
    public void setBolsillo(boolean bolsillo){
        this.bolsillo=bolsillo;
    }
    
    @Override
    public String toString () {
      String aux;
      aux= ("codigo: " + this.getCod() + ". Titulo: " + this.getTitulo() + ". Nombre del responsable: " + this.getResponsable().getNombre() +" " + this.getResponsable().getApellido());
      return aux;   
    }
    
    @Override
    public void Publicacion() {
      super.Publicacion();
      if (getBolsillo()){//tengo que hacerlor con un get o no hace falta?
        setTitulo(getTitulo()+" -De bolsillo");          
    }
    }
}