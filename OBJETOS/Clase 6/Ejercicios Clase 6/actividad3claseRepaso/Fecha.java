public class Fecha{
    private String dia;
    private String ciudad;
    
    public Fecha(String dia,String ciudad){
        this.dia= dia;
        this.ciudad=ciudad;
    }
    
    public Fecha(){
        
    }
    
    public String getDia() {
        return dia;
    }
    
    public void setDia(String dia) {
        this.dia= dia;
    }
    
    public String getCiudad() {
        return ciudad;
    }
    
    public void setCiudad(String ciudad) {
        this.ciudad= ciudad;
    }
}