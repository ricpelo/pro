---
title: Programación modular I
author: Ricardo Pérez López
!DATE
nocite: |
  @pressman_ingenierisoftware:_2004, @python_software_foundation_sitio_nodate
---

# Introducción

## Modularidad

- La **programación modular** es una técnica de programación que consiste en
  descomponer y programar nuestro programa en partes llamadas **módulos**.

  - El concepto de *módulo* hay que entenderlo en sentido amplio: cualquier
    parte de un programa se puede considerar módulo.

- Equivale a la técnica clásica de resolución de problemas basada en
  descomponer un problema en subproblemas y resolver cada subproblema por
  separado para así obtener la solución al problema original.

- La **modularidad** es la propiedad que tienen los programas escritos
  siguiendo los principios de la programación modular.

- El concepto de modularidad se puede estudiar a nivel *metodológico* y a nivel
  *práctico*.

---

- **A nivel metodológico**, la modularidad nos proporciona una herramienta más
  para controlar la complejidad de forma similar a como lo hace la abstracción.

- Todos los mecanismos de control de la complejidad actúan de la misma forma:
  la mente humana es incapaz de mantener la atención en muchas cosas a la vez,
  así que lo que hacemos es centrarnos en una parte del problema y dejamos a un
  lado el resto momentáneamente.

  - La **abstracción** nos permite controlar la complejidad permitiéndonos
    estudiar un problema o su solución por niveles, centrándonos en lo esencial
    e ignorando los detalles que a ese nivel resultan innecesarios.

  - Con la **modularidad** buscamos descomponer conceptualmente el programa en
    partes que se puedan estudiar y programar por separado, de forma más o
    menos independiente, lo que se denomina **descomposición lógica**.
      
<!--
- Si fuera posible, también nos interesa que los módulos sean lo
  suficientemente genéricos como para que se se puedan reutilizar en otros
  programas. -->

---

- **A nivel práctico**, la modularidad nos ofrece una herramienta que nos
  permite partir el programa en partes más manejables.

- A medida que los programas se hacen más y más grandes, el esfuerzo de
  mantener todo el código dentro de un único *script* se hace mayor.

- No sólo resulta incómodo mantener todo el código en un mismo archivo,
  sino que además resulta intelectualmente más difícil de entender.

- Lo más práctico es descomponer físicamente nuestro programa en una colección
  de archivos fuente que se puedan trabajar por separado, lo que se denomina
  **descomposición física**.

---

- Un módulo es, pues, una parte de un programa que se puede estudiar, entender
  y programar por separado con relativa independencia del resto del programa.

- Por tanto, podríamos considerar que una función es un ejemplo de módulo, ya
  que se ajusta a esa definición (salvo quizás que no habría *descomposición
  física*, aunque se podría colocar cada función en un archivo separado y
  entonces sí).

- Sin embargo, descomponer un programa en partes usando únicamente como
  criterio la descomposición funcional no resulta adecuado en general, ya que
  muchas veces nos encontramos con funciones que no actúan por separado, sino
  de forma conjunta formando un todo interrelacionado.

- Además, un módulo no tiene por qué ser simplemente una abstracción funcional,
  sino que también puede tener su propio estado interno en forma de datos
  (variables) manipulables desde dentro del módulo pero también desde fuera.

---

- Por ejemplo, supongamos un conjunto de funciones que manipulan números
  racionales.

- Tendríamos funciones para crear racionales, para sumarlos, para
  multiplicarlos, para simplificarlos... Y todas esas funciones trabajarían
  conjuntamente, actuando sobre la misma colección de datos (la representación
  interna que usa el módulo para implementar los números racionales).
  
- Esos datos (es decir, esa representación interna) también formarían parte del
  módulo y constituirían su estado interno.

- Por consiguiente, aunque resulta muy apropiado considerar cada función
  anterior por separado, también resulta evidente que debemos considerarlas
  como formando un todo conjunto con los datos que manipulan: el *módulo de
  manipulación de números racionales*.

---

- De lo dicho hasta ahora se deducen varias conclusiones importantes:

  - Un módulo es una parte del programa.

  - Los módulos nos permiten descomponer el programa en **partes independientes
    y manejables por separado**.

  - Una función, en general, no es una candidata con suficiente entidad como
    para ser considerada un módulo.

  - Los módulos, en general, agrupan colecciones de **funciones
    interrelacionadas**.

  - Los módulos, en general, también poseen un **estado interno** en forma de
    estructuras de datos, manipulable desde el interior del módulo así como
    desde el exterior del mismo usando las funciones que forman el módulo.

  - A nivel práctico, los módulos se programan físicamente en **archivos
    separados** del resto del programa.

