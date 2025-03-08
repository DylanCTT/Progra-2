import java.util.Scanner; 
public class Triangulo {
  public static void main(String[] args){
      Scanner in =new Scanner(System.in);
      System.out.println("ingrese el valor A");
      double A=in.nextDouble();
      System.out.println("ingrese el valor B");
      double B=in.nextDouble();
      System.out.println("ingrese el valor C");
      double C=in.nextDouble();
      double per=0;
      if ((A<(B+C))&&(B<(A+C))&&(C<(A+B)))
        per=A+B+C;
      System.out.println(per);
    }
    
}