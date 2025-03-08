public class triangulo {
    private double L1; 
    private double L2;
    private double L3;
    private String colorL;
    private String colorR;
    
    public triangulo (double L1,double L2,double L3,String colorL,String colorR){
      this.setL1(L1);
      this.setL2(L2);
      this.setL3(L3);
      this.setcolorL(colorL);
      this.setcolorR(colorR);
    }
    public triangulo (){}
    
    public double getL1() {
        return L1;
    }

    public double getL2() {
        return L2;
    }
    public double getL3() {
        return L3;
    }
    public String getcolorL(){
        return colorL;
    }
    public String getcolorR(){
        return colorR;
    }
    
    public void setL1(double L1) {
        this.L1 = L1;
    }
     public void setL2(double L2) {
        this.L2 = L2;
    }
     public void setL3(double L3) {
        this.L2 = L3;
    }
     public void setcolorL(String colorL) {
        this.colorL = colorL;
    }
     public void setcolorR(String colorR) {
        this.colorR = colorR;
    }

}
