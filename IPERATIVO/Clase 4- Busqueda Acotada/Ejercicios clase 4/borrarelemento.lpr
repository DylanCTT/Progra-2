program borrarelemento;
Type

  // Lista de enteros
  lista = ^nodoL;
  nodoL = record
    dato: integer;
    sig: lista;
  end;

  // Arbol de enteros
  arbol= ^nodoA;
  nodoA = Record
    dato: integer;
    HI: arbol;
    HD: arbol;
  End;

  // Lista de Arboles
  listaNivel = ^nodoN;
  nodoN = record
    info: arbol;
    sig: listaNivel;
  end;


{-----------------------------------------------------------------------------
AgregarAdelante - Agrega nro adelante de l}
procedure agregarAdelante(var l: Lista; nro: integer);
var
  aux: lista;
begin
  new(aux);
  aux^.dato := nro;
  aux^.sig := l;
  l:= aux;
end;



{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista con números aleatorios }
procedure crearLista(var l: Lista);
var
  n: integer;
begin
 l:= nil;
 n := random (20);
 While (n <> 0) do Begin
   agregarAdelante(L, n);
   n := random (20);
 End;
end;


{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: Lista);
begin
 While (l <> nil) do begin
   write(l^.dato, ' - ');
   l:= l^.sig;
 End;
end;

{-----------------------------------------------------------------------------
CONTARELEMENTOS - Devuelve la cantidad de elementos de una lista l }

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


{-----------------------------------------------------------------------------
AGREGARATRAS - Agrega un elemento atrás en l}

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

procedure InsertarABO (var A:arbol;dato:integer);
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
        InsertarABO(A^.HD,dato);
  end;

procedure RecorrerLista (L:lista; var A:arbol);
begin
  if (l<>nil) then begin
    InsertarABO(A,L^.dato);
    RecorrerLista(L^.sig,A);
  end;

end;

procedure preOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    preOrden(a^.HI);
    preOrden(a^.HD);
  end;
end;

procedure enOrden(a:arbol);
begin
  if (a<>nil) then begin
    enOrden(a^.HI);
    write(a^.dato,' ');
    enOrden(a^.HD);
  end;
end;

procedure postOrden(a:arbol);
begin
  if (a<>nil) then begin
    write(a^.dato,' ');
    postOrden(a^.HD);
    postOrden(a^.HI);
  end;
end;

function verMin (A:arbol;min:integer):integer;
begin
   if (a<>nil) then begin
    if(A^.HI<>nil)then
      min:=verMin(A^.HI,min)
    else
      min:=A^.dato;
    end;
    verMin:=min;

end;
{-----------------------------------------------------------------------------
IMPRIMIRPORNIVEL - Muestra los datos del árbol a por niveles }

Procedure imprimirpornivel(a: arbol);
var
   l, aux, ult: listaNivel;
   nivel, cant, i: integer;
begin
   l:= nil;
   if(a <> nil)then begin
                 nivel:= 0;
                 agregarAtras (l,ult,a);
                 while (l<> nil) do begin
                    nivel := nivel + 1;
                    cant:= contarElementos(l);
                    write ('Nivel ', nivel, ': ');
                    for i:= 1 to cant do begin
                      write (l^.info^.dato, ' - ');
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

procedure BorrarElemento (var A:arbol;dato:integer;var encontre:boolean);
var
  minSUB:integer;
  aux:arbol;
begin
  if (A=nil)then
    encontre:=false
  else
    if (A^.dato>dato) then
      BorrarElemento(A^.HI,dato,encontre)
    else
      if (A^.dato<dato) then
        BorrarElemento(A^.HD,dato,encontre)
      else begin
        encontre:=true;

      if (A^.HI=nil) and (A^.HD=nil)then begin
        dispose(A);
        A:=nil;
      end
      else
        if (A^.HI<>nil) and (A^.HD=nil) then begin
          aux:=A;
          A:=A^.HI;
          dispose(aux);
        end
          else
            if (A^.HD<>nil) and (A^.HI=nil) then begin
              aux:=A;
              A:=A^.HD;
              dispose(aux);
            end
              else
                if (A^.HD<>nil) and (A^.HI<>nil) then begin
                  minSUB:=9999;
                  A^.dato:=verMin(A^.HD,minSUB);
                  BorrarElemento(A^.HD,A^.dato,encontre);

                end;
end;
end;


Var

 l: lista;
 A:arbol;
 bor:integer;
 encontre:boolean;
begin
 Randomize;

 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 A:=nil;

 RecorrerLista(L,A);
 imprimirpornivel(A);
 Writeln('escribir el dato que se quiere elminiar: ');
 readln(bor);
 encontre:=false;
 BorrarElemento(A,bor,encontre);
 if (not encontre) then
   writeln('el dato que se ingreso no esta en el arbol');

 imprimirpornivel(A);

readln;
end.

