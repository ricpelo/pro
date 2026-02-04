---
title: Programación modular
author: Ricardo Pérez López
!DATE
nocite: |
  @pressman_ingenierisoftware_2004, @python_software_foundation_sitio_nodate
---

# Introducción

## Modularidad

- La **programación modular** es una técnica de programación que consiste en
  descomponer nuestro programa en partes llamadas **módulos** y escribir cada
  módulo por separado.

  - El concepto de *módulo* hay que entenderlo en sentido amplio: cualquier
    parte de un programa se podría considerar «módulo» si cumple unas mínimas
    condiciones.

- Equivale a la técnica clásica de resolución de problemas basada en:

  1. Descomponer un problema en subproblemas.

  2. Resolver cada subproblema por separado.

  3. Combinar las soluciones para así obtener la solución al problema original.

- La **modularidad** es la propiedad que tienen los programas escritos de forma
  modular, es decir, como una colección de módulos que se utilizan entre sí.

---

- Las técnicas de modularidad y descomposición de problemas se aplican en la
  mayoría de las disciplinas científicas e industriales.

- Por ejemplo, el diseño y fabricación de un coche resulta complicado si vemos
  a éste como un todo (un conglomerado de piezas todas juntas).

- Además, desde ese punto de vista sería difícil poder reparar una avería, ya
  que la sustitución de cualquier pieza podría afectar a cualquier otra parte
  del coche, a menudo de formas poco evidentes.

- En cambio, el coche resulta mucho más fácil de entender si lo descomponemos
  en partes, estudiamos cada parte por separado y definimos claramente cómo
  interactúa cada parte con las demás.

---

- Esas partes (que aquí llamamos módulos) son componentes más o menos
  independientes que interactúan con otros componentes de una manera bien
  definida. Por ejemplo:

  - Frenos
  - Luces
  - Climatización
  - Dirección
  - Motor
  - Carrocería

- El objetivo es convertir la programación es una tarea que consista en ir
  fabricando y ensamblando bloques constructivos que tengan sentido por sí
  mismos, que lleven a cabo una función concreta y que, al combinarlos
  adecuadamente, nos dé como resultado el programa que queremos desarrollar.

- Para alcanzar ese objetivo, el concepto de modularidad se puede estudiar a
  nivel *metodológico* y a nivel *práctico*.

---

- **A nivel metodológico**, la modularidad nos proporciona una herramienta más
  para controlar la complejidad, como hace también la _abstracción_ (que, de
  hecho, puede servir como guía para la modularización).

- Todos los mecanismos de control de la complejidad actúan de la misma forma:
  la mente humana es incapaz de mantener la atención en muchas cosas a la vez,
  así que lo que hacemos es centrarnos en una parte del problema y dejamos a un
  lado el resto momentáneamente.

  - La **abstracción** nos permite controlar la complejidad permitiéndonos
    estudiar un problema o su solución por *niveles*, centrándonos en lo
    esencial e ignorando los detalles que a ese nivel resultan innecesarios.

  - Con la **modularidad** buscamos descomponer conceptualmente el programa en
    partes que se puedan estudiar y programar por separado, de forma más o
    menos independiente, lo que se denomina **descomposición lógica**.
      
- Ambos conceptos son combinables, como veremos luego.

---

- **A nivel práctico**, la modularidad nos ofrece una herramienta que nos
  permite partir el código del programa en partes más manejables.

- A medida que los programas se hacen más y más grandes, el esfuerzo de
  mantener todo el código dentro de un único *script* se hace mayor.

- No sólo resulta incómodo mantener todo el código en un mismo archivo,
  sino que además es intelectualmente más difícil de entender.

- Lo más práctico es repartir el código fuente de nuestro programa en una
  colección de archivos fuente que se puedan trabajar por separado, lo que se
  denomina **descomposición física**.

- Esto, además, nos va a permitir que un programa pueda ser desarrollado
  conjuntamente por varias personas al mismo tiempo, cada una de ellas
  responsabilizándose de escribir uno o varios módulos del mismo programa.

- Esos módulos se podrán escribir de forma más o menos independiente aunque,
  por supuesto, estarán relacionados entre sí, ya que unos consumirán los
  servicios que proporcionan otros.

---

- Los módulos contienen **_definiciones internas_** llamadas **miembros**,
  entre las que pueden estar:

  - Subprogramas (funciones y procedimientos).

  - Definiciones de tipos de datos.

  - Variables.

  - Constantes.

  - Otros módulos (submódulos).

- Todos esos elementos internos del módulo son manipulables desde dentro del
  mismo y también pueden estar accesibles desde fuera, disponibles para su uso
  por parte de otros módulos del programa.

- Gracias a sus variables locales, un módulo almacena y recuerda su propio
  **estado interno**, el cual puede cambiar durante la ejecución del programa.

---

- Para que todo esto funcione, los módulos deben introducir su propio **ámbito
  léxico**, deben estar **encapsulados** y deben tener su propio **espacio de
  nombres**:

  - Los módulos introducen su propio **ámbito léxico**, por lo que las
    definiciones que se ejecuten dentro del módulo serán locales a éste.

  - Los módulos están **encapsulados**, lo que hace que sea aún más independiente
    de los demás módulos que forman el programa, ya que un elemento local al
    módulo sólo será visible directamente dentro de éste, y sólo se podrá ver
    desde fuera si se **exporta**.

  - Finalmente, los módulos tienen su propio **espacio de nombres** separado
    del resto, donde se almacenan sus ligaduras locales, es decir, las ligaduras
    creadas dentro de ese módulo.

---

- Así, los elementos locales al módulo pertenecen al propio módulo, y puede
  haber dos elementos distintos con el mismo nombre en diferentes módulos de un
  mismo programa, lo que evita el _name clash_.

- El hecho de que los módulos estén encapsulados facilita la escritura de cada
  módulo por separado y su integración posterior en el mismo programa, ya que
  el programador de un módulo no se tiene que preocupar por si casualmente usó
  el mismo nombre que ha usado otro programador al escribir su módulo.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Los **módulos** son _cápsulas_ que:

  - Permiten seleccionar qué se **exporta** a otros módulos (lo que constituye
    su **_interfaz_**) y qué se **importa** de otros módulos (sus
    **_dependencias_**).

  - Permiten la **descomposición física del código en archivos separados**,
    para que se puedan escribir de forma más o menos independiente unos de
    otros.

  - Representan una **descomposición lógica** del programa.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Un módulo es, pues, una parte de un programa que se puede estudiar, entender
  y programar por separado con relativa independencia del resto del programa.

- Según esa definición, podría pensarse que **un _subprograma_ es un ejemplo de
  _módulo_**.

- Sin embargo, un subprograma es un ejemplo bastante pobre de módulo, ya que,
  según lo que hemos visto hasta ahora:

  - Un subprograma no exporta nada al exterior.

  - Un subprograma no puede usar elementos locales de otros subprogramas.

  - Un subprograma no tiene estado interno que se conserve y recuerde durante
    la ejecución del programa.

  (Si bien en temas posteriores veremos que algunas de estas limitaciones se
  pueden superar con el uso de _clausuras_.)

---

- Además, descomponer un programa en partes usando únicamente como
  criterio la descomposición en subprogramas **no resultaría adecuado en
  general**, ya que:

  - No habría *descomposición física*, salvo que se coloque cada función en un
    archivo separado, lo que resulta poco práctico.

  - En la mayoría de los casos, nos encontramos con varios subprogramas que no
    actúan por separado, sino de forma conjunta entre ellas formando un todo
    interrelacionado.

---

- Por ejemplo, existen lenguajes procedimentales (como C) donde podemos usar y
  crear **bibliotecas de funciones**, que son colecciones agrupadas de
  funciones reutilizables (y, normalmente, ya compiladas) que se pueden invocar
  desde el código de nuestro programa.

- Esas bibliotecas se distribuyen apropiadamente empaquetadas de forma que
  luego se puedan enlazar en tiempo de compilación con el resto de nuestro
  código para formar el programa ejecutable final.

- Pero aunque podamos encapsular varias funciones juntas en una biblioteca, en
  general eso tampoco resulta suficiente para llamar «_módulo_» a ese paquete
  de funciones.

- Al final, lo que es y no es un módulo depende mucho también de las
  construcciones que el lenguaje de programación nos proporciona.

- Por ejemplo, lenguajes como Haskell, OCaml, Turbo Pascal o Modula-2 tienen
  sus módulos, mientras que las «_clases_» de los lenguajes orientados a
  objetos también son muy buenos ejemplos de módulos.

---

- La programación estructurada y la programación procedimental son suficientes
  para la denominada **programación a pequeña escala (_Programming In The
  Small_, _PITS_)**.

- Se trata de programas que un solo programador puede programar y comprender
  fácilmente en su totalidad.

- Sin embargo, no son técnicas o paradigmas lo suficientemente generales ni
  apropiadas como para escribir programas muy grandes.

- Estos programas, escritos por muchas personas, deben constar de módulos que
  puedan desarrollarse y probarse independientemente de otros módulos, en
  paralelo, por varios programadores que se reparten simultáneamente el
  trabajo.

- Este tipo de programación se denomina **programación a gran escala
  (_Programming In The Large_, _PITL_)**.

---

- La programación a gran escala se centra en programas que no son comprensibles
  para una sola persona y que son desarrollados por equipos de programadores.

- En este nivel, los programas deben constar de módulos que puedan escribirse,
  compilarse y probarse independientemente de otros módulos (o lo más posible,
  al menos).

- Para ello, un módulo debe tener un único propósito y una interfaz estrecha
  con otros módulos.

- Además, es conveniente diseñar módulos que sean reutilizables (es decir, que
  puedan incorporarse a muchos programas) y modificables sin forzar cambios en
  otros módulos.

---

- Todo es un camino hacia la obtención de componentes constructivos cada vez
  más grandes y abstractos.

- Por ejemplo, en Python tendríamos (en orden de menor a mayor nivel de
  abstracción y complejidad):

  #. Expresiones y abstracciones lambda.
  #. Sentencias.
  #. Estructuras de control.
  #. Funciones imperativas.
  #. Clases.
  #. Módulos.
  #. Paquetes.

- Cada componente constructivo puede contener, recursivamente, elementos del
  mismo nivel o inferior, pero no de un nivel superior.

- Estos componentes constructivos ayudan a organizar el programa en varios
  niveles de abstracción y complejidad, y nos permiten escribir programas cada
  vez más grandes y complejos porque nos permite aislar y estudiar cada parte y
  cada nivel por separado.

---

- Por ejemplo, supongamos un conjunto de funciones que manipulan números
  racionales.

