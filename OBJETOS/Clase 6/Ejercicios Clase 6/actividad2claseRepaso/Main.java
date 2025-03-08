import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    String pat;  
    Estacionamiento E33= new Estacionamiento("manolo",363,900,2100,3,3);
    Auto A1=new Auto("blas","aaa333");
    Auto A2=new Auto("gaga","spa033");
    Auto A3=new Auto("maxitru","pap694");
    Auto A4=new Auto("lu","aos100");
    Auto A5=new Auto("viejo","ano335");
    Auto A6=new Auto("yo","mas243");
    E33.agregarAuto(A1,0,1);
    E33.agregarAuto(A2,1,2);
    E33.agregarAuto(A3,2,0);
    E33.agregarAuto(A4,0,0);
    E33.agregarAuto(A5,1,0);
    E33.agregarAuto(A6,2,2);
    
    System.out.println(E33.toString());
    
    System.out.println("la cantidad de autos en la plaza 1 es: "+ E33.enPlaza(1));
    
    System.out.println("ingrese una patente para verificar: ");
    pat=in.nextLine();
    System.out.print(E33.encontrarNM(pat));
    in.close();
  }
}