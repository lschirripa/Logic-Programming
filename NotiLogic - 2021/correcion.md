Correcion: @juancete

Hola @lschirripa

Te paso las observaciones del parcial

Punto 1
El enunciado dice que un artículo tiene un título y una persona involucrada. Esta abstracción no se encuentra modelada, lo cual lleva a usar en los predicados más parámetros de lo necesario. Esto se puede agrupar con un functor llamado artículo. Por ejemplo

noticia(artVandalay,articulo("Nuevo título para Lloyd Braun",deportista(lloydBraun,5)),25).
3 puntos

Punto 2
Al usar functores para arþículo, no es necesario manejar a la noticia. Lo que pide saber si es amarillista es el artículo, no la noticia

esAmarillista(articulo("primicia",_)).
esAmarillista(articulo(_,Persona)):-estaComplicado(Persona).

estaComplicado(politico(_,_)).
estaComplicado(deportista(_,Titulos)):-Titulos < 3.
estaComplicado(farandula(_,seinfeld)).
3 puntos

Punto 3
En el punto 3.2 autorMuyOriginal entra ligado el título y el autor dentro del not. Entonces esto lleva a que se evalúe para este título en lugar de todos. Para que ocurra lo que pide el enunciado es necesario que quede como incógnita dentro del not

esMuyOriginal(Autor):- autor(Autor), not((noticia(OtroAutor,articulo(Titulo,_),_),noticia(Autor,articulo(Titulo,_),_),Autor \= OtroAutor)).
3 puntos

Punto 4
3 puntos

Muy bien con tests!
Nota 9
