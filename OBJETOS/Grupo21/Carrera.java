public class Carrera{
    private String lugar;
    private Piloto vecPiloto[];
    
    public Carrera(String lugar){
        this.setLugar(lugar);
        vecPiloto= new Piloto[10];
    }
    
    public Carrera(){
        
    }
    
    public String getLugar(){
        return lugar;
    }

    public void setLugar(String lugar){
        this.lugar =lugar ;
    }
    
    public Piloto getVecPiloto(int i){
        return vecPiloto[i];
    }

    public void setPiloto(Piloto P,int i){
        vecPiloto[i-1] =P ;
    }
    
    @Override
    public String toString() {
      String aux;
      aux = "Lugar: " + getLugar() + "Pilotos: ";
      for (int i=0;i<10;i++) {
        aux += vecPiloto[i].toString();
      }
      return aux;
    }
    
}
