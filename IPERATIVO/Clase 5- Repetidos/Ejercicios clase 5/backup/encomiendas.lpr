Program encomiendas;
Type

   encomienda = record
                  codigo: integer;
                  peso: integer;
                end;

  // Lista de encomiendas
  lista = ^nodoL;
  nodoL = record
    dato: encomienda;
    sig: lista;
  end;
  arbolCOD=^nodoCOD;
  nodoCOD=record
    datoC:integer;
    HIcod:arbolCOD;
    HDcod:arbolCOD;
  end;

  elmArbol=record
    peso:integer;
    AC:arbolCOD;
  end;

  arbolPESO=^nodoP;
  nodoP=record
    datoP:elmArbol;
    HIpeso:arbolPESO;
    HDpeso:arbolPESO;
  end;

{-----------------------------------------------------------------------------
AgregarAdelante - Agrega una encomienda adelante en l}
procedure agregarAdelante(var l: Lista; enc: encomienda);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := enc;
  aux^.sig := l;
  l:= aux;
end;


{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con datos de las encomiendas }
procedure crearLista(var l: Lista);
var
  e: encomienda;
  i: integer;
begin
 l:= nil;
 for i:= 1 to 20 do begin
   e.codigo := i;
   e.peso:= random (10);
   while (e.peso = 0) do e.peso:= random (10);
   agregarAdelante(L, e);
 End;
end;
{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);

begin
 While (l <> nil) do begin
   writeln('Codigo: ', l^.dato.codigo, '  Peso: ', l^.dato.peso);
   l:= l^.sig;
 End;
end;
{procedure InsertarABO (var A:arbolPESO;dato:integer);
begin
  if (A=nil) then begin
    new(A);
    A^.dato:=dato;
    A^.HI:=nil;
    A^.HD:=nil;
  end
  else
    if (A^.dato>dato)then
      InsertarABO(A^.HI,dato)
    else
      if (A^.dato<dato) then
        InsertarABO(A^.HD,dato)
      else
        InsertarABO(A^.dato.AC,A^.dato.AC.dato);
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




Var

 l: lista;

begin
 Randomize;

 crearLista(l);
 writeln ('Lista de encomiendas generada: ');
 imprimirLista(l);


 readln;
end.
