program veterinariapaws;
const
  FIN=90909090;
  inf=20000000;
  sup=35000000;

type
  fecha = record
    dia: integer;
    mes: integer;
    anio: integer;
  end;

  mascota = record
    id: integer;
    tipo: string;
    peso: integer;
    fecha_ingreso: fecha;
    cant_intervenciones: integer;
  end;

  duenio = record
    dni: longint;
    nombre: string;
    apellido: string;
    direccion: string;
  end;

  listaM = ^nodoM;
  nodoM = record
    datosM: mascota;
    sig: listaM;
  end;

  cliente = record
    datoD: duenio;
    mascotas: listaM;
  end;

  listaInfo = ^nodoInfo;
  nodoInfo = record
    datosInfo: cliente;
    sig: listaInfo;
  end;

  arbol = ^nodoA;
  nodoA = record
    datos: cliente;
    HI: arbol;
    HD: arbol;
  end;

procedure agregarAdelante(var l: listaM; m: mascota);
var
  nue: listaM;
begin
  new(nue);
  nue^.datosM := m;
  nue^.sig := l;
  l := nue;
end;

procedure ingresarMascota(var l: listaM);
var
  m: mascota;
begin
  writeln('Ingrese el identificador de la mascota: ');
  readln(m.id);
  writeln('Ingrese el tipo de animal: ');
  readln(m.tipo);
  writeln('Ingrese el peso de la mascota: ');
  readln(m.peso);
  writeln('Ingrese la fecha en que ingreso la mascota: ');
  write('Dia: '); readln(m.fecha_ingreso.dia);
  write('Mes: '); readln(m.fecha_ingreso.mes);
  write('Anio: '); readln(m.fecha_ingreso.anio);
  writeln('Ingrese la cantidad de intervenciones de la mascota: ');
  readln(m.cant_intervenciones);
  agregarAdelante(l, m);
end;

procedure ingresarCliente(var c: cliente);
begin
  writeln('Ingrese el dni del cliente: ');
  readln(c.datoD.dni);
  if (c.datoD.dni <> FIN) then begin
    writeln('Ingrese el nombre del cliente: ');
    readln(c.datoD.nombre);
    writeln('Ingrese el apellido del cliente: ');
    readln(c.datoD.apellido);
    writeln('Ingrese la direccion del cliente: ');
    readln(c.datoD.direccion);
    c.mascotas := nil;
    ingresarMascota(c.mascotas);
  end;
end;

procedure asignarCliente(var a: arbol; c: cliente);
begin
  a^.datos := c;
end;


procedure agregarMascotas(var l1: listaM; l2: listaM);
begin
  while l2 <> nil do begin
    agregarAdelante(l1, l2^.datosM);
    l2 := l2^.sig;
  end;
end;

procedure InsertarABO(var A: arbol; dato: cliente);
begin
  if (A = nil) then
  begin
    new(A);
    asignarCliente(A, dato);
    A^.HI := nil;
    A^.HD := nil;
  end
  else if (A^.datos.datoD.dni > dato.datoD.dni) then
    InsertarABO(A^.HI, dato)
  else if (A^.datos.datoD.dni < dato.datoD.dni) then
    InsertarABO(A^.HD, dato)
  else
    agregarMascotas(A^.datos.mascotas, dato.mascotas);
end;

procedure cargarABO(var a: arbol);
var
  c: cliente;
begin
  ingresarCliente(c);
  if (c.datoD.dni <> FIN) then
  begin
    InsertarABO(a, c);
    cargarABO(a);
  end;
end;

function contador(l: listaM): integer;
begin
  if (l = nil) then
    contador := 0
  else
    contador := l^.datosM.cant_intervenciones + contador(l^.sig);
end;

procedure recorrerarbolMAX(A: arbol; var max: integer; var domMAX: string);
var
  act: integer;
begin
  if (A <> nil) then
  begin
    recorrerarbolMAX(A^.HI, max, domMAX);
    act := contador(A^.datos.mascotas);
    if (act > max) then
    begin
      domMAX := A^.datos.datoD.direccion;
      max := act;
    end;
    recorrerarbolMAX(A^.HD, max, domMAX);
  end;
end;


procedure agregarOrdenado(var l: listaInfo; c: cliente);
var
  nue: listaInfo;
begin
  if (l = nil) or (c.datoD.dni < l^.datosInfo.datoD.dni) then
  begin
    new(nue);
    nue^.datosInfo := c;
    nue^.sig := l;
    l := nue;
  end
  else
    agregarOrdenado(l^.sig, c);
end;

procedure imprimirOrdenado(l: listaInfo);
begin
  if (l <> nil) then
  begin
    writeln('DNI: ', l^.datosInfo.datoD.dni, ' Nombre: ', l^.datosInfo.datoD.nombre, ' Apellido: ', l^.datosInfo.datoD.apellido);
    imprimirOrdenado(l^.sig);
  end;
end;


procedure BusquedaAcotada(var LI: listaInfo; a: arbol);
begin
  if (a <> nil) then
  begin
    if (a^.datos.datoD.dni >= inf) and (a^.datos.datoD.dni <= sup) then
    begin
      agregarOrdenado(LI, a^.datos);
      BusquedaAcotada(LI, a^.HI);
      BusquedaAcotada(LI, a^.HD);
    end
    else if (a^.datos.datoD.dni < inf) then
      BusquedaAcotada(LI, a^.HD)
    else
      BusquedaAcotada(LI, a^.HI);
  end;
end;

procedure procesarMascotas(l:listaM; nombre, apellido: string);
  begin
      with l^.datosM do
      begin
        if (peso > 8) and
           (fecha_ingreso.anio = 2025) and
           (fecha_ingreso.mes >= 1) and (fecha_ingreso.mes <= 3) then
        begin
          writeln(' Cliente: ', nombre, ' ', apellido, ' Mascota ID: ', id, ' Tipo: ', tipo);
        end;
      end;
      procesarMascotas(l^.sig, nombre, apellido);
  end;

procedure imprimirMascotasEsp (a:arbol);
begin
  if (a<>nil) then
    begin
      procesarMascotas(a^.datos.mascotas, a^.datos.datoD.nombre, a^.datos.datoD.apellido);
      imprimirMascotasEsp(a^.HI);
      imprimirMascotasEsp(a^.HD);
    end;
end;

var
  a: arbol;
  max: integer;
  domMAX: string;
  LI: listaInfo;
begin
  a := nil;
  LI := nil;
  cargarABO(a);
  max := -1;
  domMAX := '';
  recorrerarbolMAX(a, max, domMAX);
  writeln('El domicilio del cliente con mas intervenciones en sus animales es: ', domMAX);
  BusquedaAcotada(LI, a);
  writeln(' Clientes en rango ordenados por DNI: ');
  imprimirOrdenado(LI);
  imprimirMascotasEsp(a);
end.
