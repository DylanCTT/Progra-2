import java.util.Scanner;
public class Main{
    public static int ganoRiver (Partido[] VP){
      int Cont=0;
      for(int i=0;i<2;i++){
          if(VP[i].getGanador().equals("River")) Cont++;
          
      }
      return Cont;
    }
    
    public static int golesBoca (Partido [] VP) {
      int Cont=0;
      for(int i=0;i<2;i++){
          if(VP[i].getLocal().equals("Boca")) Cont+=VP[i].getGolesLocal(); 
          
      }  
      return Cont;
    }
    
    public static double empates (Partido [] VP) {
        int cont=0;
        double por=0;
      for(int i=0;i<2;i++){
          if(VP[i].hayEmpate()) cont++; 
          
      }  
      por=(cont*100)/2;
      return por;
    }
      
public static void main(String[] args){
  String local,visitante;
  int golesL,golesV;
  Partido [] VP= new Partido [2];
  Scanner in =new Scanner(System.in);
  for (int i=0;i<2;i++){
    Partido P=new Partido();
        System.out.println("ingrese el nombre del equipo local");
        local=in.nextLine();
        System.out.println("ingrese el nombre del equipo visitante");
        visitante=in.nextLine();
        System.out.println("ingrese la cantidad de goles del equipo local");
        golesL=in.nextInt();
        System.out.println("ingrese la cantidad de goles del equipo visitante");
        golesV=in.nextInt();
        in.nextLine();
        P.setLocal(local);
        P.setVisitante(visitante);
        P.setGolesLocal(golesL);
        P.setGolesVisitante(golesV);
        VP[i]=P;
      
  }   
  System.out.println(ganoRiver(VP));
  System.out.println(golesBoca(VP));
  System.out.println(empates(VP));
}
}