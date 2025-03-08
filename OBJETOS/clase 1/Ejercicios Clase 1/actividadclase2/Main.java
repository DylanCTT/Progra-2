import java.util.Scanner; 
public class Main {
    public static int Mayores(Persona[] VP){
    int Cont =0;
    for (int i=0;i<2;i++){
      if(VP[i].getEdad()>65)
        Cont++;  
    }
    return Cont;
} 
    public static Persona Min (Persona[] VP){
      int min=99999;
      Persona Mper= VP[0];
      for (int i=0;i<2;i++){
        if(VP[i].getDNI()<min){
          min=VP[i].getDNI();
          Mper=VP[i];
        }
        
    }
return Mper;  
}


    
  public static void main(String[] args){

      String Nombre;
      int DNI;
      int edad;
      Persona [] VP = new Persona[2];
      Scanner in =new Scanner(System.in);
      for (int i=0;i<2;i++) {
        Persona P=new Persona();
        System.out.println("ingrese el nombre");
        Nombre=in.nextLine();
        System.out.println("ingrese el DNI");
        DNI=in.nextInt();
        System.out.println("ingrese la edad");
        edad=in.nextInt();
        in.nextLine();
        P.setNombre(Nombre);
        P.setDNI(DNI);
        P.setEdad(edad);
        VP[i]=P;
      }
      System.out.println(Mayores(VP));
      System.out.println(Min(VP));

      in.close();

}
}