<!-- ## Descomposición de problemas -->

## Beneficios de la programación modular

- El tiempo de desarrollo se reduce porque grupos separados de programadores
  pueden trabajar cada uno en un módulo con poca necesidad de comunicación
  entre ellos.

- Se mejora la productividad del producto resultante, porque los cambios
  (pequeños o grandes) realizados en un módulo no afectarían demasiado a los
  demás.

- Comprensibilidad, porque se puede entender mejor el sistema completo cuando
  se puede estudiar módulo a módulo en lugar de tener que estudiarlo todo a la
  vez.

# Diseño modular

## Partes de un módulo

- Desde la perspectiva de la programación modular, un programa está formado por
  una colección de módulos que interactúan entre sí.

- Puede decirse que un módulo proporciona una serie de *servicios* que son
  *usados* o *consumidos* por otros módulos del programa.

- Así que podemos estudiar el diseño de un módulo desde **dos puntos de vista
  complementarios**:

  - La **implementación** del módulo se ocupa de la programación de los
    detalles internos al módulo, necesarios para que éste funcione

  - Los **usuarios** del módulo (normalmente, otros módulos), como entidades
    externas al mismo, utilizan el módulo como una entidad abstracta sin
    necesidad de conocer los detalles internos del mismo, sino sólo lo
    necesario para poder consumir los servicios que proporciona.

    A la parte que un usuario necesita conocer para poder usar el módulo se le
    denomina la **interfaz** del módulo.

---

- Concretando, un módulo tendrá:

  - Un **nombre** (que generalmente coincidirá con el nombre del archivo en el
    que reside).

  - Una **interfaz**, formada por un conjunto de funciones que permiten
    manipular y acceder al estado interno desde fuera del módulo.

  - Una **implementación**, formada por:

    - Su estado interno en forma de variables internas y locales al módulo.

      Como contiene variables, también puede contener constantes.

    - Un conjunto de funciones que manipulan el estado interno dentro del
      módulo.

      Es decir: funciones pensadas para ser usadas internamente por el propio
      módulo pero no por otras partes del programa.

### Interfaz

- La interfaz es la parte del módulo que el usuario del mismo necesita conocer
  para poder utilizarlo.

- Es la parte expuesta, pública o visible del mismo.

- A menudo también se la denomina su **API** (*Application Program Interface*).

- Debería estar perfectamente documentada para que cualquier potencial usuario
  tenga toda la información necesaria para poder usar el módulo sin tener que
  conocer o acceder a partes internas del mismo.

- En general debería estar formada únicamente por funciones (y, tal vez,
  constantes) que el usuario del módulo pueda llamar para consumir los
  servicios que ofrece el módulo.

- Esas funciones deben usarse como abstracciones funcionales, de forma que el
  usuario sólo necesite conocer la **especificación** de la función y no su
  *implementación* concreta.

### Implementación

- La implementación es la parte del módulo que queda oculta a los usuarios del
  mismo.

- Es decir: es la parte que los usuarios del módulo no necesitan (ni deben)
  conocer para poder usarlo adecuadamente.

- Está formado por todas las variables locales al módulo que almacenan su
  estado interno, junto con las funciones que utiliza el propio módulo para
  gestionarse a sí mismo y que no forman parte de su interfaz.

- La implementación debe poder cambiarse tantas veces como sea necesario sin
  que por ello se tenga que cambiar el resto del programa.

## Diagramas de estructura

- Los diferentes módulos que forman un programa y la relación que hay entre
  ellos se puede representar gráficamente mediante un *diagrama de
  descomposición modular* o **diagrama de estructura**.

- En el diagrama de estructura, cada módulo se representa mediante un
  rectángulo y las relaciones entre cada par de módulos se dibujan como una
  línea con punta de flecha entre los dos módulos.

- Una flecha dirigida del módulo *A* al módulo *B* representa que el módulo *A*
  *utiliza* o *llama* o *depende* del módulo *B*.

!DOT(modulos-dependientes.svg)(*A* depende de *B*)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A -> B
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

!DOT(diagrama-estructura.svg)(Diagrama de estructura)(width=40%)(width=30%)
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


## Programación modular en Python

- En Python, un módulo es otra forma de llamar a un *script*. Es decir:
  «módulo» y «*script*» son sinónimos en Python.

- Los módulos contienen definiciones y sentencias.

- El nombre del archivo es el nombre del módulo con extensión `.py`.

- Dentro de un módulo, el nombre del módulo (como cadena) se encuentra
  almacenado en la variable global `__name__`.

