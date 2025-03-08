program vectorordenado;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of integer;

    dim = 0..dimF;

{-----------------------------------------------------------------------------
CARGARVECTORORDENADO - Carga ordenadamente nros aleatorios entre 0 y 100 en el
vector hasta que llegue el nro 99 o hasta que se complete el vector}

Procedure cargarVectorOrdenado ( var vec: vector; var dimL: dim);
var
   d, pos, j: integer;
begin
    Randomize;  { Inicializa la secuencia de random a partir de una semilla}
    dimL := 0;
    d:= random(100);
    while (d <> 99)  and ( dimL < dimF ) do begin
       pos:= 1;
       while (pos <= dimL) and (vec[pos]< d) do pos:= pos + 1;
       for  j:= dimL downto pos do vec[j+1]:= vec[j] ;
       vec[pos]:= d;
       dimL := dimL + 1;
       d:= random(100)
     end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRVECTOR - Imprime todos los nros del vector }

Procedure imprimirVector ( var vec: vector; var dimL: dim );
var
   i: dim;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(vec[i] < 9)then
            write ('0');
        write(vec[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;
function BusquedaDicotomica (pri:integer;ult:integer;v:vector;dato:integer):integer;
var
  med:integer;
  encontre:boolean;
begin
  encontre:=false;
  med:=(pri+ult) div 2;
  if (v[med]=dato) then
    encontre:=true
  else
    if (not encontre) and(v[med]<dato) then
      med:=BusquedaDicotomica(med+1,ult,v,dato)
    else
      if (not encontre)then
        med:=BusquedaDicotomica(pri,med-1,v,dato);
  BusquedaDicotomica:=med;

end;

{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   num,pos:integer;
   pri,ult:integer;

begin
  pri:=1;
  ult:=dimf;
  cargarVectorOrdenado(v,dimL);
  writeln('Nros almacenados: ');
  imprimirVector(v, dimL);
  Writeln('ingrese el numero que quiera buscar');
  readln(num);
  if(diml=0)then
    writeln('no hay elementos en la lista')
  else
    pos:=BusquedaDicotomica(pri,ult,v,num);
  writeln('la posicion del numero es: ', pos);

  readln;
end.
