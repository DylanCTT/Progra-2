import java.util.Scanner; 
    public class Main {
      public static void main(String[] args){
      int pesoEnKg,precioPorKg;
      Scanner in = new Scanner(System.in);
      Balanza b = new Balanza();
      System.out.println("Ingrese el peso en kg de un producto: ");
      pesoEnKg = in.nextInt();
      while (pesoEnKg != 0) {
        System.out.println("ingrese el precio por kg: ");
        precioPorKg = in.nextInt();
        b.registrarProducto(pesoEnKg,precioPorKg);
        System.out.println("Ingrese el peso en kg de un producto: ");
        pesoEnKg = in.nextInt();
      }
      in.close();
      System.out.println(b.devolverResumenCompra());
  }
}