- Cada módulo tiene su propio ámbito local, que es usado como el ámbito global
  de todas las funciones definidas en el módulo.

- Por tanto, el autor de un módulo puede usar variables globales en el módulo
  sin preocuparse de posibles colisiones accidentales con las variables
  globales del usuario del módulo.

### Importación de módulos

- Para que un módulo pueda usar a otros módulos tiene que **importarlos**
  usando la orden `import`. Por ejemplo, la siguiente sentencia importa el
  módulo `math` dentro del módulo actual:

  ```python
  import math
  ```

- Al importar un módulo de esta forma, lo que se hace es incorporar la
  definición del propio módulo (el módulo *importado*) dentro del ámbito global
  del módulo o *script* actual (el módulo *importador*).
  
- O dicho de otra forma: se incorpora al marco global del módulo importador la
  ligadura entre el nombre del módulo importado y el propio módulo, por lo que
  el módulo importador puede acceder al módulo importado a través de su nombre.

- De esta forma, lo que se importa dentro del marco global actual no es el
  conjunto de las definiciones que forman el módulo importado, sino el módulo
  en sí.

---

- Eso significa que los módulos en Python son internamente un dato más, al
  igual que las listas o las funciones: se pueden asignar a variables, se
  pueden borrar de la memoria con `del`, etc.

- Podemos acceder al contenido de un módulo importado de esta forma, indicando
  el nombre del módulo seguido de un punto (`.`) delante del nombre del
  contenido al que queramos acceder.

- Por ejemplo, para acceder a la función `gcd` definido en el módulo `math`
  haremos:

  ```python
  x = math.gcd(16, 6)
  ```

- Se recomienda (aunque no es obligatorio) colocar todas las sentencias
  `import` al principio del módulo importador.

---

- Se puede importar un módulo dándole al mismo tiempo otro nombre dentro del
  marco actual, usando la sentencia `import` con la palabra clave `as`.

- Por ejemplo:

  ```python
  import math as mates
  ```

  La sentencia anterior importa el módulo `math` dentro del módulo actual pero
  con el nombre `mates` en lugar del `math` original. Por tanto, para usar la
  función `gcd` como en el ejemplo anterior usaremos:

  ```python
  x = mates.gcd(16, 6)
  ```

---

- Existe una variante de la sentencia `import` que nos permite importar
  directamente las definiciones de un módulo en lugar del propio módulo. Para
  ello, se usa la orden `from`.
  
- Por ejemplo, para importar sólo la función `gcd` del módulo `math`, y no el
  módulo en sí, haremos:

  ```python
  from math import gcd
  ```

- Por lo que ahora podemos usar la función `gcd` directamente dentro del módulo
  importador, sin necesidad de indicar el nombre del módulo importado:

  ```python
  x = gcd(16, 6)
  ```

---

- De hecho, ahora el módulo importado no está definido en el módulo importador
  (es decir, que en el marco global del módulo importador no hay ninguna
  ligadura con el nombre del módulo importado).

- En nuestro ejemplo, eso significa que el módulo `math` no existe ahora como
  tal en el módulo importador.

- Por tanto, si hacemos:

  ```python
  x = math  # error
  ```

  da error porque no hemos importado el módulo como tal, sino sólo una de sus
  funciones.

---

- También podemos usar la palabra clave `as` con la orden `from`:

  ```python
  from math import gcd as mcd
  ```

  De esta forma, se importa en el módulo actual la función `gcd` del módulo
  `math` pero llamándola `mcd`.
  
- Por tanto, para usarla la invocaremos con su nuevo nombre:

  ```python
  x = mcd(16, 6)
  ```

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
  de su **interfaz**.
  
- En general, los programadores no suelen usar esta funcionalidad ya que puede
  introducir todo un conjunto de definiciones desconocidas dentro del módulo
  importador, lo que incluso puede provocar que se «*machaquen*» definiciones
  ya existentes.

### Módulos como *scripts*

- Un módulo puede contener sentencias ejecutables además de definiciones.

- Generalmente, esas sentencias existen para inicializar el módulo.

- Las sentencias de un módulo se ejecutan sólo la primera vez que se encuentra
  el nombre de ese módulo en una sentencia `import`.

- También se ejecutan si el archivo se ejecuta como un *script*.

---

- Cuando se ejecuta un módulo Python desde la línea de órdenes como:

  ```shell
  $ python3 fact.py <argumentos>
  ```

  se ejecutará el código del módulo como si fuera un *script* más, igual que si
  se hubiera importado con un `import` dentro de otro módulo, pero con la
  diferencia de que la variable global `__name__` contendrá el valor
  `"__main__"`.

