program actividadcolaborativa;
const
  FIN=0000;
type
  venta=record
    codigo:integer;
    kilos:integer;
  end;
  Arbol=^nodo;
  nodo=record
    dato:venta;
    HI:arbol;
    HD:arbol;
  end;
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;
procedure inicializarVar (var A:arbol;var min:integer);
begin
  A:=nil;
  min:=999999;
end;
{procedure InsertarABO (var A:arbol;dato:venta);
begin
  if (A=nil) then begin
    new(A);
    A^.dato:=dato;
    A^.HI:=nil;
    A^.HD:=nil;
  end
  else
    if (A^.dato.codigo>dato.codigo)then
      InsertarABO(A^.HI,dato)
    else
      if (A^.dato.codigo<dato.codigo) then
        InsertarABO(A^.HD,dato)
    else
      A^.dato.kilos:=A^.dato.kilos+dato.kilos;
end;

procedure CargarArbol(var A:arbol);
var
  dato:venta;
begin
  writeln('ingrese el codigo de pasta: ');
  readln(dato.codigo);
  if (dato.codigo<>FIN) then begin
    writeln('ingrese la cantidad de kilos vendida: ');
    readln(dato.kilos);
    InsertarABO(A,dato);
    CargarArbol(A);
  end;

end;}

function ContarElementos (l: listaNivel): integer;
  var c: integer;
begin
 c:= 0;
 While (l <> nil) do begin
   c:= c+1;
   l:= l^.sig;
 End;
 contarElementos := c;
end;

Procedure AgregarAtras (var l, ult: listaNivel; a:arbol);
 var nue:listaNivel;

 begin
 new (nue);
 nue^.info := a;
 nue^.sig := nil;
 if l= nil then l:= nue
           else ult^.sig:= nue;
 ult:= nue;
 end;

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, caant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    caant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to caant do begin
                      write (l^.info^.dato.codigo,' ',l^.info^.dato.kilos,  ' - ');

                      if (l^.info^.HI <> nil) then agregarAtras (l,ult,l^.info^.HI);
                      if (l^.info^.HD <> nil) then agregarAtras (l,ult,l^.info^.HD);
                      aux:= l;
                      l:= l^.sig;
                      dispose (aux);
                     end;
                     writeln;
                 end;
               end;
end;
function verMin (A:arbol;min:integer):integer;
begin
   if (a<>nil) then begin
    if(A^.HI<>nil)then
      min:=verMin(A^.HI,min)
    else
      min:=A^.dato.codigo;
    end;
    verMin:=min;
end;
procedure Menu (var A:arbol);
var
  eleccion,min:integer;
begin
  writeln('Ingrese 1 para generar el arbol ordenado por codigo de pasta');
  writeln('Ingrese 2 si quiere ingresar una nueva venta');
  writeln('Ingrese 3 si quiere imprimir la informacaion del arbol');
  writeln('Ingrese 4 si quiere saber el codigo de pasta caon menos ventas');
  writeln('Ingrese 5 si quiere saber los caodigos de pasta caon mas de 10kg vendidos');
  Readln(eleccion);
  case eleccion of
    1: inicializarVar (A,min);
    2: cargarArbol(A);
    3: imprimirpornivel (A);
    4: writeln('el codigo caon menos numero de ventas es: ', verMin(A,min));
  end;
end;
var
  A:arbol;
begin
  Menu (A);
end.

