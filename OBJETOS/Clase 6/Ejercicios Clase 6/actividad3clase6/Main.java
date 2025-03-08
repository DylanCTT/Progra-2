import java.util.Scanner;
public class Main {
  public static void main(String [] args){
     Surtidor[] vecSurtidor=new Surtidor [3];
     Gasoil Gas1=new Gasoil (1, 40000,46428680, "Peter", "Lanzani");
     Gas1.setPatente("AAA111");
     Gas1.setPatente("BBB222");
     Gas1.setPatente("CCC333");
     vecSurtidor[0]=Gas1;
     Gasoil Gas2=new Gasoil (2, 800000,46266261, "caca", "pis");
     Gas2.setPatente("DDD444");
     Gas2.setPatente("EEE555");
     Gas2.setPatente("FFF666");
     Gas2.setPatente("GGG777");
     Gas2.setPatente("HHH888");
     Gas2.setPatente("III999");
     Gas2.setPatente("JJJ000");
     Gas2.setPatente("KKK111");
     vecSurtidor[1]=Gas2;
     vecSurtidor[2]=new Nafta(3, 1500000, 4623995, "cagada", "pedo", 60);
     for (int i=0;i<3;i++){
       System.out.println("los impuestos a pagar del surtidor " + i + "es: "+vecSurtidor[i].calcularImpuestoAPagar());
       System.out.print(vecSurtidor[i].toString());
     }
  }
}  
