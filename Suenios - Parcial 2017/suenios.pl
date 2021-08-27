%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BASE DE CONOCIMIENTOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


cree(gabriel, campanita).
cree(gabriel, magoDeOz).
cree(gabriel, cavenaghi).
cree(juan, conejoDePascua).
cree(macarena, reyesMagos).
cree(macarena, magoCapria).
cree(macarena, campanita).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% suenio(Persona, Functor) -> functor: cantante(CantidadDeDiscos) | futbolista(Equipo) | ganarLoteria([Numeros]])
%suenio(Persona, TipoDeSuenio)
suenio(gabriel, ganarLoteria([5,9])).
suenio(gabriel, futbolista(arsenal)).
suenio(juan, cantante(10000)).
suenio(macarena, cantante(10000)).

equipoChico(arsenal).
equipoChico(aldosivi).

%persona(Persona)
persona(gabriel).
persona(juan).
persona(macarena).
persona(franco).
persona(lucho).

    



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

personaAmbiciosa(Persona):-
    distinct(persona(Persona)),
    sumaTodasSusDificultades(Persona, SumaTotal),
    SumaTotal > 20.

sumaTodasSusDificultades(Persona, SumaTotal):-
    findall(Dificultad, dificultadDeSuenio(Persona, Dificultad), TodasSusDificultades),
    sum_list(TodasSusDificultades,SumaTotal).

dificultadDeSuenio(Persona, 6):- 
    suenio(Persona, cantante(CantidadDeDiscos)),
    CantidadDeDiscos > 500000.
dificultadDeSuenio(Persona, 4):- 
    suenio(Persona, cantante(CantidadDeDiscos)),
    CantidadDeDiscos =< 500000.
dificultadDeSuenio(Persona,Total):-
    suenio(Persona, ganarLoteria(NumerosApostados)),
    cuentaRandom(NumerosApostados,Total).
dificultadDeSuenio(Persona,3):-
    suenio(Persona, futbolista(Equipo)),
    equipoChico(Equipo).
dificultadDeSuenio(Persona,16):-
    suenio(Persona, futbolista(Equipo)),
    not(equipoChico(Equipo)).
    
% multiplicarNumApostadosX10(NumerosApostados,Total):-
%     sum_list(NumerosApostados, Suma),
%     Total is Suma*10.

cuentaRandom(NumerosApostados,Total):-
    length(NumerosApostados,CantNumsApostados),
    Total is CantNumsApostados*10.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%tieneQuimica(Persona, Personaje)
tieneQuimica(Persona, Personaje):-
    cree(Persona, Personaje),
    requerimientoEspecial(Persona).
tieneQuimica(Persona, campanita):-
    cree(Persona, campanita),
    requerimientoEspecialDeCampanita(Persona).

requerimientoEspecial(Persona):-
    suenio(Persona, Suenio),
    suenioPuro(Suenio),
    not(personaAmbiciosa(Persona)).

requerimientoEspecialDeCampanita(Persona):-
    dificultadDeSuenio(Persona,Dificultad),
    Dificultad < 5.

suenioPuro(futbolista(_)).
suenioPuro(cantante(_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PUNTO 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

padre(tatara, bisa).
padre(bisa, abu).
padre(abu, padre).
padre(padre, hijo).

ancestro(Padre, Persona):- 
    padre(Padre, Persona).
ancestro(Ancestro, Persona):-
    padre(Padre, Persona),
    ancestro(Ancestro, Padre).

enfermo(campanita).
enfermo(reyesMagos).
enfermo(conejoDePascua).

amigos(campanita, reyesMagos).
amigos(campanita, conejoDePascua).
amigos(conejoDePascua, cavenaghi).

alegra(Persona, Personaje):-
    tieneQuimica(Persona, Personaje),
    not(enfermo(Personaje)).
alegra(Persona, Personaje):-
    tieneQuimica(Persona, Personaje),
    not(enfermo(Personaje)),
    personajeBackUp(Personaje, Amigo).

personajeBackUp( Personaje, Amigo):-
    amigos(Personaje, Amigo).
personajeBackUp(AmigoIndirecto, Amigo):-
    amigos(Personaje,Amigo),
    personajeBackUp(AmigoIndirecto, Personaje).
