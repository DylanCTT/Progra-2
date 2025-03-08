program ejercicio2;
const
  FIN='zzz';
  inf=40000000;
  sup=50000000;
type
  venta=record
    vuelo:string;
    millas:integer;
    dni:integer;
    nombreapellido:string;
    clase:integer;
  end;
  arbol=^nodo;
  nodo=record
    dato:venta;
    HI:arbol;
    HD:arbol;
  end;
function sumarmillas(c:integer;m:integer):integer;
begin
  if (c=1)then
    sumarmillas:=m*100
  else
    sumarmillas:=m*25;
end;

procedure InsertarABO (var A:arbol;dato:venta);
begin
  if (A=nil) then begin
    new(A);
    A^.dato:=dato;
    a^.dato.millas:=sumarmillas(dato.clase,dato.millas);
    A^.HI:=nil;
    A^.HD:=nil;
  end
  else
    if (A^.dato.dni>dato.dni)then
      InsertarABO(A^.HI,dato)
    else
      if (A^.dato.dni<dato.dni) then
        InsertarABO(A^.HD,dato)
    else
      a^.dato.millas:=A^.dato.millas+sumarmillas(dato.clase,dato.millas);
end;

procedure CargarArbol(var A:arbol);
var
  dato:venta;
begin
  writeln('ingrese el codigo de vuelo: ');
  readln(dato.vuelo);
  if (dato.vuelo<>FIN) then begin
    writeln('ingrese su dni: ');
    readln(dato.dni);
    writeln('ingrese su nombre y apellido: ');
    readln(dato.nombreapellido);
    writeln('ingrese 1 si viajo en clase ejecutiva o 2 si viajo en clase turista: ');
    readln(dato.clase);
    writeln('ingrese la cantidad de millas recorridas: ');
    readln(dato.millas);
    InsertarABO(A,dato);
    CargarArbol(A);
  end;

end;



procedure recorrerarbol (A:arbol;var max:integer;var dniMAX:integer);
begin
  if (a<>nil)then begin
    recorrerarbol(A^.HI,max,dniMAX);
    if (a^.dato.millas>max)then begin
      dniMAX:=A^.dato.dni;
      max:=a^.dato.millas;
    end;
    recorrerarbol(A^.HD,max,dniMAX);
  end;
end;

procedure cantInf(a:arbol;var max:integer;var dniMAX:integer);
begin
  if (a<>nil) then begin
    if (a^.dato.dni>=inf) then begin
      if (a^.dato.dni<=sup) then begin
        recorrerarbol(A,max,dniMAX);
        cantInf(a^.HI,max,dniMAX);
        cantInf(a^.HD,max,dniMAX);
      end
      else cantInf(a^.HI,max,dniMAX);
    end
    else cantInf(a^.HD,max,dniMAX);
  end;
end;


var
  A:arbol;
  max:integer;
  dniMAX:integer;
begin
  A:=nil;
  max:=-1;
  cargararbol(a);
  recorrerarbol(A,max,dniMAX);
  writeln('el cliente con mayor millas es: ',dniMAX, ' con ', max);
  max:=-1;
  cantInf(A,max,dniMAX);
  writeln('el cliente con mayor millas entre los dni 40000000 y 50000000 es: ',dniMAX, ' con ', max);
  readln;

end.

