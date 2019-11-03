---
title: Programación modular I
author: Ricardo Pérez López
!DATE
---

# Introducción

## Modularidad

- La **programación modular** es una técnica de programación que consiste en
  descomponer y programar nuestro programa en partes llamadas **módulos**.

- Equivale a la técnica clásica de resolución de problemas basada en
  descomponer un problema en subproblemas y resolver cada subproblema por
  separado para así obtener la solución al problema original.

- La **modularidad** es la propiedad que tienen los programas escritos
  siguiendo los principios de la programación modular.

- El concepto de modularidad se puede estudiar a nivel metodológico y a nivel
  práctico.

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
  que se ajusta a esa definición (salvo que no habría *descomposición física*,
  aunque se podría colocar cada función en un archivo separado y entonces sí).

- Sin embargo, descomponer un programa en partes usando únicamente como
  criterio la descomposición funcional no resulta adecuado en general, ya que
  muchas veces nos encontramos con funciones que no actúan por separado, sino
  que actúan de forma conjunta formando un todo interrelacionado.

- Además, un módulo no tiene por qué ser simplemente una abstracción funcional,
  sino que también puede tener su propio estado interno, manipulable desde
  dentro del módulo pero también desde fuera.

---

- Por ejemplo, supongamos un conjunto de funciones que manipulan números
  racionales.

- Tendríamos funciones para crear racionales, para sumarlos, para
  multiplicarlos, para simplificarlos... Y todas esas funciones trabajarían
  conjuntamente, actuando sobre el mismo conjunto de datos (la representación
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

  - Una función no es una candidata con suficiente entidad como para ser
    considerada un módulo, en general.

  - Los módulos, generalmente, agrupan colecciones de **funciones
    interrelacionadas**.

  - Los módulos, generalmente, también poseen un **estado interno** manipulable
    desde el interior del módulo así como desde el exterior del mismo usando
    las funciones que forman el módulo.

  - A nivel práctico, los módulos se programan físicamente en **archivos
    separados** del resto del programa.

## Descomposición de problemas

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

## Abstracción

## Ocultación de información

## Independencia funcional

### Cohesión

### Acoplamiento

## Reusabilidad

# Diagramas de estructura

