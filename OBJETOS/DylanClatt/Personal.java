public class Personal extends Visita{
    private boolean extranjero;
    
    public Personal(int nroVisita,Fecha F,boolean ES,boolean extranjero){
        super(nroVisita,F,ES);
        this.extranjero=extranjero;
    }
    
    public Personal(){
        
    }
    
    public boolean getExtranjero() {
        return extranjero;
    }
    
    public void setExtranjero(boolean extranjero) {
        this.extranjero= extranjero;
    }
    
    public double calcularCostoTotal(){
        double total=0;
        if (getExtranjero()){//es extranjero
            if (getES())//entra al pais
              total+=15000;
            else
              total+=10000;//sale del pais
        }
        else if(!getES())//sale del pais y es argentino
          total+=7000;
        else
          total+=0;//entra al pais
        super.calcularCostoTotal();
        return total;
    }
    
    public String toString(){
        String aux=super.toString();
        if (getExtranjero())
          aux+=(" es extranjero");
        else aux+=(" es argentino");
        return aux;
    }
}