program recursion;



function digitoMaximo(n: integer;max:integer):integer;
var
  dig: integer;
begin
  dig:= n mod 10;
  if ( dig > max ) then
    max:= dig;
  n:= n div 10;
  if (n <> 0) then begin
    max:=digitoMaximo(n, max)
  end;
  digitoMaximo:=max;
end;

var
  num, maximo: integer;

Begin
  maximo := -1;
  writeln( 'Ingrese un entero no negativo:');
  readln (num);
  maximo:=digitoMaximo (num, maximo);
  writeln ( 'El digito maximo del numero ', num, ' es: ', maximo);
  readln;
End.
