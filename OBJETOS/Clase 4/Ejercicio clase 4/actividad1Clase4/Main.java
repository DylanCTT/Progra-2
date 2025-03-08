import java.util.Scanner;
public class Main {
  public static void main(String[] args){
     
     Scanner in=new Scanner (System.in);
     System.out.println("ingrese el lado 1");
     double L1 = in.nextDouble();
     System.out.println("ingrese el lado 2");
     double L2 = in.nextDouble();
     System.out.println("ingrese el lado 3");
     double L3 = in.nextDouble();
     in.nextLine();
     System.out.println("ingrese el color de los lados");
     String CL = in.nextLine();
     in.nextLine();
     System.out.println("ingrese el color del relleno");
     String CR = in.nextLine();
     triangulo T=new triangulo (L1,L2,L3,CL,CR);
    }
}