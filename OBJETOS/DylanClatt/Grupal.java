public class Grupal extends Visita{
    private String lugarSalida;
    private Persona[] grupo;
    private int diml;
    
    public Grupal(int nroVisita,Fecha F,boolean ES, String lugarSalida){
        super(nroVisita,F,ES);
        this.lugarSalida=lugarSalida;
        grupo= new Persona[6];
        diml=0;
    }
    
    public Grupal(){
        
    }
    
    public String getLugarSalida(){
        return lugarSalida;
    }
    
    public void setLugarSalida(String lugarSalida) {
        this.lugarSalida= lugarSalida;
    }
    
    public void agregarIntegrante(Persona P){
        if (diml<6){
          grupo[diml]=P;
          diml++;
        }
    }
    
    public double calcularCostoTotal(){
        int total=0;
        if (diml>4){
          for (int i=0;i<diml;i++){
            if (grupo[i].getEdad()<18)
                total+=2500*0.05;
            else
              total+=8000*0.075;
          }
        }
        else{ 
          for (int i=0;i<diml;i++){
              if (grupo[i].getEdad()<18)
                  total+=2500;
              else
                total+=8000;
          }
        }
        if (!(getES())&&((lugarSalida.equals("Chile"))||(lugarSalida.equals("Paraguay"))||(lugarSalida.equals("Bolivia"))||(lugarSalida.equals("Brasil"))||(lugarSalida.equals("Uruguay")))){
            total-=0.125*total;
        }//Salida del pais
        else if((lugarSalida.equals("Colombia"))||(lugarSalida.equals("Peru"))||(lugarSalida.equals("Ecuador"))||(lugarSalida.equals("Venezuela"))){
            total+=1000*diml;
        }//Entrada al pais
        total+=super.calcularCostoTotal();
        return total;
    }
    
    public String toString(){
        String aux=super.toString();
        aux+= (" Lugar: "+ getLugarSalida());
        for (int i=0;i<diml;i++){
            aux+=(" integrante numero: "+i+ " "+ grupo[i].toString());
        }
        return aux;
    }   
}