- Tendríamos funciones para crear racionales, para sumarlos, para
  multiplicarlos, para simplificarlos, etc.

- Todas esas funciones trabajarían conjuntamente, incluso usándose unas a
  otras, y actuarían sobre colecciones de datos que representarían números
  racionales de una forma apropiada.

- Por consiguiente, aunque resulta muy apropiado considerar cada función
  anterior por separado, es más conveniente considerarlas como un todo: el
  *módulo de manipulación de números racionales*.

---

- Otro ejemplo: supongamos un módulo encargado de realizar operaciones
  trigonométricas sobre ángulos.

- Esos ángulos serían números reales que podrían representar grados o radianes.

- Ese módulo contendría las funciones encargadas de calcular el seno, coseno,
  tangente, etc. de un ángulo pasado como parámetro a cada función.

- Para ello, el módulo podría contener un dato (almacenado en una variable
  dentro del módulo) que indicará si las funciones anteriores deben interpretar
  los ángulos como grados o como radianes.

- Ese dato constituiría el estado interno del módulo, al ser un valor que se
  almacena dentro del mismo módulo (pertenece a éste) y puede cambiar su
  comportamiento dependiendo del valor que tenga el dato.

- Además, probablemente también necesite conocer el valor de $\pi$, que podría
  almacenar el módulo internamente como una constante.

---

- En un hipotético programa que usara los dos módulos anteriores (de números
  racionales y de ángulos), ambos serían independientes y estarían separados en
  archivos distintos, lo que tendría estas ventajas, entre otras:

  - Es **más fácil localizar y corregir un fallo** del programa. Por ejemplo,
    si se encuentra un fallo en las operaciones con números racionales, sería
    más fácil localizarlo, ya que el principal sospechoso sería el módulo de
    los números racionales.

  - Cada módulo se podría **programar y poner a punto por separado**, incluso
    al mismo tiempo si ponemos a trabajar en cada uno a equipos distintos de
    programadores.

  - El desarrollo del resto del programa también podría ir **en paralelo** al
    de estos dos módulos, por las mismas razones, lo que reduce el tiempo de
    desarrollo.

---

- De lo dicho hasta ahora se deducen varias **conclusiones importantes**:

  - Un módulo es **una _parte_ de un programa**.

  - Los módulos nos permiten descomponer el programa en **partes más o menos
    independientes y manejables por separado**.

  - Una **función** cumple con la definición de «módulo» pero, en general, **en
    la práctica no es una buena candidata** para ser considerada un módulo por
    sí sola.

  - Los módulos, contienen colecciones de **funciones interrelacionadas** y
    otros posibles elementos, como **datos** en forma de **constantes y
    variables** manipulables desde el interior del módulo y (posiblemente)
    también desde el exterior del mismo.

  - Las variables del módulo constituyen el **estado interno** del módulo.

  - Se puede controlar qué elementos se **_exportan_** al exterior del módulo,
    y qué elementos se **_importan_** de otros módulos.

  - En la práctica, los módulos se programan físicamente en **archivos
    separados** del resto del programa.

## Beneficios de la programación modular

- **El tiempo de desarrollo se reduce** porque grupos separados de
  programadores pueden trabajar cada uno en un módulo distinto al mismo tiempo
  con poca necesidad de comunicación entre ellos.

- Se **mejora la fiabilidad y robustez** del producto resultante, porque los
  cambios realizados en un módulo no afectarían demasiado a los demás.

- **Comprensibilidad**, porque se puede entender mejor el sistema completo
  cuando se puede estudiar módulo a módulo en lugar de tener que estudiarlo
  todo a la vez.

- **Reusabilidad**, porque facilita el que un módulo de un programa pueda ser
  aprovechado (con poca o ninguna alteración) en otros programas.

- En lenguajes compilados, la descomposición física del código del programa en
  varios archivos permite la **compilación por separado**, lo que acelera
  significativamente la compilación de programas grandes cuando hay cambios en
  pocos módulos (los módulos que no han cambiado y que ya están compilados no
  necesitan una recompilación).

# Diseño modular

## Creadores y usuarios

- Desde la perspectiva de la programación modular, **un programa está formado
  por una colección de módulos que interactúan entre sí**.

- Puede decirse que un módulo proporciona una serie de **_servicios_** que son
  *usados* o **_consumidos_** por otros módulos del programa.

- Así que podemos estudiar el diseño de un módulo desde **dos puntos de vista
  complementarios**:

  - El **creador** o **implementador** del módulo es la persona encargada de la
    programación del mismo y, por tanto, debe conocer todos los detalles
    internos del módulo, necesarios para que éste funcione. Esos detalles
    internos constituyen la **implementación** del módulo.

  - Los **usuarios** del módulo son los programadores que desean usar ese
    módulo en sus programas. También se les llama así a los módulos que usan a
    ese módulo (lo necesitan para funcionar) en un programa.
  
    A la parte del módulo que es accesible directamente desde fuera del mismo
    se le denomina la **interfaz** del módulo.

---

- Decimos que los módulos **_exportan_ su interfaz** al resto de los módulos.

- Por otra parte, un módulo puede hacer uso de otros módulos (que se denominan
  sus **dependencias**) y para ello debe **importarlos** previamente.

- En terminología de programación modular, hablamos entonces de la existencia
  de dos tipos de módulos:

  - El que usa a otro módulo es el módulo «_usuario_», «_cliente_»,
    «_consumidor_» o «_importador_».

  - El que es usado por otro módulo es el módulo «_usado_», «_servidor_»,
    «_consumido_» o «_importado_».

- Cuando el _módulo usuario_ importa al _módulo importado_, tiene acceso a los
  elementos exportados por este último a través de su interfaz, lo que le
  permite consumir los servicios que ese módulo importado proporciona.

---

- Los **usuarios** de un módulo están interesados en usar dicho módulo como una
  **entidad abstracta**, sin necesidad de conocer los _detalles internos_ del
  mismo, sino conociendo sólo lo necesario para poder consumir los servicios
  que proporciona (es decir, su _interfaz_).

- Esos usuarios consumirán los servicios del módulo a través de su interfaz, la
  cual oculta a los usuarios los detalles internos de funcionamiento que no es
  necesario conocer para usar el módulo.

- Esos detalles internos forman la _implementación_ del módulo y sólo son
  interesantes para (y sólo deben ser conocidos por) el **creador** del módulo.

- Por tanto, nos interesa que los módulos actúen como **cajas negras**.

- Por supuesto, un módulo puede usar a otros módulos y ser usado por otros
  módulos, todo al mismo tiempo. Por tanto, el mismo módulo puede ser
  importador e importado simultáneamente.

---

- Los **miembros** o _elementos_ de un módulo son aquellos elementos que forman
  parte del módulo.

- En general, a la hora de describir las partes de un módulo, distinguimos
  entre **miembros _públicos_** y **miembros _privados_**:

  - Los **miembros _públicos_** o **_exportados_** de un módulo son aquellos
    miembros que están diseñados para ser usados fuera del módulo por los
    usuarios del mismo.

    Estos miembros (al menos, las especificaciones de los mismos, es decir, lo
    necesario para poder usarlos) **deben formar parte de la _interfaz_ del
    módulo**.

  - Los **miembros _privados_** o **_internos_** de un módulo son aquellos
    miembros que están diseñados para ser usados únicamente por el propio
    módulo y, por tanto, no deberían ser usados (ni siquiera conocidos) fuera
    del módulo.

    Estos miembros **NO deben formar parte de la _interfaz_ del módulo**, sino
    que deben ir en la **implementación** del módulo.

## Partes de un módulo

- Concretando lo dicho anteriormente, un módulo tendrá:

  - Una **interfaz**, formada por:

    - El **nombre** del módulo.
    - Las **signaturas de sus funciones _exportadas_** o **_públicas_** que
      permiten a los usuarios consumir sus servicios, así como manipular y
      acceder al estado interno del módulo desde fuera del mismo.
    - Es posible que la interfaz también incluya otros elementos, como
      **constantes públicas**.

  - Una **implementación**, formada por:

    - Las **implementaciones** de sus **funciones públicas**.
    - Posibles **variables _locales_** al módulo (el _estado interno_ de éste).
    - Posibles **funciones _internas_** o **_privadas_**, que no aparecen en la
      interfaz porque están pensadas para ser usadas sólo por el propio módulo
      internamente, no por otras partes del programa.
    - Otros miembros públicos o privados, como **constantes**, etc.

---

- Lo anterior es una simplificación, ya que, dependiendo de las características
  del lenguaje de programación utilizado, un módulo puede tener miembros
  pertenecientes a muchas otras categorías sintácticas, como por ejemplo:

  - Tipos.

  - Clases.

  - Otros módulos.

- Todos esos miembros pueden formar parte de la interfaz o de la implementación
  del módulo, dependiendo de las necesidades del mismo, y ser, por tanto,
  miembros públicos o privados de éste.

- También se admiten otras combinaciones más complicadas. Por ejemplo, si
  alguno de esos miembros es público, su especificación podría formar parte de
  la interfaz del módulo, mientras que su implementación podría formar parte de
  la implementación del módulo.

### Interfaz

- La **interfaz** es la parte del módulo que es accesible directamente desde
  fuera del mismo.

- Por tanto, es la parte a través de la cual el módulo ofrece sus servicios a
  sus usuarios, que sólo podrán acceder al mismo a través de su interfaz.

- Es la parte **expuesta, pública o visible** del mismo.

- También se la denomina su **API** (*Application Program Interface*).

- La interfaz es la parte del módulo que éste **exporta** a los demás módulos
  del programa, que son sus posibles usuarios.

- En general **debería estar formada únicamente por funciones** (y, tal vez,
  **constantes**) que el usuario del módulo pueda llamar para consumir los
  servicios que ofrece el módulo.

- No todas las funciones definidas en un módulo tienen por qué formar parte de
  la interfaz del mismo. Las que sí lo hacen son las denominadas **funciones
  públicas** o **exportadas**.

#### Especificación

- La interfaz es un concepto puramente **sintáctico**.

- Describe la sintaxis (nombre y tipos) de los elementos del módulo a los que
  se puede acceder desde fuera del mismo.

- Pero sólo con eso, el usuario no tiene toda la información que necesita para
  poder usar el módulo.

- Para ello, también necesita saber _qué_ hace el módulo, y _qué_ hacen las
  funciones que forman la interfaz del módulo.

- La **especificación** del módulo representa toda la información que el
  usuario del mismo necesita conocer para poder utilizarlo.

---

