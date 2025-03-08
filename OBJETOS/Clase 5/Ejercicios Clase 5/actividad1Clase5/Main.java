import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
  
    System.out.println("Se ingresan datos de un jugador: ");
    System.out.println("Ingrese el nombre: ");
    String nombre = in.nextLine();
    System.out.println("DNI: ");
    int dni = in.nextInt();
    System.out.println("Sueldo: ");
    double sueldo = in.nextDouble();
    System.out.println("Goles: ");
    int goles = in.nextInt();
    System.out.println("Partidos: ");
    int part = in.nextInt();
  
    Empleado emp1 = new Jugador(nombre,dni,sueldo,part,goles);
  
    System.out.println("Se ingresan datos de un entrenador: ");
    System.out.println("Ingrese el nombre: ");
    nombre = in.nextLine();
    System.out.println("DNI: ");
    dni = in.nextInt();
    System.out.println("Sueldo: ");
    sueldo = in.nextDouble();
    System.out.println("Cantdad de campeonatos ganados: ");
    int camp = in.nextInt();
    emp1.toString();
    
  
  
  }
}