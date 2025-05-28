program parcial_03_2021;
type

  cliente=record
    DNI:integer;
    nom:string;
    fecha:string;
    monto:integer;
  end;

  datosA=record
    dni:integer;
    nombre:string;

  end;

  arbol=^.nodoA;
  nodoA=record
    datos:cliente;
    HI:arbol;
    HD:arbol;
  end;
end;

procedure agregarDatos(a:arbol; c:cliente);
begin

end;

procedure insertarArbol(var a:arbol; c:cliente);
begin
  if (a=nil) then begin
    new(a);
    agregarDatos(a,c);
  end
  else begin
    if (a^.datos.peso>e.peso) then
       insertarArbol(a^.HI,e) {si el peso es mas chico}
    else
      if (a^.datos.peso<e.peso) then
         insertarArbol(a^.HD,e) {si el peso es mas grande}
    else
      insertarListaCod(a^.datos.cod,e.codigo); {trato los repetidos agregando el codigo de producto en una lista}
  end;
end;

begin
end.

