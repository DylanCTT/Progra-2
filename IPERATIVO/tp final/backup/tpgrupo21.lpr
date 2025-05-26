Program tpgrupo21;
Uses
     sysutils;
const
  inf=28000000;
  sup=32000000;
  dni=34807474;
Type
     str70= string[70];

	 jugador = record
           DNI: longint;
	   nombre_apellido: str70;
           seleccion: str70;
           goles: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
	    dato: jugador;
	    sig: lista;
     end;

	fecha=record
		dia:1..31;
		mes:1..12;
		anio:integer;
	end;

    partido= record
		codigo: longint;
		seleccion_l: str70;
		seleccion_2: str70;
		fecha_partido: fecha;
                estadio: str70;
		goleadores: lista;
     end;

     listaPartidos = ^nodoPartidos;
     nodoPartidos = record
            dato: partido;
            sig: listaPartidos;
     end;

     nombres= array [1..20] of str70;

     datop=record
       f:fecha;
       estadio:str70;
       goles:integer;
     end;

     listap=^nodop;
     nodop=record
       dato:datop;
       sig:listap;
     end;

     datoA=record
       DNI:longint;
       nombreapellido:str70;
       seleccion:str70;
       totgoles:integer;
       partidos:listap;
     end;

     arbol=^nodoA;
     nodoA=record
       dato:datoA;
       HI:arbol;
       HD:arbol;
     end;

     {Completar con los tipos de datos necesarios}

procedure cargarFecha(var f: fecha);
begin
  f.dia:= random(30)+1;
  f.mes := random(1)+6;
  if((f.mes = 6) and (f.dia = 31))then
            f.dia := 30;
  f.anio:=2024;
end;

Procedure agregar(var l: listaPartidos; p: partido);
var
   aux: listaPartidos;
begin
     new(aux);
     aux^.dato := p;
     aux^.sig := l;
     l:= aux;
end;

Procedure agregarJugador(var l: lista; j: jugador);
var
   aux: lista;
begin
     new(aux);
     aux^.dato := j;
     aux^.sig := l;
     l:= aux;
end;

procedure cargarEquipos(var v:nombres );
begin
     v[1]:='Argentina';
     v[2]:='Brasil';
     v[3]:='Colombia';
     v[4]:='Canada';
     v[5]:='Ecuador';
     v[6]:='Peru';
     v[7]:='Chile';
     v[8]:='Bolivia';
     v[9]:='Venezuela';
     v[10]:='Mexico';
     v[11]:='Costa Rica';
     v[12]:='Estados Unidos';
     v[13]:='Jamaica';
     v[14]:='Panama';
     v[15]:='Paraguay';
     v[16]:='Uruguay';
end;

procedure cargarJugadores(var l: lista; local, visitante:str70);
var
   j: jugador;
   cant, i, pos, loc_vis: integer;
   v: nombres;
begin
     cant := random(3);
     v[1]:='Lionel Perez';
     v[2]:='Martin Fernandez';
     v[3]:='Mariano Gomez';
     v[4]:='Alejandro Gonzalez';
     v[5]:='Fermin Martinez';
     v[6]:='Nicolas Castro';
     v[7]:='Gonzalo Villareal';
     v[8]:='Tadeo Parodi';
     v[9]:='Juan Pablo Silvestre';
     v[10]:='Mariano Sanchez';
     v[11]:='Alejo Monden';
     v[12]:='Agustin Paz';
     v[13]:='Juan Salto';
     v[14]:='Matias Pidone';
     v[15]:='Luis Hernandez';
     v[16]:='Cristian Herrera';
     v[17]:='Santiago Manzur';
     v[18]:='Julian Darino';
     v[19]:='Victor Abila';
     v[20]:='Luciano Segura';
     if((local='Argentina')or(visitante='Argentina'))then
     begin
        with(j) do begin
           DNI := 34807474;
           nombre_apellido:='Leandro Romanut';
		   seleccion:='Argentina';
		   goles:=random(3)+1;
        end;
        agregarJugador(l, j);
     end;
     for i:=1 to cant do
     begin
       with(j) do begin
          DNI := random(18000000)+20000000;
          pos:= random(20)+1;
          nombre_apellido:= v[pos];
          loc_vis:= random(2)+1;
          if(loc_vis=1)then
            seleccion:=local
          else
            seleccion:=visitante;
	      goles:=random(3)+1;
       end;
       agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant,i,pos,loc,vis: integer;
   v, v2: nombres;
