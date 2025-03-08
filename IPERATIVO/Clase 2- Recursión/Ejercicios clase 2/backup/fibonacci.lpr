program fibonacci;
function Fibonacci (n:integer;ant1,ant2:integer):integer;
var
  act:integer;
begin
  if (n<>0)then begin
    fibonacci:=ant1+ant2;
    ant1:=ant2;
    ant2:=fibonacci;
    writeln(ant2);
    act:=fibonacci(n-1,ant1,ant2);
  end;
  fibonacci:=act;
end;

var
  n,ant1,ant2:integer;
begin
  ant1:=0;
  ant2:=1;
  writeln('escribe la cantidad de numeros de fibonacci que quiere: ');
  read(n);
  if (n=1) then
    writeln(ant1);
  if(n=2) then begin
    writeln (ant1);
    writeln(ant2);
  end;
  if (n>=3)then begin
    writeln (ant1);
    writeln (ant2);
    writeln(Fibonacci (n-1,ant1,ant2));
  end;
  readln;

end.

