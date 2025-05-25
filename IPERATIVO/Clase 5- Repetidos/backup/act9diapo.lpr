program act9diapo;
Type
  encomienda = record
    codigo :integer;
    peso: integer;
  end;

  lista = ^nodoL;
  nodoL=record
    dato : encomienda;
    sig: lista;
  end;

  listaCod =^nodoCod;
  nodoCod=record
    cod:integer;
    sig: listaCod;
  end;

  datosA=record
    peso:integer;
    cod:listaCod;
  end;

  arbol=^nodo;
  nodo=record
    datos:datosA;
    HD, HI :arbol;
  end;

  procedure agregarAdelante(var l: Lista; enc: encomienda);
  var
     aux: lista;
  begin
       new(aux); {creo un nuevo puntero}
       aux^.dato := enc;
       aux^.sig := l;
       l:= aux;  {lo meto en la lista}
  end;

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
     end;
  end;
  procedure imprimirLista(l:lista);
  begin
     while (l<>nil) do begin
         writeln(' codigo: ', l^.dato.codigo, ' peso: ', l^.dato.peso);
         l:=l^.sig;
     end;
  end;

  procedure insertarListaCod (var l:listaCod; cod:integer);
  var
     nue:listaCod;
  begin
     new(nue);
     nue^.cod:=cod;
     nue^.sig:=l;
     l:=nue;
  end;
  procedure insertarArbol(var a:arbol; e:encomienda);
  begin
       if (a=nil) then begin
          new(a);
          a^.datos.peso:=e.peso;
          a^.datos.cod:=nil;
          a^.HI:=nil;
          a^.HD:=nil;
          insertarListaCod(a^.datos.cod,e.codigo);
       end
       else begin
       if (a^.datos.peso>e.peso) then insertarArbol(a^.HI,e)
       else if (a^.datos.peso<e.peso) then insertarArbol(a^.HD,e)
       else insertarListaCod(a^.datos.cod,e.codigo);
       end;
  end;

  procedure cargarArbol(var a:arbol; l:lista);
  begin
       if (l<>nil) then begin
         insertarArbol(a,l^.dato);
         cargarArbol(a,l^.sig);
       end;
  end;

  procedure imprimirArbol(a:arbol);

  procedure mostrarInfo(datos:datosA);

    procedure imprimirListaCodigos(l:listaCod);
    begin
      if (l<>nil) then begin
        write(l^.cod,' ');
        imprimirListaCodigos(l^.sig);
      end;
    end;

  begin
    writeln('Peso: ',datos.peso);
    write('Codigo(s): ');
    imprimirListaCodigos(a^.datos.cod);
  end;

begin
  if (a<>nil) then begin
    imprimirArbol(a^.HI);
    mostrarInfo(a^.datos);
    writeln(' ');
    imprimirArbol(a^.HD);
  end;
end;

begin
   Randomize;
   crearLista(a,l);
   writeln('arbol generado: ');
   imprimirArbol(a);
   readln();

end.