- Eso significa que si se añade este código al final del módulo:

  ```python
  if __name__ == "__main__":
      <sentencias>
  ```

  el módulo podrá funcionar como un *script* independiente.

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
  pueda importar dentro de otro.

- Si se usa como *script*, podremos llamarlo desde la línea de órdenes del
  sistema operativo:

  ```shell
  $ python3 fac.py 4
  24
  ```

- Y si importamos el módulo dentro de otro, el código del último `if` no se
  ejecutará, por lo que sólo se incorporará la definición de la función `fac`.

### Paquetes

### Documentación interna

# Criterios de descomposición modular

## Introducción

- No existe una única forma de descomponer un programa en módulos (entiendo
  aquí por *módulo* cualquier parte del programa en sentido amplio, incluyendo
  una simple función).

- Las diferentes formas de dividir el sistema en módulos traen consigo
  diferentes requisitos de comunicación y coordinación entre las personas (o
  equipos) que trabajan en esos módulos, y ayudan a obtener los beneficios
  descritos anteriormente en mayor o menor medida.

- ¿Qué criterios se deben seguir para dividir el programa en módulos?

- ¿Cuántos módulos debe tener nuestro programa?

- ¿De qué tamaño deben ser los módulos?

## Tamaño y número

- Según el punto de vista de la división de problemas, sería posible concluir
  que si el programa se dividiera indefinidamente, cada vez se necesitaría
  menos esfuerzo hasta llegar a cero.

- Evidentemente, esto no es así, ya que hay otras fuerzas que entran en juego.

- El coste de desarrollar un módulo individual disminuye conforme aumenta el
  número de módulos.

- Dado el mismo conjunto de requisitos funcionales, cuantos más módulos hay,
  más pequeños son.

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
  cercanía de M.

- Pero, ¿cómo saber cuál es la cercanía de M? ¿Cómo de modular debe hacerse el
  programa?

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

- Igualmente, nos permite comprender la esencia de un subsistema sin tener que
  conocer detalles innecesarios del mismo.

- Cuando se considera una solución modular a cualquier problema, se pueden
  definir varios niveles de abstracción:

  - En el nivel más alto de abstracción, se enuncia una solución en términos
    más generales usando el lenguaje del entorno del problema.

  - En niveles más bajos de abstracción se da una descripción más detallada de
    la solución.

---

- La utilización de la abstracción también permite trabajar con conceptos y
  términos que son familiares en el entorno del problema sin tener que
  transformarlos en una estructura no familiar.

- Recordemos que un módulo tiene siempre un doble punto de vista:

  - El punto de vista del creador o implementador del módulo.

  - El punto de vista del usuario del módulo.

- La abstracción nos ayuda a definir qué entidades constituyen nuestro programa
  considerando la relación que se establece entre los creadores y los usuarios
  de los módulos.

- Esto es así porque los usuarios de un módulo quieren usar éste como una
  abstracción: sabiendo qué hace (su función) pero sin necesidad de saber cómo
  lo hace (sus detalles internos).

- Los módulos definidos como abstracciones son más fáciles de usar, diseñar y
  mantener.

## Ocultación de información

- David Parnas introdujo el concepto de ocultación de información en 1972.

- Afirmó que el criterio principal para la modularización de un sistema debe
  ser la **ocultación de decisiones de diseño complejas o que puedan cambiar**,
  es decir, que los módulos se deben caracterizar por ocultar decisiones de
  diseño a los demás módulos.

- Ocultar la información de esa manera aísla a los usuarios de un módulo de
  necesitar un conocimiento íntimo del diseño interno del mismo para poder
  usarlo.

- También los aísla de los posibles efectos de cambiar esas decisiones
  posteriormente.

- Implica que la modularidad efectiva se logra definiendo un conjunto de
  módulos independientes que intercambien sólo aquella información
  estrictamente necesaria para que el programa funcione.

---

- La abstracción ayuda a definir qué entidades constituyen el software.

- La ocultación define y hace cumplir las restricciones de acceso a los
  componentes de un módulo; es decir: define qué cosas deben ser públicas y qué
  no.

- En definitiva: que **para que un módulo *A* pueda usar a otro *B*, *A* tiene
  que conocer de *B* lo menos posible**, lo imprescindible. *B* debe ocultar al
  exterior los detalles internos de implementación y exponer sólo lo necesario
  para que otros lo puedan utilizar. Ésto aísla a los clientes de los posibles
  cambios internos que pueda haber posteriormente en *B*.

- Cada módulo es una **caja negra** recelosa de su privacidad que tiene
  «aversión» por exponer sus interioridades a los demás.

---

