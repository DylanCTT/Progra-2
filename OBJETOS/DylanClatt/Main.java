public class Main{
    public static void main(String[] args){
        Visita[] pasoFronterizo=new Visita[10];
        int porcentaje=0;
        
        Fecha F1=new Fecha(11,10,24);
        Fecha F2=new Fecha(3,10,24);
        Fecha F3=new Fecha(18,11,24);
        
        Persona P1=new Persona(18,"dni",46428680);
        Persona P2=new Persona(45,"pasaporte",54293);
        Persona P3=new Persona(54,"dni",46428680);
        Persona P4=new Persona(9,"dni",46428680);
        Persona P5=new Persona(12,"dni",46428680);
        Persona P6=new Persona(90,"dni",46428680);
        
        Personal V1=new Personal(1,F2,true,true);
        pasoFronterizo[0]=V1;
        Grupal V2=new Grupal(2,F1,true, "Colombia");
        V2.agregarIntegrante(P1);
        V2.agregarIntegrante(P2);
        V2.agregarIntegrante(P4);
        pasoFronterizo[1]=V2;
        Grupal V3=new Grupal(3,F3,false, "Chile");
        V3.agregarIntegrante(P4);
        V3.agregarIntegrante(P1);
        V3.agregarIntegrante(P2);
        V3.agregarIntegrante(P6);
        V3.agregarIntegrante(P5);
        pasoFronterizo[2]=V3;
        Personal V4=new Personal(4,F2,false,false);
        pasoFronterizo[3]=V4;
        Grupal V5=new Grupal(5,F2,true, "Argentina");
        V5.agregarIntegrante(P6);
        V5.agregarIntegrante(P4);
        pasoFronterizo[4]=V5;
        Personal V6=new Personal(6,F3,true,false);
        pasoFronterizo[5]=V6;
        Personal V7=new Personal(7,F2,false,true);
        pasoFronterizo[6]=V7;
        Grupal V8=new Grupal(8,F3,false, "Argentina");
        V8.agregarIntegrante(P4);
        V8.agregarIntegrante(P5);
        V8.agregarIntegrante(P6);
        pasoFronterizo[7]=V8;
        Grupal V9=new Grupal(9,F1,true, "Paraguay");
        V9.agregarIntegrante(P1);
        V9.agregarIntegrante(P2);
        pasoFronterizo[8]=V9;
        Grupal V10=new Grupal(10,F2,false, "Peru");
        V10.agregarIntegrante(P3);
        V10.agregarIntegrante(P5);
        V10.agregarIntegrante(P6);
        pasoFronterizo[9]=V10;
        for (int i=0;i<10;i++){
            System.out.println(pasoFronterizo[i].toString());
            System.out.println(pasoFronterizo[i].calcularCostoTotal());
            if (pasoFronterizo[i].calcularCostoTotal()>20000)
              porcentaje++;
        }
        System.out.println("el porcentaje de visitas que superaron los 20000 pesos fue: "+ (porcentaje*10)+"%");
    }
}