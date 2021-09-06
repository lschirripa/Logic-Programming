%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% base de conocimientos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%materia(nombre,horas,integradoraOIntegradora)
%1 año
materia(sistemasYOrganizaciones,89,integradora).
materia(matematicaDiscreta,89,integradora).
materia(analisisMatematicoI,30,integradora).
materia(algebraYGeometriaAnalitica,155,integradora).
materia(arquitecturaDeComputadores,112,integradora).
materia(algoritmosYEstructuraDeDatos,155,integradora).
materia(quimica,89,integradora).
materia(ingenieriaYSociedad,40,integradora).

% integradora(sistemasYOrganizaciones).

%2 año
materia(analisisDeSistemas,200,integradora).
materia(paradigmasDeProgramacion,112,integradora).
materia(sintaxisYSemanticaDeLosLenguajes,200,integradora).
materia(analisisMatematicoII,155,integradora).
materia(probabilidadYEstadistica,89,integradora).
materia(fisicaI,155,integradora).
materia(sistemasDeRepresentacion,89,integradora).
materia(inglesI,40,libre).
%3 año
materia(disenioDeSistemas,200,integradora).
materia(sistemasOperativos,112,integradora).
materia(matematicaSuperior,112,integradora).
materia(fisicaII,155,integradora).
materia(gestionDeDatos,112,integradora).
materia(economia,112,integradora).
materia(legislacion,40,integradora).
materia(inglesII,40,libre).
%4 año
materia(administracionDeRecursos,200,integradora).
materia(redesDeInformacion,112,integradora).
materia(ingenieriaDeSoftware,89,integradora).
materia(teoriaDelControl,89,integradora).
materia(investigacionOperativa,155,integradora).
materia(simulacion,112,integradora).
materia(comunicaciones,112,integradora).
%5 año
materia(proyectoFinal,200,integradora).
materia(inteligenciaArtificial,89,integradora).
materia(administracionGerencial,89,integradora).
materia(sistemasDeGestion,40,integradora).

%Correlativa(Materia, SuCorrelativa)
correlativa(analisisMatematicoII, analisisMatematicoI).
correlativa(analisisMatematicoII, algebraYGeometriaAnalitica).
correlativa(fisicaII, fisicaI).
correlativa(inglesII, inglesI).
correlativa(fisicaII, analisisMatematicoI).
correlativa(analisisDeSistemas, sistemasYOrganizaciones).
correlativa(analisisDeSistemas, algoritmosYEstructurasDeDatos).
correlativa(sintaxisYSemanticaDeLosLenguajes, algoritmosYEstructurasDeDatos).
correlativa(sintaxisYSemanticaDeLosLenguajes, matematicaDiscreta).
correlativa(paradigmasDeProgramacion, algoritmosYEstructurasDeDatos).
correlativa(paradigmasDeProgramacion, matematicaDiscreta).
correlativa(sistemasOperativos, algoritmosYEstructurasDeDatos).
correlativa(sistemasOperativos, arquitecturaDeComputadores).
correlativa(sistemasOperativos, matematicaDiscreta).
correlativa(probabilidadYEstadistica, analisisMatematicoI).
correlativa(probabilidadYEstadistica, algebraYGeometriaAnalitica).
correlativa(disenioDeSistemas, paradigmasDeProgramacion).
correlativa(disenioDeSistemas, analisisDeSistemas).
correlativa(comunicaciones, arquitecturaDeComputadores).
correlativa(comunicaciones, analisisMatematicoII).
correlativa(comunicaciones, fisicaII).
correlativa(matematicaSuperior, analisisMatematicoII).
correlativa(gestionDeDatos, analisisDeSistemas).
correlativa(gestionDeDatos, paradigmasDeProgramacion).
correlativa(gestionDeDatos, sintaxisYSemanticaDeLosLenguajes).
correlativa(economia, analisisDeSistemas).
correlativa(redesDeInformacion, sistemasOperativos).
correlativa(redesDeInformacion, comunicaciones).
correlativa(administracionDeRecursos, sistemasOperativos).
correlativa(administracionDeRecursos, disenioDeSistemas).
correlativa(administracionDeRecursos, economia).
correlativa(investigacionOperativa, probabilidadYEstadistica).
correlativa(investigacionOperativa, matematicaSuperior).
correlativa(simulacion, probabilidadYEstadistica).
correlativa(simulacion, matematicaSuperior).
correlativa(ingenieriaDeSoftware, probabilidadYEstadistica).
correlativa(ingenieriaDeSoftware, disenioDeSistemas).
correlativa(ingenieriaDeSoftware, gestionDeDatos).
correlativa(teoriaDelControl, quimica).
correlativa(teoriaDelControl, matematicaSuperior).
correlativa(legislacion, analisisDeSistemas).
correlativa(legislacion, ingenieriaYSociedad).
correlativa(proyectoFinal, redesDeInformacion).
correlativa(proyectoFinal, administracionDeRecursos).
correlativa(proyectoFinal, ingenieriaDeSoftware).
correlativa(proyectoFinal, legislacion).
correlativa(inteligenciaArtificial, investigacionOperativa).
correlativa(inteligenciaArtificial, simulacion).
correlativa(administracionGerencial, administracionDeRecursos).
correlativa(administracionGerencial, investigacionOperativa).
correlativa(sistemasDeGestion, administracionDeRecursos).
correlativa(sistemasDeGestion, investigacionOperativa).
correlativa(sistemasDeGestion, simulacion).

