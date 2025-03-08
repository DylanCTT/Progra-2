public class Balanza {
    private int Monto; 
    private int CantItems;
    
    public int getMonto() {
        return Monto;
    }

    public int getCantItems() {
        return CantItems;
    }
    
    public void setmonto(int unMonto) {
        Monto = unMonto;
    }
    
    public void setCantItems(int unosItems) {
        CantItems = unosItems;
    }
    
    public void iniciarCompra(){
        Monto=0;
        CantItems=0;        
    }
    
    public void registrarProducto(int unPesoEnKg,int unPrecioPorKg) {
      CantItems++;
      Monto+=unPesoEnKg*unPrecioPorKg;
    }
    
    public int devolverMontoAPagar() {
      return Monto;
    }
    
    public String devolverResumenCompra() {
      return ("Total a pagar " + Monto + " por la compra de " + CantItems + " productos");
    }
}
