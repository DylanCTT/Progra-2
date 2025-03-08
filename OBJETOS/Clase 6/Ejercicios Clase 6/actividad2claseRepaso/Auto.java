public class Auto{
    private String nomDueño;
    private String patente;
    
    public Auto (String nomDueño,String patente){
        this.nomDueño=nomDueño;
        this.patente=patente;
    }
    
    public String getNomDueño() {
	return nomDueño;
    }
    
    public void setNomDueño(String nomDueño) {
	this.nomDueño = nomDueño;
    }
    
    public String getPatente() {
	return patente;
    }
    
    public void setPatente(String patente) {
	this.patente = patente;
    }
    
    public String toString(){
        String aux=("nombre del dueño del auto: "+ getNomDueño()+" patente del auto "+ getPatente());
        return aux;
    }
}