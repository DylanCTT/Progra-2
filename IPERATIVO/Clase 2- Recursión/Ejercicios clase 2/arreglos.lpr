program arreglos;

const
    dimF = 8;  {Dimensión física del vector}

type

    vector = array [1..dimF] of LongInt;

    dim = 0..dimF;


{-----------------------------------------------------------------------------
CARGARVECTOR - Carga nros aleatorios entre 0 y 100 en el vector hasta que
llegue el nro 99 o hasta que se complete el vector}
Procedure cargarVector ( var vec: vector; var dimL: dim);
var
   d: integer;
begin
     Randomize;  { Inicializa la secuencia de random a partir de una semilla}
     dimL := 0;
     d:= random(100);
     while (d <> 99)  and ( dimL < dimF ) do begin
           dimL := dimL + 1;
           vec[dimL] := d;
           d:= random(100);
     end;
End;



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

function digitoMaximo (v:vector;n:integer;max:integer):integer;
var
  dig:integer;
begin
  if (dimF>n) then begin
    dig:=v[n];
    if (max<dig) then begin
      max:=dig;
      max:=digitoMaximo(v,n+1,max);
    end
    else
      max:=digitoMaximo(v,n+1,max);
  end;
  digitoMaximo:=max;
end;



{PROGRAMA PRINCIPAL}
var
   v: vector;
   dimL : dim;
   n:integer;
   max:integer;
begin
     n:=1;
     max:=-1;
     cargarVector(v,dimL);

     writeln('Nros almacenados: ');
     imprimirVector(v, dimL);
     writeln('el digito maximo es: ', digitoMaximo(v,n,max));
     writln('la suma de todos los elementos del vector es: ', sumaTot);
     readln;
end.

