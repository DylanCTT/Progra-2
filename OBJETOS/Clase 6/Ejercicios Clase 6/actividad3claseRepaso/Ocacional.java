public class Ocacional extends Recital{
    private String motivo;
    private String nomContratante;
    private String fechaEvento;
    
    public Ocacional(String nomBanda,int cantCanciones,String motivo,String fechaEvento,String nomContratante){
        super(nomBanda,cantCanciones);
        this.motivo=motivo;
        this.nomContratante=nomContratante;
        this.fechaEvento=fechaEvento;
    }
    
    public Ocacional(){
        
    }
    
    public String getMotivo() {
        return motivo;
    }
    
    public void setMotivo(String motivo) {
        this.motivo= motivo;
    }
    
    public String getNomContratante() {
        return nomContratante;
    }
    
    public void setNomContratante(String nomContratante) {
        this.nomContratante= nomContratante;
    }
    
    public String getFechaEvento() {
        return fechaEvento;
    }
    
    public void setFechaEvento(String fechaEvento) {
        this.fechaEvento= fechaEvento;
    }
    
    
}
