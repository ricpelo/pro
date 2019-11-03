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

# Partes de un módulo

## Introducción

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

## Interfaz

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

## Implementación

- La implementación es la parte del módulo que queda oculta a los usuarios del
  mismo.

- Es decir: es la parte que los usuarios del módulo no necesitan (ni deben)
  conocer para poder usarlo adecuadamente.

- Está formado por todas las variables locales al módulo que almacenan su
  estado interno, junto con las funciones que utiliza el propio módulo para
  gestionarse a sí mismo y que no forman parte de su interfaz.

- La implementación debe poder cambiarse tantas veces como sea necesario sin
  que por ello se tenga que cambiar el resto del programa.

## Documentación interna

# Importación de módulos

# Paquetes

# Criterios de descomposición modular

## Abstracción

## Ocultación de información

## Independencia funcional

### Cohesión

### Acoplamiento

## Reusabilidad

# Diagramas de estructura

