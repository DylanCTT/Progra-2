public class Subsidio {
  private double monto;
  private String motivo;
  private boolean otorgado;
  
  public Subsidio (double monto,String motivo) {
    this.monto = monto;
    this.motivo = motivo;
    this.otorgado = false;   
  }
  
  public Subsidio () {
      
  }
  
  public double getMonto() {
    return monto;    
  }
  
  public String getMotivo() {
    return motivo;    
  }
  
  public boolean getOtorgado() {
    return otorgado;    
  }
  
  public void setMonto(double monto) {
    this.monto = monto;    
  }
  
  public void setMotivo(String motivo) {
    this.motivo = motivo;    
  }
  
  public void setOtorgado(boolean otorgado) {
    this.otorgado = otorgado;    
  }
}