begin
     cant := random(30)+1;
     v[1]:= 'Mercedes-Benz Stadium';
     v[2]:= 'Levi`s Stadium';
     v[3]:= 'Bank of America Stadium';
     v[4]:= 'State Farm Stadium';
     v[5]:= 'SoFi Stadium';
     v[6]:= 'Inter&Co Stadium';
     v[7]:= 'NRG Stadium';
     v[8]:= 'Q2 Stadium';
     v[9]:= 'AT&T Stadium';
     v[10]:= 'MetLife Stadium';
     v[11]:= 'Allegiant Stadium';
     v[12]:= 'Arrowhead Stadium';
     v[13]:= 'Children`s Mercy Park';
     v[14]:= 'Hard Rock Stadium';
     cargarEquipos(v2);
     for i:=1 to cant do
     begin
          with(p) do begin
               codigo:= random (100000)+1;
               pos:= random(14)+1;
               estadio:= v[pos];
               loc:= random(16)+1;
               seleccion_l:=v2[loc];
               vis:= random(16)+1;
               seleccion_2:=v2[vis];
               while(seleccion_l=seleccion_2)do
               begin
                   vis:= random(16)+1;
                   seleccion_2:=v2[vis];
               end;
               cargarFecha(fecha_partido);
               goleadores:= nil;
               cargarJugadores(goleadores, seleccion_l, seleccion_2);
          end;
          agregar(l, p);
       end;
end;


procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('JUGADOR: ', nombre_apellido, ' | DNI: ',DNI, ' | SELECCION: ', seleccion, ' | GOLES: ', goles);
     end;
end;

procedure imprimirJugadores(l: lista);
begin
     while (l <> nil) do begin
          imprimirJugador(l^.dato);
          l:= l^.sig;
     end;
end;

