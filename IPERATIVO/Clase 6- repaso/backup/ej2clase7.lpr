program ej2clase7;
type

  libro=record
    titulo:string;
    ISBN:integer;
    clasificador: string;
  end;

  arbol=^nodoA;
  nodoA=record
    datos:libro;
    HI:arbol;
    HD:arbol;
  end;
procedure insertarABO (var a:arbol ;dato :libro);
begin
  if(a=nil) then begin
    new(a);
    a^.datos:= dato;
    a^.HI:=nil;
    a^.HD:=nil;
  end else begin
    if(a^.datos.ISBN>dato.ISBN) then
      insertarABO(a^.HI,dato)
    else
      if (a^.datos.ISBN<dato.ISBN) then
        insertarABO(a^.HD,dato);
  end;

end;

procedure ingresarDato(var L:libro);
begin
  writeln(' Ingrese el ISBN del libro: ');
  readln(L.ISBN );
  if (L.ISBN<>0)then begin
     writeln(' Ingrese el titulo del libro: ');
     readln(L.titulo );
     writeln(' Ingrese el clasificador bibliografico del libro: ');
     readln(L.clasificador );
  end;
end;

procedure cargarABO(var a:arbol);
var
  L:libro;
begin
  ingresarDato(L);
  if (L.ISBN<>0) then begin
    insertarABO(a,L);
    cargarABO(a);
  end;

end;

var
  a:arbol;

begin
  a:=nil;
  cargarABO(a);
  readln;
end.

