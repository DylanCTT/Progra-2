public abstract class Recital{
    private String nomBanda;
    private String[] listaTemas;
    private int diml;
    private int cantCanciones;
    
    public Recital(String nomBanda,int cantCanciones){
        this.nomBanda=nomBanda;
        this.cantCanciones=cantCanciones;
        listaTemas=new String[cantCanciones];
        diml=0;
    }
    
    public Recital(){
        
    }
    
    public String getNomBanca() {
        return nomBanda;
    }
    
    public void setNomBanda(String nomBanda) {
        this.nomBanda= nomBanda;
    }
    
    public int getCantCanciones(){
        return cantCanciones;
    }
    
    public void setCantCanciones(int cantCanciones){
        this.cantCanciones=cantCanciones;
    }
    
    public void agregarCancion(String tema){
        if (diml<cantCanciones){
          listaTemas[diml]=tema;
          diml++;
        }
    }
    
    
}