- La especificación de un módulo está formada por:

  - La **interfaz** del módulo.

  - La **especificación** de todas las funciones que aparecen en la interfaz.

  - **Documentación** adicional que describa lo que hace el módulo y que aporte
    al usuario cualquier información extra que necesite saber para poder usar
    el módulo sin tener que conocer o acceder a partes internas del mismo.

    Aquí podría incluirse documentación sobre el módulo en sí, así como sobre
    las funciones y las constantes públicas que aparecen en la interfaz,
    escrita en lenguaje natural y de fácil comprensión para el lector humano,
    añadiendo posibles ejemplos de uso.

---

- Desde el punto de vista de los usuarios del módulo, las funciones son
  **abstracciones funcionales**, de forma que, para poder usarlas, sólo se
  necesita conocer las **especificaciones** de esas funciones y no sus
  *implementaciones* concretas (sus definiciones completas).

- Recordemos que la **especificación de una función** está formada por tres
  partes:

  - **Precondición**: la condición que se debe cumplir al llamar a la función.

  - **Signatura**: los aspectos meramente sintácticos como el nombre de la
    función, el nombre y tipo de sus parámetros y el tipo de su valor de
    retorno.

  - **Postcondición**: la condición que se cumplirá al finalizar su ejecución.

- Por tanto, la especificación del módulo contendrá las especificaciones de las
  funciones públicas, pero no sus implementaciones.

---

- Acabamos de decir que la interfaz de un módulo debería estar formada
  únicamente por **funciones** y, tal vez, **constantes**.

- En teoría, la interfaz podría incluir también algunas o todas las **variables
  locales al módulo**, de forma que el módulo usuario podría acceder y
  modificar directamente una variable del módulo usado.

- Sin embargo, en la práctica eso no resulta apropiado, ya que:

  - Cambiar el valor de una variable local a un módulo equivale a modificar una
    variable global (ya que existen en el ámbito global del módulo) y, por
    tanto, se considera un efecto lateral.

  - Cualquier cambio posterior en la representación interna de los datos
    almacenados en esas variables afectaría al resto de los módulos que acceden
    a dichas variables.

- Las constantes sí se admiten ya que nunca cambian su valor y, por tanto,
  están exentas de posibles efectos laterales.

- Más adelante estudiaremos este aspecto en profundidad cuando hablemos del
  **principio de ocultación de información**.
  
### Implementación

- La **implementación** es la parte del módulo que queda **oculta a los
  usuarios** del mismo.

- Por tanto, es la parte que los usuarios del módulo no necesitan (ni deben)
  conocer para poder usarlo adecuadamente.

- Está formada por:

  - La **implementación de las funciones** que forman la interfaz.

  - Todas las **variables locales al módulo** que almacenan su estado interno,
    si las hay.

  - Las funciones que utiliza el propio módulo internamente y que no forman
    parte de su interfaz (**funciones _internas_** o **_privadas_**), si las
    hay.

  - Posibles **constantes _privadas_**, usadas sólo por el propio módulo.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
La implementación debe poder cambiarse tantas veces como sea necesario sin que
por ello se tenga que cambiar el resto del programa.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Resumen

$$\text{Interfaz del módulo}\begin{cases}
\text{Nombre del módulo}\\
\text{Signatura de las funciones públicas}\\
\text{Posibles constantes públicas}
\end{cases}$$

$$\text{Especificación del módulo}\begin{cases}
\text{Interfaz del módulo}\\
\text{Especificación de las funciones de la interfaz}\\
\text{Documentación adicional}
\end{cases}$$

$$\text{Implementación del módulo}\begin{cases}
\text{Implementación de las funciones públicas}\\
\text{Posibles variables locales}\\
\text{Posibles funciones privadas} \\
\text{Posibles constantes privadas}
\end{cases}$$

<!--
---

- O, visto de otra forma, incluyendo la _interfaz_ como parte de la
  _especificación_ del módulo:

$$\text{Especificación del módulo}\begin{cases}
\text{Interfaz del módulo}\begin{cases}
\text{Nombre del módulo}\\
\text{Signatura de las funciones públicas}\\
\text{Posibles constantes públicas}
\end{cases}\\
\text{Especificación de las funciones de la interfaz}\\
\text{Documentación adicional}
\end{cases}$$

$$\text{Implementación del módulo}\begin{cases}
\text{Implementación de las funciones públicas}\\
\text{Posibles variables locales}\\
\text{Posibles funciones privadas} \\
\text{Posibles constantes privadas}
\end{cases}$$
-->

## Diagramas de estructura

- Los diferentes módulos que forman un programa y la relación que hay entre
  ellos se puede representar gráficamente mediante un _diagrama de
  descomposición modular_ o **diagrama de estructura**.

- En el diagrama de estructura, cada módulo se representa mediante un
  rectángulo y las relaciones entre cada par de módulos se dibujan como una
  línea con punta de flecha entre los dos módulos.

- Una flecha dirigida del módulo _A_ al módulo _B_ representa que el módulo _A_
  _utiliza_ (o _llama_ o _consume_) al módulo _B_, o también se puede decir que
  el módulo _A_ _depende_ del módulo _B_.

!DOT(modulos-dependientes.svg)(*A* depende de *B*)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A -> B
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

:::: columns

::: column

