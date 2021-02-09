---
title:
- |
  Ejercicios de\
  Programación orientada a objetos
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

\renewcommand{\arraystretch}{0}

@. Traducir a clases y objetos todo el código que tenemos actualmente en \
   [`https://github.com/iesdonana/vampiro.git`](https://github.com/ricpelo/vampiro.git),
   teniendo en cuenta que:

    #. Las localidades deben ser objetos de la clase `Localidad`.

    #. Es posible que no sea necesario hacer una clase `Localidades`.

    #. El jugador debe ser un único objeto de la clase `Jugador` (a ésto se le
       llama _Singleton_).

    #. Las conexiones de una localidad se deben almacenar dentro de la
       localidad.

    #. Cada conexión puede ser un objeto de una clase `Conexion`, o puede que
       no merezca la pena crear una clase para eso. En tal caso, las conexiones
       serían parejas de elementos (que se podrían representar con cualquier
       estructura tipo lista, tupla, diccionario...) que contenga una dirección
       y una localidad de destino.

    #. Los ítems (objetos que aparecen en el juego, como el crucifijo o la
       ristra de ajos) deben ser objetos de la clase `Item`.

    #. Las colecciones deben ser objetos de la clase `Coleccion`.

    #. Los ítems pueden estar en una localidad o en el inventario del jugador.
       Para ello, hay que usar objetos de la clase `Coleccion`.

    #. Un _token_ representa una palabra con significado propio y distinto de
       otras palabras. Cada _token_ debe ser un objeto de la clase `Token`.

    #. Cada grupo de palabras del mismo tipo («verbo», «nombre», etc.) debe ser
       un objeto de la clase `Vocabulario`. Así, debe haber un vocabulario que
       contenga todos los verbos, otro que contenga todos los nombres, etc.

       Cada objeto de la clase `Vocabulario` debe inicializarse con un
       diccionario que asocie cada _token_ con una lista de lexemas que sean
       sinónimos.

       Por ejemplo:

       ```python
       ABRIR = Token()
       ARRIBA = Token()
       verbos = Vocabulario({
           ABRIR: ['ABRIR', 'ABRE'],
           ARRIBA: ['ARRIBA', 'SUBIR', 'SUBE']
       })
       CRUCIFIJO = Token()
       AJOS = Token()
       nombres = Vocabulario({
           CRUCIFIJO: ['CRUCIFIJO', 'CRUZ'],
           AJOS: ['AJOS', 'AJO', 'RISTRA']
       })
       ```

    #. La función `interpretar` debe implementarse como un método estático de
       una clase (que puede ser la misma clase `Vocabulario`) que se encargue
       de analizar sintácticamente la entrada del jugador a partir de los
       vocabulario de verbos y de nombres. Ese método debe devolver los
       _tokens_ del verbo y el nombre encontrados, o un _token_ especial
       (llamado _token nulo_) que represente que no se ha encontrado el verbo o
       el nombre.
