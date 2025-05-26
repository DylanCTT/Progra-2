Program juegos;
Uses
	sysutils;
const
  inf=100;
  sup=200;
Type
	sub = 1..4;

	disciplina = record
		codRES: integer;
		codDisciplina: integer;
		nombreDisciplina: string;
		puesto: sub;
		nombreAtleta: string;
		pais: string;
	end;

	listaDisciplinas = ^nodoLista;
	nodoLista = record
		dato: disciplina;
		sig: listaDisciplinas;
	end;

        listaP= ^nodoP;
        nodoP=record
                pais: string;
                sig:listaP;
        end;

        datosA=record
                codDis: integer;
                nomDis:string;
                totAtletas:integer;
                paises: listaP;
        end;

        arbol= ^nodoA;
        nodoA=record
                datos: datosA;
                HI:arbol;
                HD:arbol;
        end;


{-----------------------------------------------------------------------------
AgregarOrdenado - Agrega ordenado en l}
Procedure agregarOrdenado(var l: listaDisciplinas; d: disciplina);
var
   nuevo, anterior, actual: listaDisciplinas;
begin
	new (nuevo);
	nuevo^.dato:= d;
	nuevo^.sig := nil;

	actual := l;
	anterior := l;
	while (actual<>nil) and (actual^.dato.pais < nuevo^.dato.pais) do begin
	   anterior := actual;
	   actual:= actual^.sig;
	end;
	if (anterior = actual) then
	   l := nuevo
	else
	   anterior^.sig := nuevo;
	nuevo^.sig := actual;
end;

{-----------------------------------------------------------------------------
CREARLISTA - Genera una lista }
procedure crearLista(var l: listaDisciplinas);
var
  aux: integer;
  d: disciplina;
begin
  l:= nil;
  d.codRES := random (100);

  while (d.codRES <> 0) do Begin
        aux:=random(193)+1;
        if(aux<10)then
            d.pais:= Concat('Pais00',IntToStr(aux))
        else
            if(aux<100)then
                d.pais:= Concat('Pais0',IntToStr(aux))
	    else
                d.pais:= Concat('Pais',IntToStr(aux));
	d.codDisciplina:= random (299)+1;
	d.nombreDisciplina:= Concat('Disciplina', IntToStr(d.codDisciplina));
	d.puesto:= random (3)+1;
	d.nombreAtleta:= Concat('Atleta', IntToStr(random(5000)));
	agregarOrdenado(l,d);
	d.codRES := random (100);
  end;
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }

procedure imprimirLista(d:disciplina);
begin
   writeln(' codRES: ', d.codRES, ' codDisciplina: ', d.codDisciplina, ' nombreDisciplina: ', d.nombreDisciplina, ' puesto: ', d.puesto, ' nombre atleta: ', d.nombreAtleta, ' pais: ', d.pais);
end;

procedure imprimir(l: listaDisciplinas);
begin
  while (l <> nil) do begin
   imprimirLista(l^.dato); //Completar el algoritmo para validar
   l:= l^.sig;
  end;
end;

procedure insertarListaP(var l:listaP; p:string);
var
  nue, act:listaP;
begin
  act:=l;
  while ((act<>nil) and (act^.pais<>p)) do
        act:=act^.sig;
  if (act=nil)then begin
     new(nue);
     nue^.pais:=p;
     nue^.sig:=l;
  end;
end;

procedure ingresarDatos(var a:arbol; d: disciplina);
begin
  a^.datos.codDis:=d.codDisciplina;
  a^.datos.nomDis:=d.nombreDisciplina;
  a^.datos.totAtletas:=1;
  a^.datos.paises:=nil;
  a^.HI:=nil;
  a^.HD:=nil;
end;

procedure insertarArbol(var a:arbol; d:disciplina);
begin
  if (a=nil) then begin
    new(a);
    ingresarDatos(a,d);
    insertarListaP(a^.datos.paises, d.pais);
  end
  else begin
    if (a^.datos.codDis>d.codDisciplina) then
       insertarArbol(a^.HI,d) {si el codigo es mas chico}
    else
      if (a^.datos.codDis<d.codDisciplina) then
         insertarArbol(a^.HD,d) {si el codigo es mas grande}
    else begin
      a^.datos.totAtletas:=a^.datos.totAtletas+1; {trato los repetidos agregando un atleta mas a la disiplina y agregando el pais de ser necesario}
      insertarListaP(a^.datos.paises,d.pais);
    end;

  end;
end;

procedure cargarABO (var a:arbol;  l:listaDisciplinas);
begin
  if(l<>nil) then begin
             insertarArbol (a,l^.dato);
             cargarABO(a,l^.sig);
  end;
end;

procedure cantAtletas (a:arbol);
begin
  if (a^.datos.codDis>=inf) then begin
     if (a^.datos.codDis<=sup) then begin
        writeln(' El codigo de disciplina ', a^.datos.codDis, ' la cantidad de atletas es: ', a^.datos.totAtletas);
     end;
  end;
end;

procedure nomDisciplina (a:arbol);
begin
     if (a^.datos.totAtletas>=inf) then begin
        if (a^.datos.totAtletas<=sup) then begin
           writeln(' La disciplina ', a^.datos.nomDis, ' hay ', a^.datos.totAtletas, ' atletas ');
        end;
     end;
end;

procedure recorrerABO (a:arbol);
begin
   if (a<>nil) then begin
      cantAtletas(a);
      nomDisciplina(a);
      recorrerABO(a^.HI);
      recorrerABO(a^.HD);
   end;
end;

Var

 a:arbol;
 l: listaDisciplinas;

begin
 Randomize;
 l:=nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimir(l);
 a:=nil;
 cargarABO(a, l);
 recorrerABO(a);
 writeln('Fin del programa');
 readln;
end.