procedure imprimir(p: partido);
begin
     with (p) do begin
          writeln('');
          writeln('PARTIDO: ', codigo, ' | SELECCION 1: ',seleccion_l, ' | SELECCION 2: ', seleccion_2, ' | FECHA: ', fecha_partido.dia,'/',fecha_partido.mes,'/',fecha_partido.anio, ' | ESTADIO: ', estadio);
          imprimirJugadores(goleadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure insertarlistapartidos(var p:listap;par:partido;jug:jugador);
var
  nue:listap;
begin
  new(nue);
  nue^.dato.f:=par.fecha_partido;
  nue^.dato.estadio:=par.estadio;
  nue^.dato.goles:=jug.goles;
  nue^.sig:=p;
  p:=nue;
end;

procedure valores (var A:arbol;p:partido;j:jugador);

begin
  A^.dato.DNI:=j.dni;
  A^.dato.nombreapellido:=j.nombre_apellido;
  A^.dato.seleccion:=p.seleccion;
  A^.dato.totgoles:=j.goles;
  A^.dato.partidos:=nil;
  insertarlistapartidos(A^.dato.partidos,p,j);
  A^.HI:=nil;
  A^.HD:=nil;
end;

procedure InsertarABO (var A:arbol;p:partido;j:jugador);
begin
  if (A=nil) then begin
    new(A);
    valores(A,p,j);
  end
  else begin
    if (A^.dato.DNI>j.dni)then
      InsertarABO(A^.HI,p,j)
    else
      if (A^.dato.DNI<j.dni) then
        InsertarABO(A^.HD,p,j)
    else begin
      A^.dato.totgoles:=A^.dato.totgoles+j.goles;
      insertarlistapartidos(A^.dato.partidos,p,j);
    end;
  end;
end;

procedure recorrerycargar (var A:arbol;l:listaPartidos);
 var
  aux:lista;
 begin
 while (l<>nil) do begin
   aux:=l^.dato.goleadores;
   while (aux<>nil) do begin
     InsertarABO(A,l^.dato,aux^.dato); {revisar esto}
     aux:=aux^.sig;
     end;
   l:=l^.sig;
 end;
 end;


procedure BusquedaAcotadaDNI(a:arbol);
begin
  if (a<>nil) then begin
    if (a^.dato.dni>=inf) then begin
      if (a^.dato.dni<=sup) then begin
        BusquedaAcotadaDNI(a^.HD);
        writeln('DNI: ', a^.dato.dni);
        writeln('nombre y apellido: ', a^.dato.nombreapellido);
        writeln('cantidad de goles totales: ', a^.dato.totgoles);
        BusquedaAcotadaDNI(a^.HI);

      end
      else BusquedaAcotadaDNI(a^.HI);
    end
    else BusquedaAcotadaDNI(a^.HD);
  end;
end;

function verEstadio (dato:str70 ):boolean;
begin
  verEstadio:=False;
  verEstadio:=dato='MetLife Stadium';
  verEstadio:=dato='Inter&Co Stadium';
  verEstadio:=dato='Bank of America Stadium';
end;
procedure BusquedaAcotadaFECHA(a:arbol;infF,supF:fecha);
var
 l:listap;
begin
  if (a<>nil) then begin
    l:=a^.dato.partidos;
    {recorrerlista}
      while (l<>nil) do begin {modularizar}
        if (l^.dato.f.mes>=infF.mes) then begin
          if (l^.dato.f.mes<=supF.mes) then begin
            if (l^.dato.f.dia>=infF.dia) then begin
              if (verEstadio(l^.dato.estadio)) then
                writeln('la seleccion que convirtio fue: ', A^.dato.seleccion1, 'o: ', A^.dato.seleccion2 );
            end;
          end;
        end;
        l:=l^.sig;
      end;
      BusquedaAcotadaFECHA(a^.HI,infF,supF);
      BusquedaAcotadaFECHA(a^.HD,infF,supF);
  end;
end;

procedure BorrarLista(var l:listap);
var
 aux:listap;
begin
  while (l<>nil)do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
  end;

end;

procedure remplazar(var bor:arbol;aux:arbol);
begin
  bor^.dato.DNI:=aux^.dato.dni;
  bor^.dato.nombreapellido:=aux^.dato.nombreapellido;
  bor^.dato.seleccion:=aux^.dato.seleccion;
  bor^.dato.totgoles:=aux^.dato.totgoles;
  borrarLista(bor^.dato.partidos);
  bor^.dato.partidos:=aux^.dato.partidos;
end;


procedure verMinpuntero (A:arbol;var aux:arbol;min:longint);
begin

  if (a<>nil) then begin
    verminpuntero(a^.HI,aux,min);
    if (A^.dato.DNI< min) then
      aux:=a;
    verminpuntero(a^.HD,aux,min);
  end;
end;

function verMin (A:arbol;min:longint):longint;
begin
   if (a<>nil) then begin
    if(A^.HI<>nil)then
      min:=verMin(A^.HI,min)
    else
      min:=A^.dato.dni;
    end;
    verMin:=min;

end;

procedure BorrarElemento (var A:arbol;var encontre:boolean);
var
 minSUB:longint;
  aux,bor:arbol;

begin
  if (A=nil)then
    encontre:=false
  else
    if (A^.dato.dni>dni) then
      BorrarElemento(A^.HI,encontre)
    else
      if (A^.dato.dni<dni) then
        BorrarElemento(A^.HD,encontre)
      else begin
        encontre:=true;
        bor:=A;

      if (A^.HI=nil) and (A^.HD=nil)then begin
        dispose(A);
        A:=nil;
      end
      else
        if (A^.HI<>nil) and (A^.HD=nil) then begin
          aux:=A;
          A:=A^.HI;
          borrarLista(a^.dato.partidos);
          dispose(aux);
        end
          else
            if (A^.HD<>nil) and (A^.HI=nil) then begin
              aux:=A;
              A:=A^.HD;
              borrarLista(a^.dato.partidos);
              dispose(aux);
            end
              else
                if (A^.HD<>nil) and (A^.HI<>nil) then begin
                  minSUB:=999999999;
                  minsub:=vermin(a,minSUB);
                  verminPuntero(a,aux,minsub);
                  remplazar(bor,aux);

                  BorrarElemento(aux,encontre);
                  {A:= min(A^.HD);      le paso el puntero
                  borrarelemento(a^.HD,dni)    llamo con el dato que no quiero}

                end;
end;
end;


procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datoA);

    procedure imprimirListaCodigos(l:listap);
    begin
      if (l<>nil) then begin
        writeln(l^.dato.f.dia, ' ',l^.dato.f.mes, ' ', l^.dato.f.anio, ' ', l^.dato.estadio, ' ', l^.dato.goles, ' ');
        imprimirListaCodigos(l^.sig);
      end;
    end;

  begin
    writeln('DNI: ',datos.dni);
    writeln('nombre y apellido: ', datos.nombreapellido);
    writeln('seleccion: ', datos.seleccion);
    write('goles: ', datos.totgoles);
    imprimirListaCodigos(a^.dato.partidos);
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.dato);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;

procedure inicializarVAR(var infF,supF:fecha);
begin
     infF.dia:=15;
     infF.mes:=6;
     supF.dia:=15;
     supF.mes:=7;
end;


var
   l: listaPartidos;
   A:arbol;
   infF,supF:fecha;
   encontre:boolean;
begin
     Randomize;

     l:= nil;
     crearLista(l); {carga automatica de la estructura disponible}
     writeln ('LISTA GENERADA: ');
     imprimirLista(l);
     A:=nil;
     recorrerycargar(a,l);
     BusquedaAcotadaDNI(a);
     inicializarVAR(infF,supF);
     BusquedaAcotadaFECHA(a,infF,supF);
     imprimirArbol(a);
     BorrarElemento(A,encontre);
     if (not encontre) then
       writeln ('No se encontro el dni numero 34807474');
     imprimirarbol(A);


     writeln('Fin del programa');
     readln;
end.
