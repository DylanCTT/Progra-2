public class Giras extends Recital{
    private String nomGira;
    private Fecha[] fechas;
    private int cantFechas;
    private int diml;
    public Giras(String nomBanda,int cantCanciones,String nomGira){
        super(nomBanda,cantCanciones);
        this.nomGira=nomGira;
        fechas=new Fecha[cantFechas];
        diml=0;
    }
    
    public Giras(){
        
    }
    
    public String getNomGira() {
        return nomGira;
    }
    
    public void setNomGira(String nomGira) {
        this.nomGira= nomGira;
    }
    
    public void agregarFecha (Fecha F){
        if(diml<cantFechas){
            fechas[diml]=F;
            diml++;
        } 
    }
}