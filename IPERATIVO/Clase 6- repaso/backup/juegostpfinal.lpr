Program juegostpfinal;
Uses
	sysutils;
const
inf=100;
sup=200;
Type
	sub = 1..4;

	disciplina = record
		cod: integer;
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

        listaP=^nodoP;
        nodoP=record
          pais:string;
          sig:listaP;
        end;

        datosA=record
          coddis:integer;
          nomdis:string;
          totAtletas:integer;
          paises:listaP;
        end;

        arbol=^nodoA;
        nodoA=record
          datos:datosA;
          HI,HD:arbol;
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
  d.cod := random (100);

  while (d.cod <> 0) do Begin
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
	d.cod := random (100);
  end;
end;

procedure imprimir(d:disciplina);
begin
  writeln('Codigo de resultado: ',d.cod);
  writeln('Codigo de disciplina: ',d.codDisciplina);
  writeln('Nombre de disciplina: ',d.nombreDisciplina);
  writeln('Puesto: ',d.puesto);
  writeln('Nombre del atleta: ',d.nombreAtleta);
  writeln('Pais del atleta: ',d.pais);
end;

{-----------------------------------------------------------------------------
IMPRIMIRLISTA - Muestra en pantalla la lista l }
procedure imprimirLista(l: listaDisciplinas);
begin
  while (l <> nil) do begin
   imprimir(l^.dato); //Completar el algoritmo para validar
   writeln(' ');
   l:= l^.sig;
  end;
end;

procedure insertarpaises(var l:listap;dis:disciplina);
var
  nue:listap;
begin
  new(nue);
  nue^.pais:=dis.pais;
  nue^.sig:=l;
  l:=nue;
end;

procedure valores (var A:arbol;d:disciplina);

begin
  A^.datos.coddis:=d.coddisciplina;
  A^.datos.nomdis:=d.nombreDisciplina;
  A^.datos.totatletas:=A^.datos.totatletas+1;
  A^.datos.paises:=nil;
  insertarPaises(A^.datos.paises,d);
  A^.HI:=nil;
  A^.HD:=nil;
end;

procedure InsertarABO (var A:arbol;d:disciplina);
begin
  if (A=nil) then begin
    new(A);
    A^.datos.totatletas:=1;
    valores(A,d);
  end
  else begin
    if (A^.datos.coddis>d.codDisciplina)then
      InsertarABO(A^.HI,d)
    else
      if (A^.datos.coddis<d.codDisciplina) then
        InsertarABO(A^.HD,d)
    else begin
      A^.datos.totatletas:=A^.datos.totatletas+1;
      insertarpaises(a^.datos.paises,d);
  end;
end;
end;

procedure recorrerycargar (var A:arbol;l:listaDisciplinas);
begin
if (l<>nil) then begin
  insertarABO(a,l^.dato);
  recorrerycargar(a,l^.sig);
end;
end;

procedure informartotatletas(a:arbol);
begin
  if (a<>nil) then begin
    if (a^.datos.coddis>=inf) then begin
      if (a^.datos.coddis<=sup) then begin
        writeln('la cantidad de atletas de la disciplina ', a^.datos.nomdis, ' es: ', a^.datos.totAtletas);
        informartotatletas(a^.HI);
        informartotatletas(a^.HD);
      end
      else informartotatletas(a^.HI);
    end
    else informartotatletas(a^.HD);
  end;
end;

procedure informardisciplina (a:arbol);
begin
  if (a<>nil) then begin
    if (a^.datos.totatletas>=inf) then begin
      if (a^.datos.totatletas<=sup) then begin
        writeln('la disciplina ', a^.datos.nomdis);
        informardisciplina(a^.HI);
        informardisciplina(a^.HD);
      end
      else informardisciplina(a^.HI);
    end
    else
      informardisciplina(a^.HD);
  end;
end;

Var

 l: listaDisciplinas;
 a:arbol;

begin
 Randomize;

 l:=nil;
 crearLista(l);
 writeln ('Lista generada: ');
 imprimirLista(l);

 writeln(' ');
 a:=nil;
 recorrerycargar(a,l);
 writeln('a continuacion la cantidad total de atletas con el codigo de disciplinas entre 100 y 200: ');
 informartotatletas(a);
 writeln('a continuacion las disciplinas con la cantidad de atletas entre 100 y 200: ');
  informardisciplina(a);



 writeln('Fin del programa');
 readln;
end.