- La diferencia entre la **abstracción** y la **ocultación de información** se
  puede resumir también de la siguiente forma:

  - Al **usuario** de un módulo le interesa la **abstracción** porque le
    permite usar el módulo conociendo de él sólo lo imprescindible e ignorando
    los detalles superfluos de implementación.

  - Al **creador** del módulo le interesa el **principio de ocultación de
    información** porque si los usuarios de su módulo conocen más detalles de
    los necesarios para poder usarlo, el creador no podrá cambiarlos luego
    (cuando lo necesite o cuando lo desee) sin afectar a los usuarios de su
    módulo.

## Independencia funcional

- La independencia funcional se logra desarrollando módulos de manera que cada
  módulo resuelva una funcionalidad específica y tenga una interfaz sencilla
  cuando se vea desde otras partes de del programa (idealmente, mediante paso
  de parámetros).

  - De hecho, la interfaz del módulo debe estar destinada únicamente a cumplir
    con esa funcionalidad.

- Al limitar su objetivo, el módulo necesita menos ayuda de otros módulos.

- Y por eso el módulo debe ser tan independiente como sea posible del resto de
  los módulos del programa, es decir, que dependa lo menos posible de lo que
  hagan otros módulos, y también que dependa lo menos posible de los datos que
  puedan facilitarle otros módulos.

- Dicho de otra forma: los módulos deben centrarse en resolver un problema
  concreto (ser «monotemáticos»), deben ser «antipáticos» y tener «aversión» a
  relacionarse con otros módulos.

---

- Los módulos independientes son más fáciles de desarrollar porque la función
  del programa se subdivide y las interfaces se simplifican, por lo que se
  pueden desarrollar por separado.

- Los módulos independientes son más fáciles de mantener y probar porque los
  efectos secundarios causados por el diseño o por la modificación del código
  son más limitados, se reduce la propagación de errores y es posible obtener
  módulos reutilizables.

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

- En un módulo cohesivo, sus componentes están fuertemente relacionados entre
  sí y pertenencen al módulo por una razón lógica (no están ahí por
  casualidad), es decir, todos cooperan para alcanzar un objetivo común que es
  la función del módulo.

- Un módulo cohesivo mantiene unidos (*atrae*) los componentes que están
  relacionados entre ellos y mantiene fuera (*repele*) el resto.

---

- En pocas palabras, un módulo cohesivo debe tener un único objetivo, y todos
  los elementos que lo componen contrubuyen a alcanzar dicho objetivo.

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

  - La complejidad de la interfaz entre los módulos

  - El punto en el que se entra o se hace referencia a un módulo
  
  - Los datos que se pasan a través de la interfaz

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

- No hace falta determinar con precisión qué cohesión tenemos. Lo importante es
  intentar conseguir una cohesión alta y reconocer cuándo hay poca cohesión
  para modificar el diseño y conseguir una mayor independencia funcional.

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
  parámetro es la única data compartida (por ejemplo, pasando un entero a una
  función que calcula una raíz cuadrada).

- **Sin acoplamiento**: ocurre cuando los módulos no se comunican para nada uno
  con otro.

## Reusabilidad

- La **reusabilidad** es un factor de calidad del software que se puede aplicar
  tambien a sus componentes o módulos.

- Un módulo es **reusable** cuando puede aprovecharse para ser utilizado (tal
  cual o con muy poca modificación) en varios programas.

- A la hora de diseñar módulos (o de descomponer un programa en módulos) nos
  interesará que los módulos resultantes sean cuanto más reusables mejor.

- Para ello, el módulo en cuestión debe ser lo suficientemente general y
  resolver un problema patrón que sea suficientemente común y se pueda
  encontrar en varios contextos y programas diferentes.

- Además, para aumentar la reusabilidad, es conveniente que el módulo tenga un
  bajo acoplamiento y, por tanto, no depender de otros módulos del programa.

---

- Esos módulos incluso podrían luego formar parte de una *biblioteca* o
  *repositorio* de módulos y ponerlos a disposición de los programadores para
  que puedan usarlos en sus programas.

- A día de hoy, el desarrollo de programas se basa en gran medida en
  seleccionar y utilizar módulos (o bibliotecas, *librerías* o *paquetes*)
  desarrollados por terceros o reutilizados de otros programas elaborados por
  nosotros mismos anteriormente.

- Es decir: la programación se ha convertido en una actividad consistente
  principalmente en ir combinando componentes intercambiables.

- Eso nos permite acortar el tiempo de desarrollo porque podemos construir un
  programa a base de ir ensamblando módulos reusables como si fueran las piezas
  del engranaje de una máquina.

!BIBLIOGRAFIA
