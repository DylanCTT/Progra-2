import java.util.Scanner;
public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    Proyecto p = new Proyecto("proy1",3321,"pepe");
    
    Investigador inv1 = new Investigador("pepo",2,"lala");
    p.agregarInvestigador(inv1);
    Investigador inv2 = new Investigador("manolo",1,"jiji");
    p.agregarInvestigador(inv2);
    Investigador inv3 = new Investigador("manola",3,"jojo");
    p.agregarInvestigador(inv3);
    
    Subsidio sub1 = new Subsidio(3000,"jeje");
    Subsidio sub2 = new Subsidio(7000,"jojo");
    Subsidio sub3 = new Subsidio(7000,"jojo");
    Subsidio sub4 = new Subsidio(7000,"jojo");
    Subsidio sub5 = new Subsidio(7000,"jojo");
    Subsidio sub6 = new Subsidio(7000,"jojo");
    inv1.agregarSubsidio(sub1);
    inv1.agregarSubsidio(sub2);
    inv2.agregarSubsidio(sub3);
    inv2.agregarSubsidio(sub4);
    inv3.agregarSubsidio(sub5);
    inv3.agregarSubsidio(sub6);
    
    p.otorgarTodos("manolo");
    
    System.out.print(inv1.chequeo());
    
    System.out.println(p.toString());
    
    in.close();
  }
}