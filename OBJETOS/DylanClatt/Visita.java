public abstract class Visita{
    private int nroVisita;
    private Fecha F;
    private boolean ES;
    
    public Visita (int nroVisita,Fecha F,boolean ES){
        this.nroVisita=nroVisita;
        this.F=F;
        this.ES=ES;
    }
    
    public Visita(){
        
    }
    
    public int getNroVisita() {
        return nroVisita;
    }
    
    public void setNroVisita(int nroVisita) {
        this.nroVisita= nroVisita;
    }
    
    public Fecha getF() {
        return F;
    }
    
    public void setF(Fecha F) {
        this.F= F;
    }
    
    public boolean getES() {
        return ES;
    }
    
    public void setES(boolean ES) {
        this.ES= ES;
    }
    
    public double calcularCostoTotal(){
        double total=0;
        if(F.getAño()==2024){
          if((F.getDia()>=11)&&(F.getDia()<=18)&&((F.getMes()==10)||(F.getMes()==11))){
            total=total*0.1;
          }
        }
        return total;
    }
    
    public String toString(){
        String aux;
        aux=(" numero de visita: "+nroVisita+ " fecha: "+F.getDia()+"/"+F.getMes()+"/"+F.getAño());
        if (getES())
          aux+=(" entra al pais ");
        else
          aux+=(" sale del pais ");
        return aux;
    }
    
}