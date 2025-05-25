Program ejercicio1;
Uses
     sysutils;
Type
     str10= string[10];
     jugador = record
              dni: longint;
	          nombreApellido: string;
	          posicion: str10;
              puntaje: integer;
     end;

     lista = ^nodoLista;
     nodoLista = record
               dato: jugador;
               sig: lista;
     end;

     partido= record
               estadio: string;
               equipoLocal: string;
               equipoVisitante: string;
               fecha: str10;
               jugadores: lista;
     end;

     p=record
       num:integer;
       fecha:str10;
     end;

     Puntajes=^nodopun;
     nodopun=record
       dato:p;
       sig:puntajes;
     end;

     datoARBOL=record
       DNI:longint;
       nombreApellido: string;
       posicion: str10;
       PUN:puntajes;
     end;
     listaPartidos = ^nodoPartido;
     nodoPartido = record
               dato: partido;
               sig: listaPartidos;
     end;
     arbol=^nodo;
     nodo=record
       dato:datoARBOL;
       HI:arbol;
       HD:arbol;
     end;

procedure cargarFecha(var s: str10);
var
  dia, mes: integer;
begin
  dia := random(30)+1;
  mes := random(12)+1;
  if(mes = 2) and (dia > 28)then
	dia := 31;
  if((mes = 4) or (mes = 6) or (mes =9) or (mes = 11)) and (dia = 31)then
	dia := 30;
  s := Concat('2022/',IntToStr(mes),'/',IntToStr(dia));
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

procedure cargarJugadores(var l: lista);
var
   j: jugador;
   cant, i, pos: integer;
begin
     cant := random(10)+22;
     for i:=1 to cant do
     begin
          with(j) do begin
              dni := random(36000000)+20000000;
	      nombreApellido:= Concat('Jugador-', IntToStr(dni));
	      pos:= random(4)+1;
              case pos of
                1: posicion:= 'arquero';
                2: posicion:= 'defensa';
                3: posicion:= 'mediocampo';
                4: posicion:= 'delantero';
              end;
              puntaje:= random(10)+1;
          end;
          agregarJugador(l, j);
     end;
end;

procedure crearLista(var l: listaPartidos);
var
   p: partido;
   cant, i: integer;
begin
     cant := random(10);
     for i:=1 to cant do
     begin
          with(p) do begin
               estadio:= Concat('Estadio-', IntToStr(random (500)+1));
               equipoLocal:= Concat('Equipo-', IntToStr(random (200)+1));
               equipoVisitante:= Concat('Equipo-', IntToStr(random (200)+1));
               cargarFecha(fecha);
               jugadores:= nil;
               cargarJugadores(jugadores);
          end;
          agregar(l, p);
     end;
end;



procedure imprimirJugador(j: jugador);
begin
     with (j) do begin
          writeln('Jugador: ', nombreApellido, ' con dni ',dni, ' en posicion: ', posicion, ' y puntaje: ', puntaje);
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
          writeln('Partido en el ', estadio, ' entre ',equipoLocal, ' y ', equipoVisitante, ' jugado el: ', fecha, ' por los siguientes jugadores: ');
          imprimirJugadores(jugadores);
     end;
end;

procedure imprimirLista(l: listaPartidos);
begin
     while (l <> nil) do begin
          imprimir(l^.dato);
          l:= l^.sig;
     end;
end;

procedure DNIrep(var p:puntajes;par:partido;dato:jugador);
var
  nue:puntajes;
begin
  new(nue);
  nue^.dato.num:=dato.puntaje;
  nue^.dato.fecha:=par.fecha;
  nue^.sig:=p;
  p:=nue;
end;
procedure valores (var A:arbol;p:partido;j:jugador);

begin
  A^.dato.DNI:=j.dni;
  A^.dato.nombreapellido:=j.nombreapellido;
  A^.dato.posicion:=j.posicion;
  A^.dato.PUN:=nil;
  DNIrep(A^.dato.PUN,p,j);
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
    else
      DNIrep(A^.dato.PUN,p,j);
  end;
end;

  procedure recorrerycargar (var A:arbol;l:listaPartidos);
  var
   aux:lista;
  begin
  while (l<>nil) do begin
    aux:=l^.dato.jugadores;
    while (aux<>nil) do begin
      InsertarABO(A,l^.dato,aux^.dato);
      aux:=aux^.sig;
      end;
    l:=l^.sig;
  end;
  end;

procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datoARBOL);

    procedure imprimirListaCodigos(l:puntajes);
    begin
      if (l<>nil) then begin
        write(l^.dato.num,' ', l^.dato.fecha, ' ');
        imprimirListaCodigos(l^.sig);
      end;
    end;

  begin
    writeln('DNI: ',datos.dni);
    write('puntaje(s): ');
    imprimirListaCodigos(a^.dato.pun);
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.dato);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;
function contador (sum:integer;p:puntajes);

begin
  if (p=nil) then
    contador:=0;
  if (p<>nil) then begin
    sum:=sum+p^.dato.num;
    contador:=contador(p^.sig);
  end;
  contador:=sum;
end;

procedure enOrden(A:arbol);
begin
  if (a<>nil) then begin
    enOrden(a^.HD);
    contardor(A^.dato.PUN)
    enOrden(a^.HI);
  end;
end;

var
   l: listaPartidos;
   A:arbol;
begin
     Randomize;
     A:=nil;
     l:= nil;
     crearLista(l); {carga automÃ¡tica de la estructura disponible}
     writeln ('Lista generada: ');
     imprimirLista(l);
     recorrerycargar(A,l);

     imprimirarbol(A);
     writeln('Fin del programa');
     readln;
end.
