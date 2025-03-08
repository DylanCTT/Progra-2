program calculodepotencia;

function potencial (x,n:integer):integer;
begin
  if (n=0)then
    potencial:=1
  else begin
    potencial:=x*potencial(x,n-1);
    writeln(potencial);
  end;
end;

var
   n, x: integer;

begin

     write ('Ingrese base: ');
     Readln (x);
     write ('Ingrese exponente: ');
     Readln (n);
     writeln(potencial(x,n));

     readln;
end.