!DOT(diagrama-estructura.svg)(Diagrama de estructura)(width=80%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = TB
A -> B
A -> C
B -> D
B -> E
B -> F
C -> F
E -> G
F -> G
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Al módulo *A* se le denomina **módulo principal**, ya que es el módulo por el
  que comienza la ejecución del programa.

- El módulo principal depende, directa o indirectamente, de los demás módulos
  del programa.

- No hay ningún módulo que dependa del módulo principal.

:::

::::

# Programación modular en Python

## *Scripts*!ifdef(HTML)(&nbsp;)() como módulos

- En Python, un módulo es otra forma de llamar a un *script*. Es decir:
  «módulo» y «*script*» son sinónimos en Python.

- Los módulos contienen instrucciones: definiciones y otras sentencias.

- El nombre del archivo es el nombre del módulo con extensión `.py`.

- Eso quiere decir que **un módulo se puede ejecutar de dos maneras**:

  - **Como un _script_ independiente**, llamándolo desde la línea de órdenes
    del sistema operativo (sería el **_módulo principal_**):

    ```console
    $ python modulo.py
    ```

  - **Importándolo dentro de otros módulos** que quieran usar los servicios que
    proporciona, usando la sentencia !PYTHON{import} (o
    !PYTHON{from ... import}):

    ```python
    import modulo
    ```

---

- Las sentencias que contiene un módulo **se ejecutan sólo la primera vez** que
  se encuentra el nombre de ese módulo en una sentencia !PYTHON(import), o bien
  cuando el archivo se ejecuta como un *script*.

- Dentro de un módulo, el nombre del módulo (como cadena) se encuentra
  almacenado en la variable global !PYTHON(__name__).

- Cada módulo determina su propio **ámbito local**, que es usado como el
  **ámbito global** de todas las instrucciones que componen el módulo.

- Además, los módulos son **espacios de nombres**.

- Por tanto, el autor de un módulo puede definir variables globales o funciones
  en el módulo sin preocuparse de posibles colisiones accidentales con las
  variables globales o funciones de otros módulos.

- Esas variables y funciones serán los **atributos** del **objeto _módulo_**
  que se creará si se importa el módulo con la sentencia !PYTHON(import).

---

- Al entrar en un módulo para ejecutar sus sentencias, se entra en un nuevo
  ámbito que constituirá **el ámbito global del módulo**.

- Además, se creará un nuevo marco encima de la pila, que constituirá **el
  nuevo _marco global_ durante la ejecución del módulo**.

- Los demás marcos que pudieran existir antes de ejecutar el módulo (por
  ejemplo, el marco global del _script_ que ha importado el módulo) seguirán
  más abajo en la pila, pero no serán accesibles desde el módulo actual.

  Esos marcos quedan fuera del entorno y se recuperarán al finalizar la
  ejecución del módulo importado.

- Igualmente, los ámbitos que existieran antes de importar un módulo
  (incluyendo el ámbito global del _script_ que ha importado al módulo) quedan
  temporalmente invalidados al encontrarse en archivos fuente distintos, y se
  recuperarán al finalizar la ejecución del módulo y volver al archivo fuente
  anterior.

### *Docstrings*

- Al igual que ocurre con las funciones imperativas, los módulos también
  pueden llevar su **cadena de documentación (_docstring_)**.

- La cadena de documentación es un literal de tipo cadena que aparece como
  primera sentencia del módulo, y que tiene la finalidad de documentar el
  mismo.

- Recordemos que, por convenio, las _docstrings_ siempre se delimitan mediante
  triples comillas (!PYTHON(""")).

- La función !PYTHON(help) (que se usa sobre todo en sesiones interactivas)
  muestran la _docstring_ del objeto para el que se solicita la ayuda.

- Internamente, la _docstring_ se almacena en el atributo !PYTHON(__doc__) del
  módulo.

!EJEMPLO

```python
"""Módulo de ejemplo (ejemplo.py)."""

def saluda(nombre):
    """Devuelve un saludo.

    Args:
        nombre (str): El nombre de la persona a la que saluda.

    Returns:
        str: El saludo.
    """
    return "¡Hola, " + nombre + "!"
```

- Existen dos formas distintas de _docstrings_:

  - **De una sola línea (_one-line_):** para casos muy obvios que necesiten
    poca explicación.

  - **De varias líneas (_multi-line_):** para casos donde se necesita una
    explicación más detallada.

---

```python
>>> import ejemplo
>>> help(ejemplo)
Help on module ejemplo:

NAME
    ejemplo - Módulo de ejemplo (ejemplo.py).

FUNCTIONS
    saluda(nombre)
        Devuelve un saludo.

        Args:
            nombre (str): El nombre de la persona a la que saluda.

        Returns:
            str: El saludo.

FILE
    /home/ricardo/python/ejemplo.py

>>> help(ejemplo.saluda)
Help on function saluda in module ejemplo:

saluda(nombre)
    Devuelve un saludo.

    Args:
        nombre (str): El nombre de la persona a la que saluda.

    Returns:
        str: El saludo.
```

---

- Lo que hace básicamente la función !PYTHON{help(}_objeto_!PYTHON{)} es
  acceder al contenido del atributo !PYTHON(__doc__) del objeto y mostrarlo de
  forma legible.

- Siempre podemos acceder directamente al atributo !PYTHON(__doc__) para
  recuperar la _docstring_ original usando _objeto_!PYTHON(.__doc__):

  ```python
  >>> import ejemplo
  >>> print(ejemplo.__doc__)
  Módulo de ejemplo (ejemplo.py).
  >>> print(ejemplo.saluda.__doc__)
  Devuelve un saludo.

      Args:
          nombre (str): El nombre de la persona a la que saluda.

      Returns:
          str: El saludo.

  ```

- Esta información también es usada por otras herramientas de documentación
  externa, como `pydoc`.

## Importación de módulos

- Para que un módulo pueda usar a otros módulos tiene que **importarlos**
  usando la orden !PYTHON(import). Por ejemplo, la siguiente sentencia importa
  el módulo !PYTHON(math) dentro del ámbito actual:

  ```python
  import math
  ```

- Al importar un módulo de esta forma, se incorpora al espacio de nombres
  actual (que suele ser el marco del _script_ o función que se está ejecutando
  actualmente) la ligadura entre el nombre del módulo importado y el propio
  módulo, el cual es **es un objeto de tipo !PYTHON(module)**.

- De esta forma, lo que se importa dentro del espacio de nombres actual es una
  **referencia** al objeto módulo.

- Se recomienda por regla de estilo (aunque no es obligatorio) colocar todas
  las sentencias !PYTHON(import) al principio del módulo importador.

---

- Por ejemplo, si tenemos los siguientes _scripts_ (o módulos, que es lo mismo
  en Python) `uno.py` y `dos.py`, y empezamos a ejecutar `uno.py`:

  :::: columns

  ::: {.column width=45%}

  ```{.python .number-lines}
  # uno.py

  x = 7

  import dos

  a = 4
  b = 3
  ```

  :::

  ::: {.column width=5%}

  :::

  ::: {.column width=45%}

  ```python
  # dos.py

  x = 9
  y = 5
  ```

  :::

  ::::

  !SALTOBEAMER

- Al ejecutar la línea 3 tendremos el siguiente entorno:

!DOT(import-modulo-entorno-linea3.svg)(Entorno en la línea 3 del módulo `uno`)(width=50%)(width=45%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
7 [shape = circle]
subgraph cluster0 {
    label = <Marco global de <font face="monospace">uno</font>>
    bgcolor = "white"
    x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
}
x:f1 -> 7
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Al ejecutar !PYTHON(import dos) en la línea 5 de `uno.py`, pasaremos a
  ejecutar el _script_ `dos.py` y el marco global del entorno será ahora el
  marco global de `dos`. Los marcos creados hasta ahora durante la ejecución de
  `uno` (incluyendo el marco global de `uno`) no estarán en el entorno:

!DOT(import-modulo-dentro-dos.svg)(Ejecución de `dos` durante su importación en `uno`)(width=60%)(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
7 [shape = circle]
5 [shape = circle]
9 [shape = circle]
x:f1 -> 7
subgraph cluster0 {
    label = <Marco global de <font face="monospace">dos</font>>
    bgcolor = "white"
    xl [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
    y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
}
subgraph cluster1 {
    label = <Marco global de <font face="monospace">uno</font>>
    bgcolor = white
    x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
}
xl:f1 -> 9
y:f1 -> 5
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> xl [lhead = cluster0]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Al finalizar la ejecución del _script_ `dos.py`, el marco global de `dos` se
  convierte en un objeto de tipo !PYTHON(module) en el montículo, y sus
  ligaduras se convierten en atributos del objeto. Ese objeto se ligará al
  identificador `dos` en el marco global de `uno`, que volverá a estar en el
  entorno y pasará a ser de nuevo el marco global del entorno:

!DOT(import-modulo-sale-dos.svg)(Entorno tras ejecutar `import dos`)(width=70%)(width=65%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
7 [shape = circle]
5 [shape = circle]
9 [shape = circle]
x:f1 -> 7
dos [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>dos|<f1>⬤}"]
subgraph cluster0 {
    style = rounded
    label = <Módulo <font face="monospace">dos</font>>
    bgcolor = "white"
    xl [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
    y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
}
subgraph cluster1 {
    label = <Marco global de <font face="monospace">uno</font>>
    bgcolor = white
    x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
    dos:f1 -> xl [lhead = cluster0, minlen = 2]
}
xl:f1 -> 9
y:f1 -> 5
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Finalmente, tras ejecutar todo el script `uno.py` tendríamos el siguiente
  entorno:

!DOT(import-modulo-sigue-uno.svg)(Entorno justo al final de la ejecución de `uno`)(width=70%)(width=65%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
7 [shape = circle]
5 [shape = circle]
9 [shape = circle]
x:f1 -> 7
dos [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>dos|<f1>⬤}"]
subgraph cluster0 {
    style = rounded
    label = <Módulo <font face="monospace">dos</font>>
    bgcolor = "white"
    xl [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
    y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
}
subgraph cluster1 {
    label = <Marco global de <font face="monospace">uno</font>>
    bgcolor = white
    x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
    a [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>a|<f1>⬤}"]
    b [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>b|<f1>⬤}"]
    dos:f1 -> xl [lhead = cluster0, minlen = 2]
}
xl:f1 -> 9
y:f1 -> 5
4 [shape = circle]
3 [shape = circle]
a:f1:e -> 4
b:f1 -> 3
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> x [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Recordemos que, siempre que tengamos una referencia a un objeto, podemos
  acceder a los atributos que contiene usando el operador punto (`.`),
  indicando el objeto y el nombre del atributo al que queramos acceder:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  *objeto*`.`*atributo*
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto, para acceder al contenido del módulo importado, indicaremos el
  nombre de ese módulo seguido de un punto (`.`) y el nombre del contenido al
  que queramos acceder:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~
  *módulo*`.`*contenido*
  ~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por ejemplo, para acceder a la función !PYTHON(gcd) definida en el módulo
  !PYTHON(math), haremos:

  ```python
  import math

  x = math.gcd(16, 6)
  ```

!DOT(import-math.svg)(Entorno tras ejecutar las dos sentencias anteriores)(width=75%)(width=75%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
gcd [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>gcd|<f1>⬤}"]
math [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>math|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
2 [shape = circle]
subgraph cluster2 {
    label = "Montículo"
    style = rounded
    bgcolor = "grey95"
    lambda [shape = circle, label = "λ"]
    subgraph cluster0 {
        label = <Módulo <font face="monospace">math</font>>
        style = rounded
        bgcolor = "white"
        gcd
        m [shape = plaintext, fillcolor = transparent, label="(más definiciones...)"]
    }
    2
}
subgraph cluster1 {
    label = "Marco global del script"
    bgcolor = white
    math:f1 -> gcd [lhead = cluster0, minlen = 2]
    x
}
x:f1 -> 2
gcd:f1 -> lambda
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> math [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Se puede importar un módulo dándole otro nombre dentro del espacio de nombres
  actual, usando la sentencia !PYTHON(import ... as).

- Por ejemplo:

  ```python
  import math as mates
  ```

  La sentencia anterior importa el módulo `math` dentro del espacio de nombres
  actual pero con el nombre `mates` en lugar del `math` original. Por tanto,
  para usar la función `gcd` del ejemplo anterior, haremos:

  ```python
  x = mates.gcd(16, 6)
  ```

!DOT(import-math-as.svg)(Resultado de ejecutar las dos líneas anteriores)(width=70%)(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
gcd [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>gcd|<f1>⬤}"]
mates [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>mates|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
2 [shape = circle]
subgraph cluster2 {
    label = "Montículo"
    style = rounded
    bgcolor = "grey95"
    lambda [shape = circle, label = "λ"]
    2
    subgraph cluster0 {
        style = rounded
        label = <Módulo <font face="monospace">mates</font>>
        bgcolor = "white"
        gcd
        m [shape = plaintext, fillcolor = transparent, label="(más definiciones...)"]
    }
}
subgraph cluster1 {
    label = "Marco global del script"
    bgcolor = white
    mates:f1 -> gcd [lhead = cluster0, minlen = 2]
    x
}
x:f1 -> 2
gcd:f1 -> lambda
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> mates [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Existe una variante de la sentencia !PYTHON(import) que nos permite importar
  directamente las definiciones de un módulo en lugar del propio módulo. Para
  ello, se usa la orden !PYTHON(from).
  
- Por ejemplo, para importar sólo la función `gcd` del módulo `math`, y no el
  módulo en sí, haremos:

  ```python
  from math import gcd
  ```

- Por lo que ahora podemos usar la función `gcd` directamente, sin necesidad de
  indicar el nombre del módulo importado:

  ```python
  x = gcd(16, 6)
  ```

!DOT(from-math-import-gcd.svg)(Resultado de ejecutar las dos líneas anteriores)(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
gcd [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>gcd|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
2 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster1 {
    label = "Marco global del script"
    bgcolor = white
    gcd
    x
}
x:f1 -> 2
gcd:f1 -> lambda
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> gcd [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- De hecho, ahora el módulo importado no está definido en el módulo importador.

  Ees decir: ahora en el marco global del módulo importador no hay ninguna
  ligadura con el nombre del módulo importado.

- En nuestro ejemplo, eso significa que el módulo `math` no existe ahora como
  tal en el módulo importador y, por tanto, ese nombre no está definido en el
  ámbito del módulo importador.

- En consecuencia, si hacemos:

  ```python
  x = math  # error
  ```

  da error, porque no hemos importado el módulo como tal, sino sólo una de sus
  funciones.

---

- También podemos usar la palabra clave !PYTHON(as) con la orden !PYTHON(from):

  ```python
  from math import gcd as mcd
  ```

  De esta forma, se importa en el módulo actual la función `gcd` del módulo
  `math` pero llamándola `mcd`.
  
- Por tanto, para usarla la invocaremos con su nuevo nombre:

  ```python
  x = mcd(16, 6)
  ```

!DOT(from-math-import-gcd-as-mcd.svg)(Resultado de ejecutar las dos líneas anteriores)(width=50%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
mcd [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = false, label = "{<f0>mcd|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
2 [shape = circle]
lambda [shape = circle, label = "λ"]
subgraph cluster1 {
    label = "Marco global del script"
    bgcolor = white
    mcd
    x
}
mcd:f1 -> lambda
x:f1 -> 2
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> mcd [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Existe incluso una variante para importar todas las definiciones de un
  módulo:

  ```python
  from math import *
  ```

- Con esta sintaxis importaremos todas las definiciones del módulo excepto
  aquellas cuyo nombre comience por un guión bajo (`_`).
  
  Las definiciones con nombres que comienzan por `_` son consideradas
  **privadas** o internas al módulo, lo que significa que no están concebidas
  para ser usadas por los usuarios del módulo y que, por tanto, no forman parte
  de su **interfaz** (no deben usarse _fuera_ del módulo).
  
- En general, los programadores no suelen usar esta funcionalidad ya que puede
  introducir todo un conjunto de definiciones desconocidas dentro del módulo
  importador, lo que incluso puede provocar que se «*machaquen*» sin control
  definiciones ya existentes.

---

- Para saber qué definiciones (públicas o privadas) contiene un módulo, se
  puede usar la funcion !PYTHON(dir):

  ```python
  >>> import math
  >>> dir(math)
  ['__doc__', '__loader__', '__name__', '__package__', '__spec__', 'acos',
  'acosh', 'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign',
  'cos', 'cosh', 'degrees', 'e', 'erf', 'erfc', 'exp', 'expm1', 'fabs',
  'factorial', 'floor', 'fmod', 'frexp', 'fsum', 'gamma', 'gcd', 'hypot',
  'inf', 'isclose', 'isfinite', 'isinf', 'isnan', 'ldexp', 'lgamma', 'log',
  'log10', 'log1p', 'log2', 'modf', 'nan', 'pi', 'pow', 'radians', 'sin',
  'sinh', 'sqrt', 'tan', 'tanh', 'tau', 'trunc']
  ```

- La función !PYTHON(dir) puede usarse con cualquier objeto al que podamos
  acceder a través de una referencia.

## Módulos como *scripts*

- Cuando se ejecuta un módulo Python desde la línea de órdenes como:

  ```console
  $ python3 fact.py <argumentos>
  ```

  se ejecutará el módulo como un *script*, igual que si se hubiera importado
  con un !PYTHON(import) dentro de otro módulo, pero con la diferencia de que
  la variable global !PYTHON(__name__) contendrá el valor !PYTHON("__main__").

  Eso indica que ese _script_ se considera el **módulo principal** (en inglés,
  _main module_) del programa.

- Por eso, si se añade este código al final del módulo:

  ```python
  if __name__ == "__main__":
      # <sentencias>
  ```

  esas sentencias se ejecutarán únicamente cuando el módulo se ejecute como el
  módulo principal del programa.

---

- Por ejemplo, supongamos el siguiente módulo `fact.py`:

  ```python
  def fac(n):
      if n == 0:
          return 1
      else:
          return n * fac(n - 1)
  
  if __name__ == "__main__":
      import sys
      print(fac(int(sys.argv[1])))
  ```

- Este módulo se podrá usar como un *script* separado o como un módulo que se
  puede importar dentro de otro.

- Si se usa como *script*, podremos llamarlo desde la línea de órdenes del
  sistema operativo:

  ```console
  $ python3 fac.py 4
  24
  ```

- Y si importamos el módulo dentro de otro, la condición del último !PYTHON(if)
  no se cumplirá, por lo que su único efecto será el de incorporar la
  definición de la función `fac` dentro del módulo importador.

## La librería estándar

- La **librería estándar (o _biblioteca estándar_) de Python** contiene módulos
  predefinidos que proporcionan:

  - Acceso a funcionalidades del sistema, como operaciones de E/S sobre
    archivos.

  - Soluciones estandarizadas a muchos de los problemas que los programadores
    pueden encontrarse en su día a día.

- Algunos módulos están diseñados explícitamente para promover y mejorar la
  portabilidad de los programas Python abstrayendo los aspectos específicos de
  cada plataforma a través de un API independiente de la plataforma.

---

- La documentación contiene la información más completa sobre el contenido de
  la librería estándar, a la que podemos acceder a través de la siguiente
  dirección:

[https://docs.python.org/3/library/index.html](https://docs.python.org/3/library/index.html)

- En esa dirección, además, se incluye información sobre:

  - Funciones, constantes, excepciones y tipos predefinidos, que también forman
    parte de la librería estándar.

  - Componentes opcionales que habitualmente podemos encontrar en cualquier
    instalación de Python.

## Paquetes

- Los **paquetes** son una forma de estructurar el espacio de nombres de
  módulos de Python usando _nombres de módulo con puntos_.

- Por ejemplo, el nombre del módulo `A.B` representa el submódulo `B` en un
  paquete llamado `A`.

- Así como el uso de módulos evita el _name clash_ entre los miembros de
  diferentes módulos escritos por diferentes creadores, los nombres de módulos
  con puntos evita el _name clash_ entre los nombres de los propios módulos.

- Es decir, nos permite tener varios módulos con el mismo nombre, siempre que
  estén en paquetes distintos.

- Esto evita que los creadores de módulos se tengan que preocupar por los
  nombres de los módulos creados por otros creadores.

---

- En Python, un **_paquete_** es una unidad de organización del código que
  agrupa módulos relacionados bajo un mismo espacio de nombres.

- Dicho de forma resumida, un paquete es un directorio que contiene módulos
  Python y que puede importarse.

- Más concretamente, un paquete es un directorio que Python reconoce como
  importable y que:

  - Contiene uno o más módulos (archivos `.py`).

  - Puede contener _subpaquetes_.

  - Define un espacio de nombres jerárquico.

  - Puede contener un archivo de inicialización y control del paquete llamado
    `__init__.py`.

---

- Ideas clave:

  | Concepto   | Qué es                    |
  | ---------- | ------------------------- |
  | Módulo     | Un archivo `.py`          |
  | Paquete    | Un directorio de módulos  |
  | Subpaquete | Un paquete dentro de otro |

  !SALTO

- Ejemplo conceptual:

  ```python
  xml                    # paquete
  xml.etree              # subpaquete
  xml.etree.ElementTree  # módulo
  ```

---

- Por ejemplo, supongamos la siguiente estructura de archivos y directorios:

    ```
    sonido/                         <-- Paquete de nivel superior
          __init__.py               <-- Inicializa el paquete sonido
          utilidades.py             <-- Módulo utilidades del paquete sonido
          formatos/                 <-- Subpaquete de conversión entre formatos
                  __init__.py       <-- Inicializa el subpaquete formatos
                  wavread.py        <-- Módulo wavread del subpaquete formatos
                  wavwrite.py       <-- Módulo wavwrite del subpaquete formatos
                  aiffread.py       <-- Módulo aiffread del subpaquete formatos
                  aiffwrite.py      <-- Módulo aiffwrite del subpaquete formatos
                  auread.py         <-- Módulo auread del subpaquete formatos
                  auwrite.py        <-- Módulo auwrite del subpaquete formatos
                  ...
          efectos/                  <-- Subpaquete de efectos de sonido
                  __init__.py       <-- Inicializa el subpaquete efectos
                  echo.py           <-- Módulo echo del subpaquete efectos
                  surround.py       <-- Módulo surround del subpaquete efectos 
                  reverse.py        <-- Módulo reverse del subpaquete efectos
                  ...
          filtros/                  <-- Subpaquete de filtros
                  __init__.py       <-- Inicializa el subpaquete filtros
                  equalizer.py      <-- Módulo equalizer del subpaquete filtros
                  vocoder.py        <-- Módulo vocoder del subpaquete filtros
                  karaoke.py        <-- Módulo karaoke del subpaquete filtros
                  ...
    ```

---

- Los usuarios del paquete pueden importar módulos individuales del mismo.

- Por ejemplo, la siguiente sentencia:

  ```python
  import sonido.efectos.echo
  ```

  importa el módulo `sonido.efectos.echo`, es decir, el módulo `echo` del
  subpaquete `efectos` del paquete `sonido`.

- Para usarlo, debe hacerse referencia al mismo con el nombre completo (también
  llamado _nombre totalmente cualificado_):

  ```python
  sonido.efectos.echo.echofilter(input, output, delay=0.7, atten=4)
  ```

---

- Otra alternativa para importar el módulo es:

  ```python
  from sonido.efectos import echo
  ```

  Esto también carga el módulo `echo` y lo deja disponible sin su prefijo de
  paquete, por lo que puede usarse así:

  ```python
  echo.echofilter(input, output, delay=0.7, atten=4)
  ```

- Otra variante más es importar directamente el miembro deseado (función,
  variable, etc.) del módulo:

  ```python
  from sonido.efectos.echo import echofilter
  ```

  De nuevo, esto carga el módulo `echo`, pero deja directamente disponible la
  función `echofilter`, por lo que se puede usar sin necesidad de poner el
  nombre del módulo como prefijo:

  ```python
  echofilter(input, output, delay=0.7, atten=4)
  ```

---

- Nótese que al usar:

  ```python
  from paquete import elemento
  ```

  el elemento puede ser tanto un módulo (o subpaquete) del paquete, como algún
  otro nombre definido en el paquete, como por ejemplo una función, una
  variable o una clase.

  La sentencia !PYTHON(import) primero verifica si el elemento está definido en
  el paquete; si no, asume que es un módulo y trata de cargarlo. Si no lo puede
  encontrar, se genera una excepción !PYTHON(ImportError).

- Por otro lado, cuando se usa la sintaxis:

  ```python
  import elemento.subelemento.subsubelemento
  ```

  cada elemento excepto el último debe ser un paquete; ese último elemento
  puede ser un módulo o un paquete pero no puede ser una función, variable o
  clase definida en el elemento previo.

<!--

---

- Por ejemplo, si tenemos la siguiente estructura de archivos y directorios:

  ```
  mi_paquete/
  │
  ├── __init__.py
  ├── utilidades.py
  ├── modelos.py
  └── io/
      ├── __init__.py
      └── lector.py
  ```

  esa estructura representa:

  - El paquete `mi_paquete`, que contiene:

    - Los módulos `utilidades` y `modelos`.

    - El subpaquete `io`, que contiene:

      - El módulo `lector`.

  y podemos hacer uso de la misma, por ejemplo, así:

  ```python
  import mi_paquete.utilidades
  from mi_paquete.io import lector
  ```

-->

---

- El archivo `__init__.py` sirve para inicializar un paquete y controlar su
  comportamiento cuando se importa.

- Tradicionalmente, un directorio sólo era considerado un paquete si contenía
  un archivo llamado `__init__.py`.

- Hoy en día ya no es necesario, pero aún sigue siendo válido, habitual y
  recomendado.

- Además, el uso de `__init__.py` permite:

  - Ejecutar código al importar el paquete.

  - Controlar qué se expone al usar `*` en una importación, como en una
    sentencia !PYTHON(import) así:

    ```python
    from paquete import *
    ```

---

- Cuando se importa un paquete en sí:

  ```python
  import sonido
  ```

  Python hace lo siguiente, en este orden:

  #. Localiza el paquete `sonido`.

  #. Ejecuta el contenido del archivo `sonido/__init__.py`.

  #. Crea el objeto paquete llamado `sonido`.

- Es decir:

  - `__init__.py` es código Python normal.

  - Importar un paquete supone, en esencia, importar el `__init__.py` del
    paquete como si fuera un módulo.

---

- El archivo `__init__.py` permite decidir qué «sale hacia fuera» cuando se
  importa el paquete en sí.

- Por ejemplo, supongamos que el archivo `sonido/__init__.py` contiene la
  siguiente línea:

  ```python
  from sonido.utilidades import suma, resta
  ```

- Ahora, se puede hacer directamente:

  ```python
  from sonido import suma
  ```

  sin necesidad de dar dos pasos:

  ```python
  from sonido.utilidades import suma
  ```

---

- Cuando se intenta importar todos los módulos de un paquete:

  ```python
  from sonido.efectos import *
  ```

  lo que ocurre depende de lo que haya en el `__init__.py` del paquete.

- Los módulos que se importen serán los que el creador del paquete haya
  establecido previamente.

- Para ello, la sentencia !PYTHON(import) sigue el siguiente convenio: si el
  `__init__.py` del paquete contiene una lista llamada `__all__`, ésta se
  tomará como la lista de nombres de módulos que se importarán al ejecutar la
  sentencia !PYTHON(from) !NT(paquete) !PYTHON(import *).

  El creador del paquete es responsable de mantener actualizada esta lista cada
  vez que se publique una nueva versión del paquete.

---

- Por ejemplo, si el archivo `sonido/efectos/__init__.py` contiene el siguiente
  código:

  ```python
  __all__ = ["echo", "surround", "reverse"]
  ```

  entonces la siguiente sentencia importaría esos tres módulos del paquete
  `sonido.efectos`:

  ```python
  from sonido.efectos import *
  ```

---

- Hay que tener en cuenta que los módulos pueden quedar sombreados por nombres
  definidos localmente.

- Por ejemplo, si se añade una función llamada `reverse` al archivo
  `sonido/efectos/__init__.py`:

  ```python
  __all__ = [
      "echo",      # se refiere al archivo 'echo.py'
      "surround",  # se refiere al archivo 'surround.py'
      "reverse",   # ahora se refiere a la función 'reverse' (!)
  ]

  def reverse(msg: str):  # hace sombra al módulo 'reverse.py'
      return msg[::-1]    # si se hace 'from sonido.efectos import *'
  ```

  entonces la orden
  
  ```python
  from sonido.efectos import *
  ```

  solo importaría los dos módulos `echo` y `surround`, pero no el módulo
  `reverse`, ya que este último queda sombreado por la función `reverse`
  definida localmente.

---

- Si no se define `__all__`, la sentencia:

  ```python
  from sonido.efectos import *
  ```

  no importa todos los módulos del paquete `sonido.efectos` al espacio de
  nombres actual.

- Lo que hace es:

  #. Asegurarse que se haya importado el paquete `sonido.efectos`, posiblemente
     ejecutando algún código de inicialización que haya en `__init__.py`.

  #. Importa los nombres que estén definidos en el paquete.

     Esto incluye:

     - Cualquier nombre definido (y módulos explícitamente cargados) por
       `__init__.py`.

     - Cualquier módulo del paquete que pudiera haber sido explícitamente
       cargado por sentencias !PYTHON(import) anteriores.

---

- En el siguiente ejemplo:

  ```python
  import sonido.efectos.echo
  import sonido.efectos.surround
  from sonido.efectos import *
  ```

  los módulos `echo` y `surround` se importan en el espacio de nombre actual
  porque están definidos en el paquete `sonido.efectos` cuando se ejecuta la
  sentencia !PYTHON(from ... import).

  Esto también funciona cuando se define `__all__`.

- A pesar de que ciertos módulos están diseñados para exportar sólo nombres que
  siguen ciertos patrones cuando se usa !PYTHON(import !POR), se considera una
  mala práctica en código de producción.

- No hay nada malo en usar !PYTHON(from) !NT(paquete) !PYTHON(import)
  !NT(submodulo). De hecho, esta es la notación recomendada a menos que el
  módulo que queremos importar necesite usar módulos con el mismo nombre desde
  un paquete diferente.

---

- Cuando se estructuran paquetes en subpaquetes (como en el ejemplo del paquete
  `sonido`) los módulos pueden pueden hacer **importaciones absolutas** para
  referirse a módulos de paquetes «hermanos».

- Por ejemplo, si el módulo `sonido.filtros.vocoder` necesita usar el módulo
  `echo` del paquete `sonido.efectos`, puede hacer:

  ```python
  from sonido.efectos import echo
  ```

---

- También se pueden hacer **importaciones relativas** usando sólo la forma de
  importación !PYTHON(from) !NT(módulo) !PYTHON(import) !NT(nombre).

- Estas importaciones usan:

  - Un punto (`.`) para indicar el paquete actual.

  - Dos puntos (`..`) para indicar el paquete «padre».

  - Tres puntos (`...`) para indicar el paquete «abuelo».

  y así sucesivamente, en la cadena de paquetes involucrados en la importación
  relativa.

- Por ejemplo, desde el módulo `surround` se puede hacer:

  ```python
  from . import echo                # importa módulo echo del paquete actual (surround)
  from .. import formatos           # importa módulo formatos del paquete padre (sonido)
  from ..filtros import equalizer   # importa módulo equalizer del paquete filtros
  ```

- Hay que tener en cuenta que las importaciones relativas se basan en el nombre
  del paquete del módulo actual. Como el módulo principal de un programa Python
  no pertenece a ningún paquete, debe usar siempre importaciones absolutas.

# Criterios de descomposición modular

## Introducción

- No existe una única forma de descomponer un programa en módulos (entendiendo
  aquí por _módulo_ cualquier parte del programa en sentido amplio, incluyendo
  una simple función).

- Las diferentes formas de dividir el sistema en módulos traen consigo
  diferentes requisitos de comunicación y coordinación entre las personas (o
  equipos) que trabajan en esos módulos, y ayudan a obtener los beneficios
  descritos anteriormente en mayor o menor medida.

- Nos interesa responder a las siguientes preguntas:

  - ¿Qué criterios se deben seguir para dividir el programa en módulos?

  - ¿Qué módulos debe tener nuestro programa?

  - ¿Cuántos módulos debe tener nuestro programa?

  - ¿De qué tamaño deben ser los módulos?

## Tamaño y número

- Se supone que, si seguimos al pie de la letra la estrategia de diseño basada
  en la división de problemas, sería posible concluir que si el programa se
  dividiera indefinidamente, cada vez se necesitaría menos esfuerzo hasta
  llegar a cero.

- Evidentemente, esto no es así, ya que hay otras fuerzas que entran en juego.

- El coste de desarrollar un módulo individual disminuye conforme aumenta el
  número de módulos.

- Por otra parte, dado el mismo conjunto de requisitos funcionales, cuantos más
  módulos hay, más pequeños son.

- Sin embargo, cuantos más módulos hay, más cuesta integrarlos.
 
- El tamaño de cada módulo debe ser el adecuado: si es demasiado grande, será
  difícil hacer cambios en él; si es demasiado pequeño, no merecerá la pena
  tratarlo como un módulo, sino más bien como parte de otros módulos.
  
---

- El valor $M$ es el número de módulos ideal, ya que reduce el coste total del
  desarrollo.

!IMGP(modulos.png)(Esfuerzo frente al número de módulos)

---

- Las curvas de la figura anterior constituyen una guía útil al considerar la
  modularidad.

- Debemos evitar hacer pocos o muchos módulos para así permanecer en la
  cercanía de $M$.

- Pero, ¿cómo saber cuál es la cercanía de $M$? ¿Cómo de modular debe hacerse
  el programa?

- Debe hacerse un diseño con módulos, de manera que el desarrollo pueda
  planearse con más facilidad, que los cambios se realicen con más facilidad,
  que las pruebas y la depuración se efectúen con mayor eficiencia y que el
  mantenimiento a largo plazo se lleve a cabo sin efectos indeseados de
  importancia.

- Para ello nos basaremos en los siguientes **criterios**.

## Abstracción

- La **abstracción** es un proceso mental que se basa en estudiar un aspecto
  del problema a un determinado nivel centrándose en lo esencial e ignorando
  momentáneamente los detalles que no son importantes en este nivel.

- Ese proceso nos permite comprender la esencia de un subsistema sin tener que
  conocer detalles innecesarios del mismo.

- Es decir, se puede estudiar y usar el subsistema sabiendo _qué_ hace sin
  tener que saber _cómo_ lo hace.

- La utilización de la abstracción también permite trabajar con conceptos y
  términos que son familiares en el entorno del problema sin tener que
  transformarlos en una estructura no familiar.

- La abstracción se usa principalmente como una técnica de **manejo y control
  de la complejidad**.

---

- Cuando se considera una solución modular a cualquier problema, se pueden
  definir varios **niveles de abstracción**:

  - En niveles **más altos** de abstracción, se enuncia una solución en
    términos más generales usando el lenguaje del entorno del problema.

    A estos niveles hay menos elementos de información, pero más grandes e
    importantes.

  - En niveles **más bajos** de abstracción se da una descripción más detallada
    de la solución.

    A estos niveles se revelan más detalles, aparecen más elementos y se
    aumenta la cantidad de información con la que tenemos que trabajar.

---

---------------------------------
&nbsp;       &nbsp;
------------ --------------------
Nivel 1      (Más abstracción)

Nivel 2

Nivel 3

...

Nivel $n$    (Más detalle)
---------------------------------

---

- La **barrera de separación** entre un nivel de abstracción y su
  inmediatamente inferior es la diferencia entre el *qué* y el *cómo*:

  - Cuando estudiamos un concepto a un determinado nivel de abstracción,
    estudiamos *qué* hace.

  - Cuando bajamos al nivel inmediatamente inferior, pasamos a
    estudiar *cómo* lo hace.
  
- Esta división o separación puede continuar en niveles inferiores, de forma
  que siempre puede considerarse que cualquier nivel responde al *qué* y el
  nivel siguiente (el que está justo debajo) responde al *cómo*.

---

- Recordemos que un módulo tiene siempre un doble punto de vista:

  - El punto de vista del *creador* o implementador del módulo.

  - El punto de vista del *usuario* del módulo.

  !CAJA
  ~~~~~~~~~~~~~~~~~
  La **abstracción** nos ayuda a **definir qué módulos constituyen nuestro
  programa** considerando la relación que se establece entre los *creadores* y
  los *usuarios* de los módulos.
  ~~~~~~~~~~~~~~~~~

- Esto es así porque **los usuarios de un módulo quieren usar a éste como una
  abstracción**: sabiendo *qué* hace (su función) pero sin necesidad de saber
  *cómo* lo hace (sus detalles internos).
  
- El responsable del *cómo* es únicamente el **creador** del módulo.

- Los módulos definidos como abstracciones (las denominadas **abstracciones
  modulares**) son más fáciles de usar, diseñar y mantener.

## Ocultación de información

- David Parnas introdujo el **principio de ocultación de información** en 1972.

- Afirmó que el criterio principal para la modularización de un sistema debe
  ser la **ocultación de _decisiones de diseño_ complejas o que puedan cambiar
  en el futuro**, es decir, que los módulos se deben caracterizar por ocultar
  *decisiones de diseño* a los demás módulos.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~
  Por tanto: todos los elementos que necesiten conocer las mismas *decisiones
  de diseño*, deben pertenecer al mismo módulo.
  ~~~~~~~~~~~~~~~~~~~~~~~~

- Al ocultar la información de esa manera se evita que los usuarios de un
  módulo necesiten de un conocimiento íntimo del diseño interno del mismo para
  poder usarlo, y los aísla de los posibles efectos de cambiar esas decisiones
  posteriormente.

- Implica que la modularidad efectiva se logra **definiendo un conjunto de
  módulos independientes que intercambien sólo aquella información
  estrictamente necesaria para que el programa funcione**.

---

- Dicho de otra forma:

  - **Para que un módulo *A* pueda usar a otro *B*, *A* tiene que conocer de
    *B* lo menos posible**, lo imprescindible.
  
    !CAJA
    ~~~~~~~~~~~~~~~~~~~~
    El uso del módulo debe realizarse únicamente por medio de **interfaces**
    bien definidas que no cambien (o cambien poco) con el tiempo y que no
    expongan detalles internos al exterior.
    ~~~~~~~~~~~~~~~~~~~~

  - Por tanto, *B* debe **ocultar** al exterior sus detalles internos de
    **implementación** y exponer sólo lo necesario para que otros lo puedan
    utilizar.
  
    Ésto aísla a los usuarios de los posibles cambios internos que pueda haber
    posteriormente en *B*.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~
Es decir: cada módulo debe ser una **caja negra** recelosa de su privacidad que
tiene «aversión» por exponer sus interioridades a los demás.
~~~~~~~~~~~~~~~~~~~~~~

---

- La **abstracción** y la **ocultación de información** se complementan:

  - La **abstracción** puede usarse como una **técnica de diseño** que **nos da
    un método para descomponer el programa en módulos**. Es decir: nos ayuda a
    decidir **qué módulos debe tener el programa**.

    Pero **también nos dice qué debe ocultar y qué debe exponer** cada módulo,
    porque afirma que la _interfaz_ debe estar formada, precisamente, por lo
    elementos que responden al «_qué_» hace el módulo, y la _implementación_
    por los que responden al «_cómo_» lo hace.

  - La **ocultación de información** es un **principio de diseño** que se basa
    en que los módulos deben ocultar a los demás módulos sus decisiones de
    diseño y exponer sólo la información estrictamente necesaria para que los
    demás puedan usarlos.

    Por tanto, nos ayuda a identificar **qué detalles debe ocultar el módulo y
    qué información debe exponer a los demás**. Es decir: qué detalles internos
    deben conocerse de un módulo para poder usarlo.

    También nos ayuda a ver **en qué módulo va cada elemento del programa**. Es
    decir: qué elementos deben formar parte de un módulo y cuáles deben formar
    parte de otros módulos.

---

- Al **usuario** de un módulo...

  - ... le interesa la **abstracción** porque le permite usar el módulo
    sabiendo únicamente *qué* hace sin tener que saber *cómo* lo hace.

  - ... le interesa la **ocultación de información** porque cuanta menos
    información necesite conocer para usar el módulo, menos expuesto estará a
    verse afectado por posibles cambios futuros en el funcionamiento interno
    del mismo.

- Al **creador** de un módulo...

  - ... le interesa la **abstracción** porque le ayuda a determinar qué módulos
    deben formar parte del programa.

  - ... le interesa la **ocultación de información** porque le ayuda a
    determinar qué elementos deben formar parte de su módulo y qué información
    debe ocultar su módulo al exterior. Además, cuantos menos detalles
    necesiten conocer los usuarios para poder usar su módulo, más libertad
    tendrá él para cambiar esos detalles en el futuro (cuando lo necesite o lo
    desee) sin afectar a los usuarios de su módulo.

## Independencia funcional

- La **independencia funcional** es otro criterio a seguir para obtener una
  modularidad efectiva.

- La independencia funcional se logra desarrollando módulos de manera **que
  cada módulo resuelva una funcionalidad específica y tenga una interfaz
  sencilla** cuando se vea desde otras partes de del programa (idealmente,
  mediante paso de parámetros).

  - De hecho, **la interfaz del módulo debe estar destinada únicamente a
    cumplir con esa funcionalidad**.

- Al limitar su objetivo, el módulo necesita menos ayuda de otros módulos.

---

- Por ello, el módulo debe ser tan **independiente** como sea posible del resto
  de los módulos del programa.

- Es decir: debe depender lo menos posible de lo que hagan otros módulos, y
  también debe depender lo menos posible de los datos que puedan facilitarle
  otros módulos.

!CAJA
~~~~~~~~~~~~~
Dicho de otra forma: los módulos deben centrarse en **resolver un problema
concreto** (ser «monotemáticos»), deben ser «antipáticos», tener «aversión» a
relacionarse con otros módulos y **depender lo menos posible de otros
módulos**.
~~~~~~~~~~~~~

---

- Los módulos independientes son **más fáciles de desarrollar** porque la
  función del programa se subdivide y las interfaces se simplifican, por lo que
  se pueden desarrollar por separado.

- Los módulos independientes son **más fáciles de mantener y probar** porque
  los efectos secundarios causados por el diseño o por la modificación del
  código son más limitados, se reduce la propagación de errores y es posible
  obtener módulos reutilizables.

- De esta forma, la mayor parte de los cambios y mejoras que haya que hacer al
  programa implicarán modificar sólo un módulo o un número muy pequeño de
  ellos.

- Es un objetivo a alcanzar para obtener una modularidad efectiva.

- La independencia funcional se mide usando dos métricas: la **cohesión** y el
  **acoplamiento**.

- El objetivo de la independencia funcional es **maximizar la cohesión y
  minimizar el acoplamiento**.

### Cohesión

- La **cohesión** mide la fuerza con la que se relacionan los componentes de un
  módulo.

- Cuanto más cohesivo sea un módulo, mejor será nuestro diseño modular.

- Un módulo cohesivo realiza una sola función, por lo que requiere interactuar
  poco con otros componentes en otras partes del programa.

- En un módulo cohesivo, **sus componentes están fuertemente relacionados entre
  sí y pertenencen al módulo por una razón lógica** (no están ahí por
  casualidad), es decir, todos cooperan para alcanzar un objetivo común que es
  la función del módulo.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Un módulo cohesivo mantiene unidos (*atrae*) los componentes que están
relacionados entre ellos y mantiene fuera (*repele*) al resto.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- En pocas palabras, un módulo cohesivo debe tener un único objetivo, y todos
  los elementos que lo componen deben contribuir a alcanzar dicho objetivo.

- Aunque siempre debe tratarse de lograr mucha cohesión (por ejemplo, una sola
  tarea), con frecuencia es necesario y aconsejable hacer que un módulo realice
  varias tareas, siempre que contribuyan a una misma finalidad lógica.
  
- Sin embargo, para lograr un buen diseño hay que evitar módulos que llevan a
  cabo funciones no relacionadas.

---

- La siguiente es una escala de grados de cohesión, ordenada de mayor a menor:

  - Cohesión funcional

  - Cohesión secuencial

  - Cohesión de comunicación

    [Hasta aquí, los módulos se consideran **cajas negras**.]

  - Cohesión procedimental

  - Cohesión temporal

  - Cohesión lógica

  - Cohesión coincidental

- No hace falta determinar con precisión qué cohesión tenemos. Lo importante es
  intentar conseguir una cohesión alta y reconocer cuándo hay poca cohesión
  para modificar el diseño y conseguir una mayor independencia funcional.

---

- **Cohesión funcional**: se da cuando los componentes del módulo pertenecen al
  mismo porque todos contribuyen a una tarea única y bien definida del módulo.

- **Cohesión secuencial**: se da cuando los componentes del módulo pertenecen
  al mismo porque la salida de uno es la entrada del otro, como en una cadena
  de montaje (por ejemplo, una función que lee datos de un archivo y los
  procesa).

- **Cohesión de comunicación**: se da cuando los componentes del módulo
  pertenecen al mismo porque trabajan sobre los mismos datos (por ejemplo, un
  módulo que procesa números racionales).

---

- **Cohesión procedimental**: se da cuando los componentes del módulo
  pertenecen al mismo porque siguen una cierta secuencia de ejecución (por
  ejemplo, una función que comprueba los permisos de un archivo y después lo
  abre).

- **Cohesión temporal**: se da cuando los componentes del módulo pertenecen al
  mismo porque se ejecutan en el mismo momento (por ejemplo, una función que se
  dispara cuando se produce un error, abriría un archivo, crearía un registro
  de error y notificaría al usuario). 

- **Cohesión lógica**: se da cuando los componentes del módulo pertenecen al
  mismo porque pertenencen a la misma categoría lógica aunque son esencialmente
  distintos (por ejemplo, un módulo que agrupe las funciones de manejo del
  teclado o el ratón).

- **Cohesión coincidental**: se da cuando los componentes del módulo pertenecen
  al mismo por casualidad o por razones arbitrarias, es decir, que la única
  razón por la que se encuentran en el mismo módulo es porque se han agrupado
  juntos (por ejemplo, un módulo de «utilidades»).

### Acoplamiento

- El **acoplamiento** es una medida del grado de interdependencia entre los
  módulos de un programa.

- Dicho de otra forma, es la fuerza con la que se relacionan los módulos de un
  programa.

- El acoplamiento depende de:

  - La complejidad de la interfaz entre los módulos.

  - El punto en el que se entra o se hace referencia a un módulo.
  
  - Los datos que se pasan a través de la interfaz.

- Lo deseable es tener módulos con poco acoplamiento, es decir, módulos que
  dependan poco unos de otros.

- De esta forma obtenemos programas más fáciles de entender y menos propensos
  al *efecto ola*, que ocurre cuando se dan errores en un sitio y se propagan
  por todo el programa.

---

- Los programas con alto acoplamiento tienden a presentar los siguientes
  problemas:

  - Un cambio en un módulo normalmente obliga a cambiar otros módulos
    (consecuencia del *efecto ola*).

  - Requiere más esfuerzo integrar los módulos del programa ya que dependen
    mucho unos de otros.

  - Un módulo particular resulta más difícil de reutilizar o probar debido a
    que hay que incluir en el lote a los módulos de los que depende éste (no se
    puede reutilizar o probar por separado).

---

- La siguiente es una escala de grados de acoplamiento, ordenada de mayor a
  menor:

  - Acoplamiento por contenido

  - Acoplamiento común

  - Acoplamiento externo

  - Acoplamiento de control

  - Acoplamiento por estampado

  - Acoplamiento de datos

  - Sin acoplamiento

- No hace falta determinar con precisión qué acoplamiento tenemos. Lo
  importante es intentar conseguir un acoplamiento bajo y reconocer cuándo hay
  mucho acoplamiento para modificar el diseño y conseguir una mayor
  independencia funcional.

---

- **Acoplamiento por contenido**: ocurre cuando un módulo modifica o se apoya
  en el funcionamiento interno de otro módulo (por ejemplo, accediendo a datos
  locales del otro módulo). Cambiar la forma en que el segundo módulo produce
  los datos obligará a cambiar el módulo dependiente.

- **Acoplamiento común**: ocurre cuando dos módulos comparten los mismos datos
  globales. Cambiar el recurso compartido obligará a cambiar todos los módulos
  que lo usen.

- **Acoplamiento externo**: ocurre cuando dos módulos comparten un formato de
  datos impuesto externamente, un protocolo de comunicación o una interfaz de
  dispositivo de entrada/salida.

- **Acoplamiento de control**: ocurre cuando un módulo controla el flujo de
  ejecución del otro (por ejemplo, pasándole un *conmutador* booleano).

---

- **Acoplamiento por estampado**: ocurre cuando los módulos comparten una
  estructura de datos compuesta y usan sólo una parte de ella, posiblemente una
  parte diferente. Esto podría llevar a cambiar la forma en la que un módulo
  lee un dato compuesto debido a que un elemento que el módulo no necesita ha
  sido modificado.

- **Acoplamiento de datos**: ocurre cuando los módulos comparten datos entre
  ellos (por ejemplo, parámetros). Cada dato es una pieza elemental y dicho
  parámetro es la única información compartida (por ejemplo, pasando un entero
  a una función que calcula una raíz cuadrada).

- **Sin acoplamiento**: ocurre cuando los módulos no se comunican para nada uno
  con otro.

## Reusabilidad

- La **reusabilidad** es un factor de calidad del software que se puede aplicar
  tambien a sus componentes o módulos.

- Un módulo es **reusable** cuando puede aprovecharse para ser utilizado (tal
  cual o con muy poca modificación) en varios programas.

- A la hora de diseñar módulos (o de descomponer un programa en módulos) nos
  interesa que los módulos resultantes sean cuanto más reusables mejor.

- Para ello, el módulo en cuestión debe ser lo suficientemente general y
  resolver un problema patrón que sea suficientemente común y se pueda
  encontrar en varios contextos y programas diferentes.

- Además, para aumentar la reusabilidad, es conveniente que el módulo tenga un
  bajo acoplamiento y que, por tanto, no dependa de otros módulos del programa.

---

- Esos módulos incluso podrían luego formar parte de una *biblioteca* o
  *repositorio* de módulos y ponerlos a disposición de los programadores para
  que puedan usarlos en sus programas.

- A día de hoy, el desarrollo de programas se basa en gran medida en
  seleccionar y utilizar módulos reusables (que en este contexto también se
  denominan **bibliotecas**, **librerías** o **paquetes**) desarrollados por
  terceros o reutilizados de otros programas elaborados por nosotros mismos
  anteriormente.

- Es decir: la programación se ha convertido en una actividad que consiste
  principalmente en ir combinando módulos intercambiables.

- Eso nos permite acortar el tiempo de desarrollo porque podemos construir un
  programa a base de ir ensamblando módulos reusables como si fueran las piezas
  del engranaje de una máquina.

### Diseño ascendente

- Cuando hablamos de la programación procedimental, dijimos que el diseño
  descendente tiene ventajas pero también inconvenientes, entre los cuales
  teníamos:

  - Hasta que no se ha llegado al nivel más bajo, no se tiene algo que pueda
    probarse, ensamblarse y ejecutarse.

  - Por tanto, es un enfoque más difícil de aplicar si no se entienden bien los
    detalles prácticos ni se conocen perfectamente desde el principio los
    requisitos del programa que hay que constuir.

  - Puede ignorar la reutilización de componentes ya existentes.

  - Resulta fácil obtener subprogramas que sólo sean útiles para el programa
    actual y no se puedan generalizar para su reutilización en otras
    situaciones.

- Por tanto, con el diseño descendente a veces cuesta conseguir la programación
  de subprogramas o módulos reutilizables.

---

- Frente al diseño descendente, tenemos también el llamado **diseño
  ascendente** o **_bottom-up_**, que es una técnica que se puede aplicar tanto
  en programación procedimental (con subprogramas) como en programación modular
  (con módulos).

  Por eso, a partir de ahora hablaremos de _componentes_ para referirnos a
  módulos o subprogramas.

- Como su nombre indica, consiste en ir de abajo arriba, construyendo
  componentes básicos que se van combinando y ensamblando poco a poco hasta
  obtener el programa completo.

- Además, en todo momento se busca que esos componentes sean reutilizables, es
  decir, aprovechables en otros programas.

---

- Cómo se aplica el diseño ascendente:

  #. Se diseñan ladrillos básicos de construcción en forma de pequeños
     componentes independientes y genéricos.

  #. Se combinan esos componentes para crear otros cada vez más complejos,
     integrándolos unos con otros.

     En la práctica, consiste en hacer que el componente que estamos
     programando ahora, utilice a otros que ya hemos programado (nosotros u
     otros programadores).

  #. Finalmente, se integran todos los componentes para formar el sistema
     completo.

---

- El diseño ascendente tiene **ventajas**:

   - Favorece la reutilización de código ya existente, en forma de módulos o
     librerías de subprogramas.

   - Permite programar y verificar partes funcionales del programa _antes de
     tener el programa completo_, ya que se pueden ir ensamblando esas partes
     unas con otras a medida que se van programando y sin tener que esperar a
     tenerlas todas.

     Esas partes se hacen cada vez más complejas conforme se van ensamblando
     entre sí los distintos componentes que las forman y, con ello, se va
     construyendo el programa _de abajo arriba_.

   - El diseño global del programa puede cambiar a medida que se van conectando
     los componentes unos con otros, por lo que el diseño ascendente es menos
     sensible a cambios en la arquitectura del programa.

---

- Pero también tiene **inconvenientes**:

  - Puede ser difícil garantizar que al final todos los componentes encajarán
    juntos perfectamente en un sistema coherente.

  - Se necesita experiencia para construir componentes lo suficientemente
    genéricos como para resultar reutilizables.

- La opción que generalmente resulta más conveniente es la de combinar ambos
  enfoques en una única estrategia.

### Estrategia sándwich

- En la práctica, el diseño descendente y el ascendente se combinan en un único
  enfoque llamado habitualmente **estrategia sándiwch**.

- Este enfoque consiste en lo siguiente:

  #. **Diseño _top-down_**: Definir la arquitectura general y los grandes
     módulos según los requisitos del sistema, empezando por una visión a vista
     de pájaro de la solución que se debe construir.

  #. **Diseño _bottom-up_**: Diseñar y programar componentes básicos (módulos y
     procedimientos) que se sabe que se necesitarán (por experiencia previa o
     por requisitos funcionales claros) y que se van a tener que combinar entre
     sí.

  #. **Integración en el medio (_sándwich_)**: Los módulos grandes (_top-down_)
     se implementan usando los componentes pequeños (_bottom-up_), asegurando
     coherencia entre la visión global que ofrece el _top-down_ y detalles
     prácticos que ofrece el _bottom-up_.

---

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
En resumen, se diseña la arquitectura desde arriba y se construyen componentes
reutilizables desde abajo, encontrándose ambos en el desarrollo de los
compontentes intermedios.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- En la práctica, podemos decir que:

  #. El enfoque _top-down_ se puede usar para identificar qué módulos
     principales van a formar parte del programa.

  #. También se puede usar el enfoque _top-down_ para programar los
     subprogramas y los detalles algorítmicos que formen cada módulo,
     aplicando el refinamiento sucesivo pero sin bajar a un nivel de detalle
     muy alto (o sea, dejándolos a medio terminar).

  #. Se puede aplicar el enfoque _bottom-up_ para construir componentes que se
     puedan reutilizar en varias partes del programa y que no requieran de
     otras partes, de forma que se puedan escribir y probar ya, sin esperar a
     tener más partes funcionando.

  #. Estos componentes se usan para terminar de programas los algoritmos que se
     concretaron _a medias_ en el paso 2 anterior, de forma que los del paso 2
     llaman o usan a los del paso 3.

---

- La estrategia sándwich tiene las siguientes **ventajas**:

  - Combina lo mejor de ambos enfoques.

  - Garantiza visión global y cohesión (_top-down_).

  - Permite reutilización y validación temprana de componentes (_bottom-up_).

  - Facilita la integración progresiva del sistema.

## Principios *SOLID*

- Los **principios _SOLID_** son un conjunto de cinco principios de diseño
  modular cuyo objetivo es hacer el software más mantenible, extensible,
  comprensible y robusto.

- Inicialmente fueron propuestos para el paradigma de la _Programación
  orientada a objetos_, pero pueden aplicarse a cualquier sistema modular.

- _SOLID_ es un acrónimo que fue popularizado por Robert C. Martin («Uncle
  Bob»), y proviene del nombre de los cinco principios en inglés:

  - **S**ingle Responsibility Principle (SRP).

  - **O**pen/Closed Principle (OCP).

  - **L**iskov Sustitution Principle (LSP).

  - **I**nterface Segregation Principle (ISP).

  - **D**ependency Inversion Principle (DIP).

---

- Los cinco principios son:

  - **Principio de Responsabilidad Única (SRP)**: los módulos deben tener un
    único propósito y una única responsabilidad clara.

  - **Principio Abierto/Cerrado (OCP)**: los módulos deben estar abiertos para
    su extensión pero cerrados para su modificación.

  - **Principio de Sustitución de Liskov (LSP)**: los módulos deben poderse
    intercambiar unos por otros siempre que respeten la misma especificación.

  - **Principio de Segregación de la Interfaz (ISP)**: los módulos sólo deben
    exponer la mínima funcionalidad que sea relevante para sus usuarios, y los
    usuarios no deben depender de interfaces que no usan.

  - **Principio de Inversión de Dependencias (DIP)**: los módulos deben
    depender de abstracciones y no de concreciones.

!BIBLIOGRAFIA
