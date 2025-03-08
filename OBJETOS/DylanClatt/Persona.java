public class Persona{
    private int edad;
    private String tipoDoc;
    private int nroDoc;
    
    public Persona(int edad,String tipoDoc,int nroDoc){
        this.edad=edad;
        this.tipoDoc=tipoDoc;
        this.nroDoc=nroDoc;
    }
    
    public Persona(){
        
    }
    
    public int getEdad() {
        return edad;
    }
    
    public void setEdad(int edad) {
        this.edad= edad;
    }
    
    public String getTipoDoc() {
        return tipoDoc;
    }
    
    public void setTipoDoc(String tipoDoc) {
        this.tipoDoc= tipoDoc;
    }
    
    public int getNroDoc() {
        return nroDoc;
    }
    
    public void setNroDoc(int nroDoc) {
        this.nroDoc= nroDoc;
    }
    
    public String toString(){
        String aux;
        aux=("Edad: "+ getEdad()+(" tipo de documento: "+ getTipoDoc()+ " numero de documento: "+getNroDoc()));
        return aux;
    }
}