materiaInicial(Materia):-
  generadorMateria(Materia),
  not(correlativa(Materia, _)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Consultas a resolver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

esPesada(Nombre):- 
  materia(Nombre,CantidadHoras,integradora), 
  CantidadHoras > 100.
esPesada(Nombre):- 
  materia(Nombre,_,_), atom_length(Nombre,CantidadDeLetras), 
  CantidadDeLetras > 25.

generadorMateria(Materia):- materia(Materia, _, _).

obtenerCorrelativas(Materia, MateriaPrevia):- correlativa(Materia, MateriaPrevia).
obtenerCorrelativas(Materia, MateriaPrevia):- 
  % generadorMateria(Materia),
  correlativa(MateriaAnterior, MateriaPrevia),
  distinct(obtenerCorrelativas(Materia, MateriaAnterior)).

materiasQueDestraba(Materia, MateriaDestrabada):-
  % generadorMateria(Materia),
  obtenerCorrelativas(MateriaDestrabada, Materia).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% curso(Persona, Materia, FunctorMetodologia, Nota).

curso(julio, paradigmasDeProgramacion, anual(2020), 8).
curso(julio, algebraYGeometriaAnalitica, anual(2020), 10).
curso(julio, analisisMatematicoI, cuatrimestral(2019, 2), 6).
curso(julio, sistemasYOrganizaciones, cuatrimestral(2020, 2), 2).
curso(julio, sistemasYOrganizaciones, anual(2021),8).
curso(julio, matematicaDiscreta, verano(2018), 8).
curso(alberto, analisisMatematicoI, cuatrimestral(2017, 1), 2).
curso(alberto, analisisMatematicoI, cuatrimestral(2018, 1), 10).
curso(alberto, analisisMatematicoII, anual(2019), 6).
curso(alberto, matematicaDiscreta, anual(2019), 6).
curso(ana, analisisMatematicoI, anual(2019), 9).
curso(ana, analisisMatematicoII, anual(2020), 2).
curso(ana, analisisMatematicoII, anual(2021), 7).
curso(ana, sistemasYOrganizaciones, anual(2021),6).
curso(juan, sistemasOperativos , anual(2021),5).
curso(federico, sistemasOperativos , anual(2022),1).
curso(ezequiel, matematicaSuperior , anual(2010),6).

notaFinal(julio, analisisMatematicoI, 6).
notaFinal(ana, analisisMatematicoII, 9).
notaFinal(ana, sistemasYOrganizaciones, 3).
notaFinal(alberto, matematicaDiscreta, 4).
notaFinal(juan, inglesI, aprobado).
notaFinal(ana, inglesI, desaprobado).

anioCursada(Alumno, Materia, Anio):-
  curso(Alumno, Materia, Modalidad, _),
  obtenerAnio(Modalidad, Anio).

obtenerAnio(anual(Anio), Anio).
obtenerAnio(cuatrimestral(Anio, _), Anio).
obtenerAnio(verano(AnioCursado), Anio):-
  Anio is AnioCursado - 1.

parioMateria(Alumno, Materia):-
  anioCursada(Alumno, Materia, PrimerAnio), 
  anioCursada(Alumno, Materia, SegundAnio), 
  PrimerAnio \= SegundAnio.

aproboCursada(Alumno, Materia):-
  curso(Alumno, Materia, _, Nota),
  Nota >= 6.

desempenioAlumno(Alumno, Materia, DesempenioTotal):-
  findall(DesempenioIndividual, (curso(Alumno, Materia, Modalidad, Nota), obtenerDesempenios(Modalidad,Nota,DesempenioIndividual)), ListaDeDesempenios),
  sum_list(ListaDeDesempenios, DesempenioTotal).
  
obtenerDesempenios(anual(_), Desempenio, Desempenio).
obtenerDesempenios(cuatrimestral(_, Cuatrimestre), Nota, Desempenio):-
  Desempenio is Nota - (Cuatrimestre - 1).
obtenerDesempenios(verano(_), Nota, Nota):- Nota < 8.
obtenerDesempenios(verano(_), Nota, 8):- Nota >= 8.
  
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

obtenerAlumnos(Alumno):- curso(Alumno,_,_,_).
obtenerMateriasCursadas(Materia):- curso(_,Materia,_,_).

rindeFinal(Alumno,Materia):- 
  distinct(obtenerAlumnos(Alumno)), 
  curso(Alumno,Materia,_,Nota), 
  Nota >= 6, Nota < 8.

materiaAprobada(Alumno,Materia):-
  curso(Alumno, Materia, _, Nota),
  Nota >= 8.
materiaAprobada(Alumno,Materia):- 
  rindeFinal(Alumno, Materia),
  notaFinal(Alumno, Materia, Nota),
  Nota >= 6.
materiaAprobada(Alumno, Materia):-
  materia(Materia, _, libre),
  notaFinal(Alumno, Materia, aprobado).
  
esProcrastinadora(Alumno):- 
  distinct(obtenerAlumnos(Alumno)),
  forall(rindeFinal(Alumno, Materia), (notaFinal(Alumno, Materia, Nota), Nota < 6)).

materiaFiltro(Materia):-
  distinct(obtenerMateriasCursadas(Materia)),
  forall(curso(_, Materia, _, Nota), (Nota < 8)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parte 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a
materiaLinda(julio,disenioDeSistemas).
materiaLinda(ana,algoritmosYEstructuraDeDatos).
% materiaLinda(federico, _).
% materiaLinda(alberto,_).

materiaIntegradora(Materia):- materia(Materia, _, integradora).

cursadaSugerida(Alumno, ListaMaterias):-
 materiaLinda(Alumno, MateriaLinda),
 materiaIntegradora(MateriaIntegradora),
 esPesada(MateriaPesada),
 listarMaterias([MateriaLinda, MateriaIntegradora, MateriaPesada], ListaMaterias).

listarMaterias([], []).
listarMaterias([Materia|Materias], ListaMaterias):-
  member(Materia, Materias), 
  listarMaterias(Materias, ListaMaterias).
listarMaterias([Materia|Materias], [Materia|ListaMaterias]):-
  not(member(Materia, Materias)), 
  listarMaterias(Materias, ListaMaterias).

%b

listarCorrelativas(Materia, MateriasPreviasSinDuplicados):-
  generadorMateria(Materia),
  findall(UnaMateria,obtenerCorrelativas(Materia, UnaMateria), MateriasPrevias),
  list_to_set(MateriasPrevias, MateriasPreviasSinDuplicados).

cursarCorrelativas(Alumno, Correlativa):-
  alumno(Alumno),
  generadorMateria(Materia),
  forall(aproboCursada(Alumno, Materia),materiasQueDestraba(Materia, Correlativa)).

% puedeCursar(Alumno, Materias):-
%   alumno(Alumno),
%   materia(Materias),
%   findall(MateriaDestrabada, (aproboCursada(Alumno, MateriaDestrabada), , )

alumno(Alumno):-curso(Alumno, _, _, _).

:- begin_tests(utneanos).

%PARTE1
%1
  test(una_materia_es_pesada_por_ser_integradora_y_superar_la_cantidad_de_horas_limite, nondet):- 
    esPesada(analisisDeSistemas).

  test(una_materia_es_pesada_por_tener_nombre_largo, nondet):-
    esPesada(sintaxisYSemanticaDeLosLenguajes).

%2

  test(materias_iniciales, 
    set(Materia == 
      [algebraYGeometriaAnalitica,
      algoritmosYEstructuraDeDatos,
      analisisMatematicoI,
      arquitecturaDeComputadores,
      fisicaI,
      ingenieriaYSociedad,
      inglesI,
      matematicaDiscreta,
      quimica,
      sistemasDeRepresentacion,
      sistemasYOrganizaciones
      ])):-
        materiaInicial(Materia).

  test(materia_que_no_es_inicial,fail):-
     materiaInicial(teoriaDelControl).

  test(una_materia_tiene_correlativas, set(Materia == [analisisMatematicoI, analisisMatematicoII, algebraYGeometriaAnalitica])):-
    obtenerCorrelativas(matematicaSuperior, Materia).

  test(materias_que_destraba_una_materia, set(MateriaDestrabada == [fisicaII])):-
    materiasQueDestraba(fisicaI,MateriaDestrabada).

  test(una_cursada_en_verano_corresponde_al_ciclo_lectivo_del_anio_anterior, nondet):-
    anioCursada(julio, matematicaDiscreta, 2017).

  test(una_cursada_anual_o_cuatrimestral_corresponden_al_ciclo_de_ese_anio, nondet):-
    anioCursada(ana,analisisMatematicoI,2019),
    anioCursada(alberto,analisisMatematicoI,2017).
   
  test(persona_que_pario_una_materia,nondet):-
    parioMateria(ana,analisisMatematicoII).

  test(persona_que_no_pario_una_materia,fail):-
    parioMateria(julio,matematicaDiscreta).

  test(persona_que_aprobo_una_cursada):-
    aproboCursada(ana, sistemasYOrganizaciones).
  
  test(desempenio_academico_de_una_persona_segun_la_modalidad_en_la_que_curso):-
    desempenioAlumno(julio,sistemasYOrganizaciones,9).
  
%PARTE 3
  
  test(una_persona_es_procrastinadora_si_no_aprobo_ningun_final_de_las_materias_donde_aprobo_la_cursada, set(PersonaProcrastinadora == [juan, federico])):-
    esProcrastinadora(PersonaProcrastinadora).
    
  test(una_materia_que_nadie_la_promociono,nondet):-
    materiaFiltro(sistemasOperativos).

  test(personas_que_aprobaron_una_materia, set(Persona == [alberto,ana,julio])):-
    materiaAprobada(Persona, analisisMatematicoI).

  test(el_sistema_sugiere_una_cursada_de_cierta_cantidad_de_materias_dependiendo_de_las_preferencias_del_alumno, nondet):-
    cursadaSugerida(ana,[algoritmosYEstructuraDeDatos, sistemasYOrganizaciones, algebraYGeometriaAnalitica]).
  
  test(personas_que_no_tienen_materia_linda_cursan_una_materia_pesada_y_una_integradora, set(Persona == [alberto, federico])):-
    cursadaSugerida(Persona, [sistemasYOrganizaciones, fisicaI]).

:- end_tests(utneanos).