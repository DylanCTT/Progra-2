public class Estacionamiento{
    private String nombre;
    private int direccion;
    private double horaApertura;
    private double horaCierre;
    private int N,M;
    private int cantAuto;
    private Auto[][] matLugar;
    
    public Estacionamiento(String nombre,int direccion,double horaApertura,double horaCierre, int N, int M){
        this.nombre=nombre;
        this.direccion=direccion;
        this.horaApertura=horaApertura;
        this.horaCierre=horaCierre;
        this.N=N;
        this.M=M;
        matLugar=new Auto[N][M];
        cantAuto=0;
    }
    
    public Estacionamiento(String Nombre,int direccion,int N,int M){
        this.setNombre(nombre);
        this.setDireccion(direccion);
        this.setHoraApertura(800);
        this.setHoraCierre(2100);
        this.setN(5);
        this.setM(10);
        matLugar=new Auto[5][10];
        cantAuto=0;
    }
    
    public Estacionamiento(){
        
    }
    
    public String getNombre() {
    return nombre;
    }
    
    public void setNombre(String nombre) {
    this.nombre = nombre;
    }
    
    public int getDireccion() {
       return direccion;
    }
    
    public void setDireccion(int direccion) {
    this.direccion = direccion;
    }
    
    public double getHoraApertura() {
    return horaApertura; 
    }
    
    public void setHoraApertura(double horaApertura) {
    this.horaApertura = horaApertura;
    }
    
    public double getHoraCierre() {
    return horaCierre;
    }
    
    public void setHoraCierre(double horaCierre) {
    this.horaCierre = horaCierre;
    }
    
    public int getCantAuto(){
        return cantAuto;
    }
    
    public void setCantAuto(int cantAuto){
        this.cantAuto=cantAuto;
    }
    
    public int getN() {
    return N;
    }
    
    public void setN(int n) {
    N = n;
    }
    
    public int getM() {
    return M;
    }
    
    public void setM(int m) {
    M = m;
    }
    
    public void agregarAuto(Auto A,int posN,int posM){
        matLugar[posN][posM]=A;
    }
    
    public String encontrarNM(String patente){
        String aux=("Auto inexistente");
        for(int i=0;i<getN();i++){
            for (int j=0;j<getM();j++){
                if (matLugar[i][j]!=null){
                    if (matLugar[i][j].getPatente().equals(patente))
                      aux= ("el numero de piso es: "+ i +" y el numero de plaza es: "+ j);
                }
            }
        }
        return aux;
    }
    
    public String toString(){
        String aux=(" ");
        for(int i=0;i<getN();i++){
            for (int j=0;j<getM();j++){
              aux+= ("piso "+ i+" plaza "+ j);
              if (matLugar[i][j]==null)
                aux+=(" libre");
              else
                aux+=matLugar[i][j].toString();
            }
        }
        return aux;
    }
    
    public int enPlaza(int Y){
        int cont=0;
        for(int i=0;i<getN();i++){
          if (!(matLugar[i][Y]==null))
            cont++;  
        }
        return cont;    
    }
}
