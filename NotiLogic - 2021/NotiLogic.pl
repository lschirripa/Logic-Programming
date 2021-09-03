%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BASE DE CONOCIMIENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

noticia(artVandelay, 25, nuevoTituloParaLloydBraun, deporte(lloydBraun, 5)).
noticia(elaineBenes, 16, primicia, farandula(kennyBania, jerrySeinfeld)).
noticia(elaineBenes, 150, elDolarBajoDeUnArbolito,farandula(jerrySeinfeld, newman)).
noticia(bobSacamano, 10, noConsigueGanarNiUnaCarrera, deporte(davidPuddy, 0)).
noticia(bobSacamano, 155, cosmoKramerEncabezaLasElecciones, politico(cosmoKramer, losAmigosDelPoder)).
noticia(georgeCostanza, Visitas , Titulo, Articulo):- 
  noticia(bobSacamano, Visitas ,Titulo, Articulo).

noticia(georgeCostanza, VisitasDeGeorge, Titulo, politico(Personaje, losAmigosDelPoder)):- 
	noticia(_, VisitasDeFarandula, Titulo, farandula(Personaje, _)), 
	VisitasDeGeorge is VisitasDeFarandula / 2.

%Si bien George hace de las suyas, sabemos que Elaine Benes no roba las noticias de Art Vandelay. 
%Este punto no lo agregamos a la base de conocimiento ya que aquello que no existe, se presume falso por el principio del universo cerrado de Prolog.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

personajeInvolucradoComplicado(farandula(_, jerrySeinfeld)).
personajeInvolucradoComplicado(deporte(_, CantidadDeTitulos)):- CantidadDeTitulos < 3.
personajeInvolucradoComplicado(politico(_, _)).

esAmarillista(primicia):- 
	noticia(_,_,primicia,_).
esAmarillista(Titulo):- 
	noticia(_,_,Titulo, Persona),
	personajeInvolucradoComplicado(Persona).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%3.1

autor(Autor):- noticia(Autor,_,_,_).

noLeImportaNada(Autor):-
	distinct(autor(Autor)),
	forall(titulosMuyVisitados(Titulo, Autor), esAmarillista(Titulo)).

%Una de los autores que verifica prolog es elaineBenes, que esta mal, porque al menos UNO de sus titulos muy visitados NO es amarillista (elDolarBajoDeUnArbolito), aunque si
% es amarillista el titulo que George le roba. Lo que identifique es que Prolog no me esta reconociendo que son distintos autores, entonces toma a EleineBenes como alguien
% que no le importa nada, cuando el realidad el Titulo muy visitado y amarillista es de George. De Hecho, si cambio el titulo que recibe George en la base de conocimientos, 
% el predicado noLeImportaNada si verifica a los que corresponden.

titulosMuyVisitados(Titulo, Autor):- 
  noticia(Autor, CantidadVisitas, Titulo, _),
  CantidadVisitas > 15.

%3.2

autorMuyOriginal(Autor):-
	noticia(Autor, _, Titulo, _),
	not((noticia(Autor2, _, Titulo, _),
    Autor \= Autor2)).

%3.3

tuvoTraspie(Autor):- 
	distinct(noticia(Autor, _, Titulo, _)),
	not(titulosMuyVisitados(Titulo, Autor)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

edicionLoca(ArticulosPosibles):- 
	findall(Titulo,noticia(_,_,Titulo,_),Articulos),
	posiblesTitulos(50,Articulos,ArticulosPosibles).
  
posiblesTitulos(_,[],[]).
posiblesTitulos(NoMasDe50Visitas,[Articulo|Articulos],[Articulo|ArticulosPosibles]):-
	noticia(_,Vistas, Articulo,_),
	esAmarillista(Articulo),
	VistasRestantes is NoMasDe50Visitas - Vistas,
	VistasRestantes >= 0,
	posiblesTitulos(VistasRestantes,Articulos,ArticulosPosibles).
  
posiblesTitulos(NoMasDe50Visitas,[_|Articulos],ArticulosPosibles):-
	posiblesTitulos(NoMasDe50Visitas,Articulos,ArticulosPosibles).

:- begin_tests(notiLogic).

test(titulos_que_George_robo, set(Titulos== [noConsigueGanarNiUnaCarrera, cosmoKramerEncabezaLasElecciones, primicia, elDolarBajoDeUnArbolito])):-
	noticia(georgeCostanza, _,Titulos ,_).

test(un_titulo_no_amarillista, fail):-
	esAmarillista(nuevoTituloParaLloydBraun).

test(autor_que_chorea_no_es_original, fail):-
	autorMuyOriginal(georgeCostanza).

test(autor_original):-
	autorMuyOriginal(artVandelay).

test(titulosMuyVisitados_de_george, set(Titulos==[cosmoKramerEncabezaLasElecciones, elDolarBajoDeUnArbolito])):- 
    titulosMuyVisitados(Titulos,georgeCostanza).

test(autor_que_no_tuvo_traspie, fail):- 
	tuvoTraspie(artVandelay),
	tuvoTraspie(elaineBenes).

test(autores_que_si_tuvieron_traspie, set(Quien==[bobSacamano, georgeCostanza])):-
	tuvoTraspie(Quien).

:- end_tests(notiLogic).