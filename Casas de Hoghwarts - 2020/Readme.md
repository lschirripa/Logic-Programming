### Las Casas de Hogwarts
En Hogwarts, el colegio de magia y hechicería, hay 4 casas en las cuales los nuevos alumnos se distribuyen ni bien ingresan. Cada año estas casas compiten entre ellas para consagrarse la ganadora de la copa.

Parte 1 - Sombrero Seleccionador
Para determinar en qué casa queda una persona cuando ingresa a Hogwarts, el Sombrero Seleccionador tiene en cuenta el carácter de la persona, lo que prefiere y en algunos casos su status de sangre.


Tenemos que registrar en nuestra base de conocimientos qué características tienen los distintos magos que ingresaron a Hogwarts, el status de sangre que tiene cada mago y en qué casa odiaría quedar. Actualmente sabemos que:

Harry es sangre mestiza, y se caracteriza por ser corajudo, amistoso, orgulloso e inteligente. Odiaría que el sombrero lo mande a Slytherin.
Draco es sangre pura, y se caracteriza por ser inteligente y orgulloso, pero no es corajudo ni amistoso. Odiaría que el sombrero lo mande a Hufflepuff.
Hermione es sangre impura, y se caracteriza por ser inteligente, orgullosa y responsable. No hay ninguna casa a la que odiaría ir.
Además nos interesa saber cuáles son las características principales que el sombrero tiene en cuenta para elegir la casa más apropiada:

Para Gryffindor, lo más importante es tener coraje.
Para Slytherin, lo más importante es el orgullo y la inteligencia.
Para Ravenclaw, lo más importante es la inteligencia y la responsabilidad.
Para Hufflepuff, lo más importante es ser amistoso.

Se pide:

Saber si una casa permite entrar a un mago, lo cual se cumple para cualquier mago y cualquier casa excepto en el caso de Slytherin, que no permite entrar a magos de sangre impura.
Saber si un mago tiene el carácter apropiado para una casa, lo cual se cumple para cualquier mago si sus características incluyen todo lo que se busca para los integrantes de esa casa, independientemente de si la casa le permite la entrada.
Determinar en qué casa podría quedar seleccionado un mago sabiendo que tiene que tener el carácter adecuado para la casa, la casa permite su entrada y además el mago no odiaría que lo manden a esa casa. Además Hermione puede quedar seleccionada en Gryffindor, porque al parecer encontró una forma de hackear al sombrero.
Definir un predicado cadenaDeAmistades/1 que se cumple para una lista de magos si todos ellos se caracterizan por ser amistosos y cada uno podría estar en la misma casa que el siguiente. No hace falta que sea inversible, se consultará de forma individual.

[ELIPSIS]

Parte 2 - La copa de las casas
A lo largo del año los alumnos pueden ganar o perder puntos para su casa en base a las buenas y malas acciones realizadas, y cuando termina el año se anuncia el ganador de la copa. Sobre las acciones que impactan al puntaje actualmente tenemos la siguiente información:

Malas acciones: son andar de noche fuera de la cama (que resta 50 puntos) o ir a lugares prohibidos. La cantidad de puntos que se resta por ir a un lugar prohibido se indicará para cada lugar. Ir a un lugar que no está prohibido no afecta al puntaje.
Buenas acciones: son reconocidas por los profesores y prefectos individualmente y el puntaje se indicará para cada acción premiada.
Necesitamos registrar las distintas acciones que hicieron los alumnos de Hogwarts durante el año. Sabemos que:

Harry anduvo fuera de cama.
Hermione fue al tercer piso y a la sección restringida de la biblioteca.
Harry fue al bosque y al tercer piso.
Draco fue a las mazmorras.
A Ron le dieron 50 puntos por su buena acción de ganar una partida de ajedrez mágico.
A Hermione le dieron 50 puntos por usar su intelecto para salvar a sus amigos de una muerte horrible.
A Harry le dieron 60 puntos por ganarle a Voldemort.

También sabemos que los siguientes lugares están prohibidos:

El bosque, que resta 50 puntos.
La sección restringida de la biblioteca, que resta 10 puntos.
El tercer piso, que resta 75 puntos.

También sabemos en qué casa quedó seleccionado efectivamente cada alumno mediante el predicado esDe/2 que relaciona a la persona con su casa, por ejemplo:

esDe(hermione, gryffindor).

esDe(ron, gryffindor).

esDe(harry, gryffindor).

esDe(draco, slytherin).

esDe(luna, ravenclaw).


Se pide incorporar a la base de conocimiento la información sobre las acciones realizadas y agregar la siguiente lógica a nuestro programa:

Saber si un mago es buen alumno, que se cumple si hizo alguna acción y ninguna de las cosas que hizo se considera una mala acción (que son aquellas que provocan un puntaje negativo).
Saber si una acción es recurrente, que se cumple si más de un mago hizo esa misma acción.
Saber cuál es el puntaje total de una casa, que es la suma de los puntos obtenidos por sus miembros.
Saber cuál es la casa ganadora de la copa, que se verifica para aquella casa que haya obtenido una cantidad mayor de puntos que todas las otras.
Queremos agregar la posibilidad de ganar puntos por responder preguntas en clase. La información que nos interesa de las respuestas en clase son: cuál fue la pregunta, cuál es la dificultad de la pregunta y qué profesor la hizo.
Por ejemplo, sabemos que Hermione respondió a la pregunta de dónde se encuentra un Bezoar, de dificultad 20, realizada por el profesor Snape, y cómo hacer levitar una pluma, de dificultad 25, realizada por el profesor Flitwick.

Modificar lo que sea necesario para que este agregado funcione con lo desarrollado hasta ahora, teniendo en cuenta que los puntos que se otorgan equivalen a la dificultad de la pregunta, a menos que la haya hecho Snape, que da la mitad de puntos en relación a la dificultad de la pregunta.
