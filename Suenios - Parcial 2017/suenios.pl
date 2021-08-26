cree(gabriel, campanita).
cree(gabriel, magoDeOz).
cree(gabriel, cavenaghi).
cree(juan, conejoDePascua).
cree(macarena, reyesMagos).
cree(macarena, magoCapria).
cree(macarena, campanita).


% suenio(Persona, Functor) -> functor: cantante(CantidadDeDiscos) | futbolista(Equipo) | ganarLoteria([Numeros]])

suenio(gabriel, ganarLoteria([5,9])).
suenio(gabriel, futbolista(arsenal)).
suenio(juan, cantante(10000)).
suenio(macarena, cantante(10000)).

equipoChico(arsenal).
equipoChico(aldosivi).

persona(Persona):- 
    cree(Persona,_).

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

