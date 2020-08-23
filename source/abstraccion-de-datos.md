---
title: Abstracción de datos
author: Ricardo Pérez López
!DATE
nocite: |
  @python_software_foundation_sitio_nodate, @abelson_structure_1996, @denero_composing_nodate, @pena_mari_diseno_2003
---

# Introducción

## Introducción

- Hemos visto que una buena modularidad se apoya en tres conceptos:

  - **Abstracción**: los usuarios de un módulo necesitan saber qué hace pero no
    cómo lo hace.

  - **Ocultación de información**: los módulos deben ocultar sus decisiones de
    diseño a sus usuarios.

  - **Independencia funcional**: los módulos deben dedicarse a alcanzar un
    único objetivo, con una alta cohesión entre sus elementos y un bajo
    acoplamiento con el resto de los módulos.

- Vamos a estudiar con más detalle el primero de ellos: la abstracción.

---

- Hasta ahora hemos estudiado la abstracción como un proceso mental que ayuda a
  estudiar y manipular sistemas complejos *destacando* los detalles relevantes
  e *ignorando* momentáneamente los demás que ahora mismo no tienen importancia
  o no son necesarias.

- Asimismo, hemos visto que la abstracción se define por niveles, es decir, que
  cuando estudiamos un sistema a un determinado nivel:

  - Se *destacan* los detalles relevantes en ese nivel.

  - Se *ignoran* los detalles irrelevantes en ese nivel. Si descendemos de
    nivel de abstracción, es probable que algunos de esos detalles pasen a ser
    relevantes.

- Los programas son sistemas complejos, así que resulta importante que el
  lenguaje de programación nos permita estudiar y diseñar programas mediante
  sucesivos niveles de abstracción.

---

- La abstracción es un proceso pero también un producto: es algo que puede
  formar parte de un programa.

- Hasta ahora, las únicas abstracciones que hemos utilizado y creado son las
  **funciones**, también llamadas **abstracciones funcionales**.

- Una función es una abstracción porque el usuario de la función sólo necesita
  conocer la **especificación** de la abstracción (el *qué* hace) y puede
  ignorar el resto de los detalles de **implementación** que se encuentran en
  el cuerpo de la función (el *cómo* lo hace).

- Por eso decimos que las funciones definen dos niveles de abstracción.

- En otras palabras, al diseñar una función estamos creando una abstracción que
  separa la forma en la que se utiliza la función de la forma en como está
  implementada esa función.

---

- Las abstracciones funcionales son un mecanismo que nos permite:

  #. componer una **operación compleja** combinando otras operaciones más
     simples,

  #. darle un nombre a todo el conjunto, y

  #. poder usar esa nueva operación compleja sin necesidad de conocer cómo está
     hecha por dentro (es decir, sin necesidad de conocer cuáles son esas
     operaciones más simples que la forman, que son detalles que quedan ocultos
     al usuario).

- Una vez que la función se ha diseñado y se está utilizando, se puede
  sustituir por cualquier otra que tenga el mismo comportamiento observable.

---

- Además de combinar operaciones, también podemos **combinar datos**.

- Los **datos compuestos o estructurados** son un mecanismo que nos permite
  crear un **dato complejo** combinando otros datos más simples, formando una
  única unidad conceptual.

- Pero, por desgracia, estos datos compuestos **no ocultan sus detalles de
  implementación al usuario**, sino que éste tiene que conocer cómo está
  construido.

- Es decir: los datos compuestos, así sin más, no funcionan como abstracciones.

---

- Por ejemplo, podemos representar un número racional $\frac{a}{b}$ mediante
  una pareja de números enteros $a$ y $b$ (su numerador y su denominador).

- Si almacenamos los dos números por separado no estaremos creando una sola
  unidad conceptual (no estaremos componiendo un nuevo dato a partir de otros
  datos más simples).

- Eso no resulta conveniente. A nosotros, como programadores, nos interesa que
  el numerador y el denominador de un número racional estén juntos formando una
  sola cosa, un nuevo valor: un número racional.

---

- Así que podríamos representar dicha pareja de números usando una lista como
  `[`$a$`, ` $b$`]`, o una tupla `(`$a$`, ` $b$`)`, o incluso un diccionario \
  `{'numer': ` $a$`, 'denom': ` $b$`}`.

- Pero estaríamos obligando al usuario de nuestros números racionales a tener
  que saber cómo representamos los racionales en función de otros tipos más
  primitivos, lo que nos impide cambiar luego esa representación sin afectar al
  resto del programa.

- Es decir: les estamos obligando a conocer detalles de implementación de
  nuestros números racionales.

---

- Por ejemplo, si representamos un racional como dos números enteros separados,
  no podríamos escribir una función que multiplique dos racionales
  $\frac{n_1}{d_1}$ y $\frac{n_2}{d_2}$ ya que dicha función tendría que
  devolver dos valores, el numerador y el denominador del resultado:

  ```python
  def mult_rac(n1, d1, n2, d2):
      return ????
  ```

- Si representamos un racional $\frac{n}{d}$ con, por ejemplo, una tupla
  `(`$n$`, ` $d$`)`, la función que multiplica dos racionales podría ser:

  ```python
  def mult_rac(r1, r2):
      return (r1[0] * r2[0], r1[1] * r2[1])
  ```

  Es decir, que la función tendría que saber que el racional se representa
  internamente con una tupla, y que el numerador es el primer elemento y que el
  denominador es el segundo elemento.

---

- Nos interesa que nuestro programa sea capaz de expresar el concepto de
  «número racional» y que pueda manipular números racionales como valores con
  entidad propia y definida, no simplemente como parejas de números enteros,
  independientemente de su representación interna.

- Para todo esto, es importante que el programa que utilice los números
  racionales no necesite conocer los detalles internos de cómo está
  representado internamente un número racional.

- Es decir: que los números racionales se pueden representar internamente como
  una lista de dos números, o como una tupla, o como un diccionario, o de
  cualquier otro modo, pero ese detalle interno debe quedar oculto para los
  usuarios de los números racionales.

- La técnica general de aislar las partes de un programa que se ocupan de *cómo
  se representan* los datos de las partes que se ocupan de *cómo se usan* los
  datos es una poderosa metodología de diseño llamada **abstracción de datos**.

---

- La **abstracción de datos** es una **técnica** pero también es un
  **producto**.

- Diseñar programas usando la técnica de la abstracción de datos da como
  resultado la creación y utilización de **tipos abstractos de datos** (o
  **TAD**), a los que también se les denomina **abstracciones de datos**.

- Por tanto, las abstracciones de datos son construcciones que acaban formando
  parte del programa, de la misma manera que ocurre con las abstracciones
  funcionales.

---

- La abstracción de datos se parece a la abstracción funcional:

  - Cuando creamos una **abstracción funcional**, se ocultan los detalles de
    cómo se implementa una función, y esa función particular se puede sustituir
    luego por cualquier otra función que tenga el mismo comportamiento general
    sin que los usuarios de la función se vean afectados.

    En otras palabras, podemos hacer una abstracción que separe la forma en que
    _se utiliza_ la función de los detalles de cómo _se implementa_ la función.

  - Igualmente, la **abstracción de datos** separa el uso de un dato compuesto
    de los detalles de cómo está construido ese dato compuesto, que quedan
    ocultos para los usuarios de la abstracción de datos.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Para usar una abstracción de datos no necesitamos conocer sus detalles internos
de implementación.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

--------------------------------------------------------------------------------
Elementos del lenguaje      Instrucciones               Datos
--------------------------- --------------------------- ------------------------
Primitivas                  Definiciones y sentencias   Literales y datos 
                            simples                     simples (enteros,
                                                        reales, booleanos...)

Mecanismos de combinación   Expresiones y sentencias    Datos compuestos
                            compuestas (estructuras     (listas, tuplas...)
                            de control)

Mecanismos de abstracción   Abstracciones funcionales   Abstracciones de datos
                            (funciones)                 (tipos abstractos)
--------------------------------------------------------------------------------

---

- El concepto de **abstracción de datos** (o **tipo abstracto de datos**) fue
  propuesto por John Guttag en 1974 y dice que:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~
  **Tipo abstracto de datos**

  Un **tipo abstracto de datos** (o **_abstracción de datos_**) es un conjunto
  de valores y de operaciones que se definen mediante una **especificación**
  que es independiente de cualquier representación.
  ~~~~~~~~~~~~~~~~~~~~~~

- Para ello, los tipos abstractos de datos se definen nombrando, no sus
  valores, sino sus **operaciones** y las **propiedades** que cumplen éstas.

- Los **valores** de un tipo abstracto se definen también como operaciones.

---

- Por ejemplo, `set` es un tipo primitivo en Python que actúa como un tipo
  abstracto de datos:

  - Se nos proporcionan **operaciones primitivas** para crear conjuntos y
    manipular conjuntos (unión, intersección, etc.) y también un modo de
    visualizar sus valores.

  - Pero no sabemos, ni necesitamos saber, cómo se representan internamente los
    conjuntos en la memoria del ordenador. Ese es un detalle interno del
    intérprete.

- En general, el programador que usa un tipo abstracto puede no saber (e
  incluso se le impide saber) cómo se representan los elementos del tipo de
  datos.

- Esas **barreras de abstracción** son muy útiles porque permiten cambiar la
  representación interna sin afectar a las demás partes del programa que
  utilizan dicho tipo abstracto.

---

- En resumen, tenemos que un tipo abstracto debe cumplir:

  - **Privacidad de la representación**: los usuarios no conocen cómo se
    representan los valores del tipo abstracto en la memoria del ordenador.

  - **Protección**: sólo se pueden utilizar con sus valores aquellas
    operaciones previstas en la especificación.

---

- El programador de un tipo abstracto debe crear, por tanto, dos partes bien
  diferenciadas:

  #. **La _especificación_ del tipo:** única parte que conoce el usuario del
     mismo y que consiste en:
  
     - El **nombre** del tipo.
    
     - La especificación de las **operaciones** permitidas. Esta especificación
       tendrá:

       - Una parte **sintáctica**: la **signatura** de cada operación.

       - Otra parte **semántica**: que define las **propiedades** que deben
         cumplir dichas operaciones y que se pueden expresar mediante
         **ecuaciones** o directamente en lenguaje natural.

  #. **La _implementación_ del tipo:** conocida sólo por el programador del
     mismo y que consiste en la *representación* del tipo por medio de otros
     tipos y en la implementación de las operaciones.

---

> «Son las especificaciones, y no los programas, los que realmente describen
> una abstracción; los programas simplemente la implementan.»
>
> -- Barbara Liskov

# Especificaciones

## Sintaxis

:::: columns

::: {.column width=45%}

- La sintaxis de una **especificación algebraica** es la siguiente:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~
!T(espec) !NT(tipo)
      [!T(parámetros)
            !NT(parámetro)+]
      !T(operaciones)
            \(!NT{operación} !T{:} !NT{signatura}\)+
      [!T(var)
            !NT(decl_var) \(!T(;) !NT(decl_var)\)*]
      !T(ecuaciones)
            !NT(ecuación)+
~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=5%}

:::

::: {.column width=45%}

- Donde:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~
!NT(decl_var) ::= !NT{variable} !T{:} !NT{tipo}
!NT(ecuación) ::= !NT(izquierda) $\doteq$ !NT(derecha)
~~~~~~~~~~~~~~~~~~~~~~~

- Las **operaciones** son **abstracciones funcionales**.

- Las **ecuaciones** son las **propiedades** que deben cumplir las operaciones.

:::

::::

## Operaciones

- Las operaciones que forman parte de la especificación de un tipo abstracto
  $T$ pueden clasificarse en estas categorías:

  - **Constructoras**: operaciones que devuelven un valor de tipo $T$.

    A su vez, las constructoras se dividen en:

    - **Generadoras**: son aquellas operaciones constructoras que tienen la
      propiedad de que sólo con ellas es suficiente para generar cualquier
      valor del tipo, y excluyendo cualquiera de ellas hay valores que no
      pueden ser generados.

    - **Modificadoras**: son las operaciones constructoras que no forman parte
      del conjunto de las generadoras.

  - **Selectoras**: operaciones que toman como argumento uno o más valores de
    tipo $T$ y que no devuelven un valor de tipo $T$.

## Ejemplos

- Un ejemplo de especificación de las **listas** como tipo abstracto sería:

:::: columns

::: column

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _lista_
    **parámetros**
          _elemento_
    **operaciones**
          `[]` : $\rightarrow$ _lista_
          `[`_`]` : _elemento_ $\rightarrow$ _lista_
          \_`++`\_ : _lista_ $\times$ _lista_ $\rightarrow$ _lista_
          \_`:`\_ : _elemento_ $\times$ _lista_ $\rightarrow$ _lista_
          `len` : _lista_ $\rightarrow$ $\mathbb{N}$
    **var**
          $x$ : _elemento_; $l, l_1, l_2, l_3$ : _lista_
    **ecuaciones**
          $x$ `:` $l$ $\doteq$ `[`$x$`]` `++` $l$
          $l$ `++` `[]` $\doteq$ $l$
          `[]` `++` $l$ $\doteq$ $l$
          ($l_1$ `++` $l_2$) `++` $l_3$ $\doteq$ $l_1$ `++` ($l_2$ `++` $l_3$)
          `len`(`[]`) $\doteq$ 0
          `len`(`[`$x$`]`) $\doteq$ 1
          `len`($x$ `:` $l$) $\doteq$ 1 + `len`($l$)
          `len`($l_1$ `++` $l_2$) $\doteq$ `len`($l_1$) + `len`($l_2$)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- La ecuación $t_1 \doteq t_2$ significa que el valor construido mediante $t_1$
  es *el mismo* que el construido mediante $t_2$.

- Este estilo de especificación se denomina **especificación algebraica**.

- Su principal virtud es que permite definir un nuevo tipo de forma *totalmente
  independiente* de cualquier posible representación o implementación.

:::

::::

---

!EJERCICIO

@. ¿A qué categoría pertenencen cada una de esas operaciones?

---

- Al definir y usar abstracciones de datos, seguiremos el enfoque propio de la
  **programación funcional**, donde:

  - **No existe mutabilidad** ni estado interno ni cambios de estado.

  - En lugar de cambiar el estado de un dato compuesto, se «simula» ese cambio
    creando un nuevo dato con los cambios aplicados.

- Por ejemplo: la operación `:` (que añade un elemento al principio de una
  lista) realmente no modifica dicha lista sino que crea una nueva lista con el
  elemento situado al principio, y la devuelve.

- Esto lo podemos expresar en la especificación de la lista con la siguiente
  ecuación (siendo $x$ un elemento y $l$ una lista):

  $x$ `:` $l$ $\doteq$ `[`$x$`]` `++` $l$

  Se puede observar que no se modifica la lista $l$ para añadir el elemento $x$
  al principio, sino que se crea una lista nueva por concatenación de otras
  dos.

---

- ¿Crees que hay ecuaciones que sobran? ¿Se podría crear una especificación
  equivalente pero más corta, de forma que tenga menos ecuaciones pero que se
  comporte exactamente igual que la anterior?

- En realidad, en la especificación anterior hay ecuaciones que no son
  estrictamente necesarias ya que se pueden deducir a partir de otras que sí lo
  son:

  - Las ecuaciones que son necesarias representan **axiomas** de nuestro
    sistema.

  - Las ecuaciones que se pueden deducir de otras representan **teoremas** de
    nuestro sistema.

- Bastaría con tener una especificación algebraica basada en axiomas y que
  dependan únicamente de operaciones generadoras.

---

:::: columns

::: column

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _lista_
    **parámetros**
          _elemento_
    **operaciones**
          `[]` : $\rightarrow$ _lista_
          \_`:`\_ : _elemento_ $\times$ _lista_ $\rightarrow$ _lista_
          `[`_`]` : _elemento_ $\rightarrow$ _lista_
          \_`++`\_ : _lista_ $\times$ _lista_ $\rightarrow$ _lista_
          `len` : _lista_ $\rightarrow$ $\mathbb{N}$
    **var**
          $x$ : _elemento_; $l, l_1, l_2$ : _lista_
    **ecuaciones**
          `[`$x$`]` $\doteq$ $x$ `:` `[]`
          `[]` `++` $l$ $\doteq$ $l$
          ($x$ `:` $l_1$) `++` $l_2$ $\doteq$ $x$ `:` ($l_1$ `++` $l_2$)
          `len`(`[]`) $\doteq$ 0
          `len`($x$ `:` $l$) $\doteq$ 1 + `len`($l$)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- En el ejemplo de las listas, las **operaciones generadoras** son `[]` y
  \_`:`\_.

- El resto de las operaciones se definen a partir de ellas.

- Las ecuaciones que aparecen ahora en esta especificación son los **axiomas**
  de la misma, y las que hemos quitado son **teoremas** que se pueden deducir
  (*demostrar*) a partir de otras ecuaciones.

:::

::::

---

- Por ejemplo, supongamos que queremos demostrar que se cumple la siguiente
  ecuación (que apareció antes en la primera especificación de *lista*):

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~
  $l$ `++` `[]` $\doteq$ $l$
  ~~~~~~~~~~~~~~~~~~~~

  siendo $l$ una lista cualquiera.

- Para ello, tenemos que recordar que una lista sólo puede tener dos formas
  posibles:

  - Una lista vacía:

    `[]`

  - Un elemento seguido de otra lista:

    $x$ `:` $l_1$

- Por ejemplo, la lista `[1, 2, 3]` es 1`:`(2`:`(3`:[]`)).

---

- Se puede demostrar por inducción sobre $l$, a partir de los axiomas de la
  especificación de *lista*:

  a. Caso $l$ = `[]` (caso base):

     ----------------------- ---------------------------------
     $l$ `++` `[]`           # _por definición de $l$_

     $\doteq$ `[]` `++` `[]` # _por el primer axioma de `++`_

     $\doteq$ `[]`           # _por definición de $l$_

     $\doteq$ $l$
     ----------------------- ---------------------------------

  b. Caso $l$ = $x$ `:` $l_1$ (caso inductivo):

     Suponemos que la propiedad se cumple para $l_1$ (hipótesis inductiva), es
     decir, que $l_1$ `++` `[]` $\doteq$ $l_1$. En tal caso, tenemos:

     ---------------------------------- ----------------------------------
     $l$ `++` `[]`                      # _por definición de $l$_
 
     $\doteq$ ($x$ `:` $l_1$) `++` `[]` # _por el segundo axioma de `++`_
 
     $\doteq$ $x$ `:` ($l_1$ `++` `[]`) # _por hipótesis inductiva_

     $\doteq$ $x$ `:` $l_1$             # _por definición de $l$_
 
     $\doteq$ $l$
     ---------------------------------- ----------------------------------

---

- Como hemos demostrado que $l$ `++` `[]` $\doteq$ $l$ para cualquiera de las
  dos formas posibles que puede tener $l$, hemos logrado demostrar la propiedad
  para cualquier valor de $l$.

---

:::: columns

::: column

- Las **pilas** como tipo abstracto se podrían especificar así:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _pila_
    **parámetros**
          _elemento_
    **operaciones**
          `pvacia` : $\rightarrow$ _pila_
          `apilar` : _pila_ $\times$ _elemento_ $\rightarrow$ _pila_
          **parcial** `cima` : _pila_ $\rightarrow$ _elemento_
          **parcial** `desapilar` : _pila_ $\rightarrow$ _pila_
          `vacia?` : _pila_ $\rightarrow$ $\mathfrak{B}$
    **var**
          $p$ : _pila_; $x$ : _elemento_
    **ecuaciones**
          `cima`(`apilar`($p$, $x$)) $\doteq$ $x$
          `desapilar`(`apilar`($p$, $x$)) $\doteq$ $p$
          `vacia?`(`pvacia`) $\doteq$ $V$
          `vacia?`(`apilar`($p$, $x$)) $\doteq$ $F$
          `cima`(`pvacia`) $\doteq$ $error$
          `desapilar`(`pvacia`) $\doteq$ $error$
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- En esta especificación aparecen **operaciones parciales**, que son aquellas
  que no se pueden aplicar a cualquier operando.

- Por ejemplo, no se puede (no tiene sentido) calcular la cima de una pila
  vacía o desapilar una pila vacía. En ambos casos obtenemos un error.

- Por tanto, ambas operaciones son *parciales*, porque no se pueden aplicar
  sobre cualquier tipo de pila (sólo se puede sobre las *no vacías*).

:::

::::

---

- Un programa que hiciera uso de las pilas, una vez implementado el tipo
  abstracto de datos, podría ser:

  ```python
  p = pvacia()        # crea una pila vacía
  p = apilar(p, 4)    # apila el valor 4 en la pila p
  p = apilar(p, 8)    # apila el valor 8 en la pila p
  print(vacia(p))     # imprime False
  print(cima(p))      # imprime 8
  p = desapilar(p)    # desapila el valor 8 de la pila p
  print(cima(p))      # imprime 4
  p = desapilar(p)    # desapila el valor 4 de la pila p
  print(vacia(p))     # imprime True
  print(cima(pvacia)) # error
  ```

- El programa usa la pila a través de las operaciones sin necesidad de conocer
  su representación interna (su implementación).

  Es decir: no necesitamos saber cómo está hecha la pila por dentro, ni cómo
  están programadas las funciones `pvacia`, `apilar`, `cima` y `desapilar`.

  Nos basta con saber las propiedades que deben cumplir esas funciones, y eso
  viene definido en la especificación.

---

- Los **números racionales** se podrían especificar así:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _rac_
    **operaciones**
          **parcial** `racional` : $\mathbb{Z}$ $\times$ $\mathbb{Z}$ $\rightarrow$ _rac_
          `numer` : _rac_ $\rightarrow$ $\mathbb{Z}$
          `denom` : _rac_ $\rightarrow$ $\mathbb{Z}$
          `suma`  : _rac_ $\times$ _rac_ $\rightarrow$ _rac_
          `mult`  : _rac_ $\times$ _rac_ $\rightarrow$ _rac_
          `iguales?` : _rac_ $\times$ _rac_ $\rightarrow$ $\mathfrak{B}$
          `imprimir` : _rac_ $\rightarrow$ $\emptyset$
    **var**
          $r$ : _rac_; $n$, $d$, $n_1$, $n_2$, $d_1$, $d_2$ : $\mathbb{Z}$
    **ecuaciones**
          `numer`(`racional`($n$, $d$)) $\doteq$ $n$
          `denom`(`racional`($n$, $d$)) $\doteq$ $d$
          `suma`(`racional`($n_1$, $d_1$), `racional`($n_2$, $d_2$)) $\doteq$ `racional`($n_1\cdot{}d_2 + n_2\cdot{}d_1$, $d_1\cdot{}d_2$)
          `mult`(`racional`($n_1$, $d_1$), `racional`($n_2$, $d_2$)) $\doteq$ `racional`($n_1\cdot{}n_2$, $d_1\cdot{}d_2$)
          `iguales?`(`racional`($n_1$, $d_1$), `racional`($n_2$, $d_2$)) $\doteq$ $n_1\cdot{}d_2 = n_2\cdot{}d_1$
          `imprimir`($r$) \ \ \{ imprime el racional $r$ \}
          `racional`($n$, 0) $\doteq$ $error$
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- La operación `imprimir` es un caso especial, ya que **no es una operación
  _pura_**, sino que su finalidad es la de provocar el **efecto lateral** de
  imprimir por la salida un número racional de forma «bonita».

- Por eso no devuelve ningún valor, cosa que se refleja en su signatura usando
  $\emptyset$ como tipo de retorno de la operación:

`imprimir` : _rac_ $\rightarrow$ $\emptyset$

- Y el *efecto* que produce se indica entre llaves en el apartado de
  ecuaciones:

`imprimir`($r$) \ \ \{ imprime el racional $r$ \}

- Introducir **operaciones _impuras_** amplía la funcionalidad de nuestro tipo
  abstracto, pero hay que tener cuidado porque se pierde la transparencia
  referencial y, con ello, nuestra capacidad para razonar matemáticamente sobre
  las especificaciones.

---

- Según la especificación anterior, podemos suponer que disponemos de un
  constructor y dos selectores a través de las siguientes funciones:

  - `racional(`$n$`, `$d$`)`: devuelve el número racional con numerador $n$ y
    denominador $d$.

  - `numer(`$x$`)`: devuelve el numerador del número racional $x$.

  - `denom(`$x$`)`: devuelve el denominador del número racional $x$.

- Todas las demás operaciones se podrían definir como funciones a partir de
  éstas tres.

- Estamos usando una estrategia poderosa para diseñar programas: el
  **pensamiento optimista**, ya que todavía no hemos dicho cómo se representa
  un número racional, o cómo se deben implementar las funciones `numer`,
  `denom` y `racional`.
  
- Nos basta con saber *qué* hacen y *suponer* que ya las tenemos.

---

- Así, podemos definir las funciones `suma`, `mult`, `imprimir` e `iguales?` a
  partir de `racional`, `numer` y `denom` sin necesidad de saber cómo están
  implementadas esas tres funciones ni cómo se representa internamente un
  número racional.

- Esos detalles de implementación quedan ocultos y son innecesarios para
  definir las funciones `suma`, `mult`, `imprimir` e `iguales?`, ya que
  bastaría con saber *qué* hacen las funciones `racional`, `numer` y `denom` y
  no *cómo* lo hacen.

- Hasta el punto de que ni siquiera hace falta tener implementadas aún las
  funciones `racional`, `numer` y `denom` para poder definir las demás.
  **Suponemos** que las tenemos (*pensamiento optimista*).

---

- Una posible implementación en Python de las operaciones `suma`, `mult`,
  `imprimir` e `iguales?` a partir de `racional`, `numer` y `denom` podría ser
  la siguiente:

  ```python
  def suma(x, y):
      nx, dx = numer(x), denom(x)
      ny, dy = numer(y), denom(y)
      return racional(nx * dy + ny * dx, dx * dy)

  def mult(x, y):
      return racional(numer(x) * numer(y), denom(x) * denom(y))

  def iguales(x, y):
      return numer(x) * denom(y) == numer(y) * denom(x)

  def imprimir(x):
      print(numer(x), '/', denom(x), sep='')
  ```

- Esta implementación es correcta porque se ha obtenido a partir de la
  especificación de los racionales, y en cuanto se tengan implementadas las
  funciones `racional`, `numer` y `denom`, funcionará perfectamente.

# Implementaciones

## Implementaciones

- Ahora tenemos las operaciones sobre números racionales implementadas sobre
  las funciones selectoras `numer` y `denom` y la función constructora
  `racional`, pero aún no hemos implementado estas tres funciones.
  
- Lo que necesitamos es alguna forma de unir un numerador y un denominador en
  un valor compuesto (una pareja de números).

- Podemos usar cualquier representación que nos permita combinar ambos valores
  (numerador y denominador) en una sola unidad y que también nos permita
  manipular cada valor por separado cuando sea necesario.

---

- Por ejemplo, podemos usar una lista de dos números enteros para representar
  un racional mediante su numerador y su denominador:

  ```python
  def racional(n, d):
      """Un racional es una lista que contiene el numerador y el denominador."""
      return [n, d]

  def numer(x):
      """El numerador es el primer elemento de la lista."""
      return x[0]

  def denom(x):
      """El denominador es el segundo elemento de la lista."""
      return x[1]
  ```

- Junto con las operaciones aritméticas que definimos anteriormente, podemos
  manipular números racionales con las funciones que hemos definido y sin tener
  que conocer su representación interna:

  ```python
  >>> medio = racional(1, 2)
  >>> imprimir(medio)
  1/2
  >>> tercio = racional(1, 3)
  >>> imprimir(mult(medio, tercio))
  1/6
  >>> imprimir(suma(tercio, tercio))
  6/9
  ```

---

- Como muestra el ejemplo anterior, nuestra implementación de números
  racionales no simplifica las fracciones resultantes.

- Podemos corregir ese defecto cambiando únicamente la implementación de
  `racional`.

- Usando el máximo común divisor podemos reducir el numerador y el denominador
  para obtener un número racional equivalente:

  ```python
  from math import gcd 

  def racional(n, d): 
      g = gcd(n, d)
      return [n // g, d // g]   
  ```

- Con esta implementación revisada de `racional` nos aseguramos de que los
  racionales se expresan de la forma más simplificada posible:

  ```python
  >>> imprimir(suma(tercio, tercio))
  2/3
  ```

---

- Lo interesante es que este cambio sólo ha afectado al constructor `racional`,
  y las demás operaciones no se han visto afectadas por ese cambio.

- Esto es así porque el resto de las operaciones no conocen ni necesitan
  conocer la representación interna de un número racional (es decir, la
  implementación del constructor `racional`). Sólo necesitan conocer la
  **especificación** de `racional`, la cual no ha cambiado.

---

- Otra posible implementación sería simplificar el racional no cuando se
  *construya*, sino cuando se *acceda* a alguna de sus partes:

  ```python
  def racional(n, d):
      return [n, d]

  def numer(x):
      g = gcd(x[0], x[1])
      return x[0] // g

  def denom(x):
      g = gcd(x[0], x[1])
      return x[1] // g
  ```

- La diferencia entre esta implementación y la anterior está en cuándo se
  calcula el máximo común divisor.
  
  - Si en los programas que normalmente usan los números racionales accedemos
    muchas veces a sus numeradores y denominadores, será preferible calcular el
    m.c.d. en el constructor.
    
  - En caso contrario, puede que sea mejor esperar a acceder al numerador o al
    denominador para calcular el m.c.d.

  - En cualquier caso, cuando se cambia una representación por otra, las demás
    funciones (`suma`, `mult`, etc.) no necesitan ser modificadas.

---

- Hacer que la representación dependa sólo de unas cuantas funciones de la
  interfaz nos ayuda a diseñar programas, así como a modificarlos, porque nos
  permite cambiar la implementación por otras distintas cuando sea necesario.

- Por ejemplo: si estamos diseñando un módulo de números racionales y aún no
  hemos decidido si calcular el m.c.d. en el constructor o en los selectores,
  la metodología de la abstracción de datos nos permite retrasar esa decisión
  sin perder la capacidad de seguir programando el resto del programa.

- Además, si hoy decidimos calcular el m.c.d. en el constructor pero el día de
  mañana cambiamos de opinión, podemos ponerlo en los selectores sin que el
  resto del programa se vea afectado. Sólo habría que cambiar la implementación
  del tipo abstracto.

# Niveles y barreras de abstracción

## Niveles de abstracción

- Parémonos ahora a considerar algunos de las cuestiones planteadas en el
  ejemplo de los números racionales.

- Hemos definido todas las operaciones de *rac* en términos de un constructor
  `racional` y dos selectores `numer` y `denom`.

  En general, la idea que hay detrás de la **abstracción de datos** es la de:

  #. definir un **nuevo tipo de datos** (abstracto),

  #. identificar un **conjunto básico de operaciones** sobre las cuales se
     expresarán todas las operaciones que manipulen los valores de ese tipo, y
     luego
  
  #. **obligar a usar sólo esas operaciones** para manipular los datos.

- Al obligar a usar los datos únicamente a través de sus operaciones, es mucho
  más fácil cambiar luego la representación interna de los datos abstractos o
  la implementación de las operaciones básicas sin tener que cambiar el resto
  del programa.

---

- Para el caso de los números racionales, diferentes partes del programa
  manipulan números racionales usando diferentes operaciones, como se describe
  en esta tabla:

!SALTO

+--------------------------------+---------------------------------+------------------------------+
| Las partes del programa que... | Tratan a los racionales como... | Usando sólo...               |
+================================+=================================+==============================+
| Usan números racionales        | Valores de datos completos,     | `suma`, `mult`, `iguales`,   |
| para realizar cálculos         | un todo                         | `imprimir`                   |
+--------------------------------+---------------------------------+------------------------------+
| Crean racionales o             | Numeradores y denominadores     | `racional`, `numer`, `denom` |
| implementan operaciones        |                                 |                              |
| sobre racionales               |                                 |                              |
+--------------------------------+---------------------------------+------------------------------+
| Implementan selectores         | Parejas de números              | Literales de tipo lista      |
| y constructores de             | representadas como listas       | `[`\_`]` e indexación        |
| racionales                     | de dos elementos                | \_`[`\_`]`                   |
+--------------------------------+---------------------------------+------------------------------+

## Barreras de abstracción

- Cada una de las filas de la tabla anterior representa un nivel de
  abstracción, de forma que cada nivel usa las operaciones y las facilidades
  ofrecidas por el nivel inmediatamente inferior.

- Dicho de otra forma: en cada nivel, las funciones que aparecen en la última
  columna imponen una **barrera de abstracción**. Estas funciones son usadas
  desde un nivel más alto de abstracción e implementadas usando un nivel más
  bajo de abstracción.

---

!IMGP(barreras-abstraccion.svg)(Barreras de abstracción)(width=75%)(width=55%)

---

- Se produce una **_violación_ de una barrera de abstracción** cada vez que una
  parte del programa que puede utilizar una función de un determinado nivel,
  utiliza una función de un nivel más bajo.

- Por ejemplo, una función que calcula el cuadrado de un número racional se
  implementa mejor en términos de `mult`, que no necesita supone nada sobre
  cómo se implementa un número racional:

  ```python
  def cuadrado(x): 
      return mult(x,x)      
  ```

---

- Si hiciéramos referencia directa a los numeradores y los denominadores,
  estaríamos violando una barrera de abstracción:

  ```python
  def cuadrado_viola_una_barrera(x): 
      return racional(numer(x) * numer(x), denom(x) * denom(x)) 
  ```

- Y si usamos el conocimiento de que los racionales se representan como listas,
  estaríamos violando dos barreras de abstracción:

  ```python
  def cuadrado_viola_dos_barreras(x): 
      return [x[0] * x[0], x[1] * x[1]]    
  ```

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Cuantas menos barreras de abstracción se crucen al escribir programas, mejor.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Las barreras de abstracción hacen que los programas sean más fáciles de
  mantener y modificar.

- Cuantas menos funciones dependan de una representación particular, menos
  cambios se necesitarán cuando se quiera cambiar esa representación.

- Todas las implementaciones de `cuadrado` que acabamos de ver se comportan
  correctamente, pero sólo la primera es lo bastante robusta como para soportar
  bien los futuros cambios de los niveles inferiores.

- La función `cuadrado` no tendrá que cambiarse incluso aunque cambiemos la
  representación interna de los números racionales.

- Por el contrario, `cuadrado_viola_una_barrera` tendrá que cambiarse cada vez
  que cambien las especificaciones del constructor o los selectores, y
  `cuadrado_viola_dos_barreras` tendrá que cambiarse cada vez que cambie la
  representación interna de los números racionales.

## Propiedades de los datos

- Las barreras de abstracción definen de qué forma pensamos sobre los datos.

- Por ejemplo, podemos pensar que las operaciones `suma`, `mult`, etc. están
  definidas sobre *datos* (numeradores, denominadores y racionales) cuyo
  comportamiento está definido por las funciones `racional`, `numer` y `denom`.

- Pero... ¿qué es un *dato*? No basta con decir que es «cualquier cosa
  implementada mediante ciertos constructores y selectores».

- Siguiendo con el mismo ejemplo: es evidente que cualquier grupo de tres
  funciones (un constructor y dos selectores) no sirve para representar
  adecuadamente a los números racionales.

  Además, se tiene que garantizar que, entre el constructor `racional` y los
  selectores `numer` y `denum`, se cumple la siguiente propiedad:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $x$ `=` `racional(`$n$`,`&nbsp; $d$`)`, entonces `numer(`$x$`)/denom(`$x$`)`
  `==` $n/d$ .
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
---

- De hecho, esta es la única condición que deben cumplir las tres funciones
  para poder representar adecuadamente a los números racionales.

- Una representación válida de un número racional no está limitada a ninguna
  implementación particular (como, por ejemplo, una lista de dos elementos),
  sino que nos sirve cualquier implementación que satisfaga la propiedad
  anterior.

- En general, podemos decir que **los datos abstractos se definen mediante una
  colección de constructores y selectores junto con algunas _propiedades_ que
  los datos abstractos deben cumplir**.

- Mientras se cumplan dichas propiedades (como la anterior de la división), los
  constructores y selectores constituyen una representación válida de un tipo
  de datos abstracto.

---

- **Los detalles de implementación** debajo de una barrera de abstracción
  **pueden cambiar**, pero si no cambia su comportamiento, entonces la
  abstracción de datos sigue siendo válida y cualquier programa escrito
  utilizando esta abstracción de datos seguirá siendo correcto.

- Este punto de vista tambíen se puede aplicar, por ejemplo, a las listas que
  hemos usado para implementar números racionales.
  
- En realidad, tampoco hace falta que sea una lista. Nos basta con cualquier
  representación que agrupe una pareja de valores juntos y que nos permita
  acceder a cada valor de una pareja por separado. Es decir, la propiedad que
  tienen que cumplir las parejas es que:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $p$ `=` `pareja(`$x$`,`&nbsp; $y$`)`, entonces `select(`$p$`, 0)` `==` $x$ \
  y `select(`$p$`, 1)` `==` $y$.
  ~~~~~~~~~~~~~~~~~~~~~~~~~

- Tales propiedades se describen como **ecuaciones** en la **especificación
  algebraica** del tipo abstracto.

# Las funciones como datos

## Representación funcional

- Anteriormente, hemos dicho que los datos se caracterizan por las
  **operaciones** (constructoras y selectoras) con las que se manipulan y por
  las **propiedades** que cumplen dichas operaciones, de manera que **podemos
  cambiar los detalles de implementación** bajo una barrera de abstracción
  siempre y cuando no cambiemos su comportamiento.

- Por tanto, bajo esa barrera de abstracción podemos usar cualquier
  implementación siempre y cuando logren que las operaciones que definen dicha
  barrera de abstracción satisfagan las propiedades que deben cumplir.

- Por ejemplo, para representar a los números racionales usamos parejas de
  números, pero esas parejas se pueden representar de muchas maneras. Podemos
  usar listas, pero en general nos sirve cualquier dato definido por un
  constructor `pareja` y un selector `select` que cumpla:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $p$ `=` `pareja(`$x$`,`&nbsp; $y$`)`, entonces `select(`$p$`, 0)` `==` $x$ \
  y `select(`$p$`, 1)` `==` $y$.
  ~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Esas dos operaciones, `pareja` y `select`, que deben cumplir la condición
  antes indicada, formarían otra barrera de abstracción sobre la cual se
  podrían implementar los números racionales:

  ```python
  def racional(x, y):
      return pareja(x, y)

  def numer(r):
      return select(r, 0)

  def denom(r):
      return select(r, 1)
  ```

- A su vez, para implementar las parejas, nos valdría cualquier implementación
  que satisfaga la propiedad que deben cumplir las parejas.

- Por ejemplo, cualquier estructura de datos o tipo compuesto que permita
  almacenar dos elementos juntos y seleccionar cada elemento por separado, como
  una lista, una tupla o algo similar:

  ```python
  def pareja(x, y):
      return [x, y]

  def select(p, i):
      return p[i]
  ```

---

- Pero, de hecho, ni siquiera necesitamos estructuras de datos para representar
  parejas de números. Podemos implementar dos funciones `pareja` y `select` que
  cumplan con la propiedad anterior tan bien como una lista de dos elementos:

  ```python
  def pareja(x, y):
      """Devuelve una función que representa una pareja."""
      def get(indice):
          if indice == 0:
              return x
          elif indice == 1:
              return y

      return get

  def select(p, i):
      """Devuelve el elemento situado en el índice i de la pareja p."""
      return p(i)
  ```

- Con esta implementación, podemos crear y manipular parejas:

:::: columns

::: column

  ```python
  >>> p = pareja(20, 14)
  >>> select(p, 0)
  20
  >>> select(p, 1)
  14
  ```

:::

::: column

[Ver en Pythontutor](http://pythontutor.com/visualize.html#code=def%20pareja%28x,%20y%29%3A%0A%20%20%20%20%22%22%22Devuelve%20una%20funci%C3%B3n%20que%20representa%20una%20pareja.%22%22%22%0A%20%20%20%20def%20get%28indice%29%3A%0A%20%20%20%20%20%20%20%20if%20indice%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20x%0A%20%20%20%20%20%20%20%20elif%20indice%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20y%0A%20%20%20%20return%20get%0A%0Adef%20select%28p,%20i%29%3A%0A%20%20%20%20%22%22%22Devuelve%20el%20elemento%20situado%20en%20el%20%C3%ADndice%20i%20de%20la%20pareja%20p.%22%22%22%0A%20%20%20%20return%20p%28i%29%0A%0Ap%20%3D%20pareja%2820,%2014%29%0Aprint%28select%28p,%200%29%29%0Aprint%28select%28p,%201%29%29&cumulative=false&curInstr=0&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false){target="\_blank"}

:::

::::

---

- Las variables `x` e `y` son los parámetros de la función `pareja`, es decir,
  que son locales a ella. Por tanto, las ligaduras entre sus identificadores y
  las variables que contienen su valores se almacenan en el marco de `pareja`.

- La función `get` puede acceder a `x` e `y` ya que se encuentran en su
  entorno.

!DOT(entorno-pareja-get.svg)(Entorno dentro de la función `get` al llamar a `select(p, 0)`)(width=70%)(width=75%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
14 [shape = circle]
20 [shape = circle]
0 [shape = circle]
f1 [shape = circle, label = "λ"]
f2 [shape = circle, label = "λ"]
f3 [shape = circle, label = "λ"]
subgraph cluster2 {
    label = <Marco global>
    bgcolor = white
    pareja [shape = plaintext, fillcolor = transparent, label = "pareja"]
    select [shape = plaintext, fillcolor = transparent, label = "select"]
    p [shape = plaintext, fillcolor = transparent, label = "p"]
}
pareja -> f1
select -> f2
p -> f3
subgraph cluster0 {
    label = <Marco de <b>pareja</b>>
    bgcolor = "white"
    x [shape = plaintext, fillcolor = transparent, label = "x"]
    y [shape = plaintext, fillcolor = transparent, label = "y"]
    get [shape = plaintext, fillcolor = transparent, label = "get"]
}
x -> 20
y -> 14
get -> f3
subgraph cluster1 {
    label = <Marco de <b>get</b>>
    bgcolor = white
    i [shape = plaintext, fillcolor = transparent, label = "indice"]
}
i -> 0
i -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
x -> pareja [lhead = cluster2, ltail = cluster0, minlen = 2]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> i [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Lo interesante es que **el marco de la función `pareja` no se elimina de la
  memoria al salir de la función** con `return get`, ya que la función `get`
  necesita seguir accediendo a valores (las variables `x` e `y`) cuyas
  ligaduras se almacenan en el marco de `pareja` y no en el suyo (el de `get`).

- Es decir: el intérprete conserva todo el entorno que la función `get`
  necesita para poder funcionar, incluyendo sus variables no locales, como es
  el caso aquí de de los parámetros `x` e `y` de la función `pareja`.

- La combinación de una función más el entorno necesario para su ejecución se
  denomina **clausura**, y se representa gráficamente como una flecha que va
  desde la función hasta el primer marco del entorno de la función.

!CAJACENTRADA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Clausura = función + entorno
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Aquí la clausura es la función que está guardada en `p`, más el entorno que
  empieza en el marco de `pareja`:

:::: columns

::: {.column width=60%}

!DOT(pila-pareja-get.svg)(Pila de control después de hacer `p = pareja(20, 14)`)(width=90%)(width=65%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace", shape = record]
pila [label = "<f0>Global", xlabel = "Pila de\ncontrol"]
14 [shape = circle, color = grey, fontcolor = grey]
20 [shape = circle, color = grey, fontcolor = grey]
f1 [shape = circle, label = "λ"]
f2 [shape = circle, label = "λ"]
f3 [shape = circle, label = "λ", color = red]
subgraph cluster2 {
    label = <Marco global>
    bgcolor = white
    pareja [shape = plaintext, fillcolor = transparent, label = "pareja"]
    select [shape = plaintext, fillcolor = transparent, label = "select"]
    p [shape = plaintext, fillcolor = transparent, label = "p"]
}
pareja -> f1
select -> f2
p -> f3
subgraph cluster0 {
    label = <Marco de <b>pareja</b>>
    bgcolor = "white"
    color = grey
    fontcolor = grey
    x [shape = plaintext, fillcolor = transparent, label = "x", fontcolor = grey]
    y [shape = plaintext, fillcolor = transparent, label = "y", fontcolor = grey]
    get [shape = plaintext, fillcolor = transparent, label = "get", fontcolor = grey]
}
x -> 20 [color = grey]
y -> 14 [color = grey]
get -> f3 [color = grey]
x -> pareja [lhead = cluster2, ltail = cluster0, minlen = 2, color = grey]
pila:f0 -> select [lhead = cluster2, minlen = 3]
E [shape = plaintext, fillcolor = transparent, margin = 0.1, width = 0.1]
E -> select [lhead = cluster2, minlen = 2]
f3 -> y [lhead = cluster0, minlen = 3, color = blue]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=40%}

- En la pila de control no está el registro de activación de la función
  `pareja`, ya que no está activa en este momento.

- El !COLOR(red)(círculo rojo) representa la clausura.

- La !COLOR(blue)(flecha azul) apunta al entorno de la clausura, que contiene
  primero el marco de `pareja` y luego el marco global.

:::

::::

---

- Las funciones `pareja` y `select`, así definidas, son **funciones de orden
  superior**: la primera porque devuelve una función y la segunda porque recibe
  una función como argumento.

- La función `get`, que devuelve `pareja` y que recibe `select`, **representa
  una pareja**, es decir, un **dato**.

- A esto se le denomina **representación funcional**.

- El uso de funciones de orden superior para representar datos no se
  corresponde con nuestra idea intuitiva de lo que deben ser los datos. Sin
  embargo, **las funciones son perfectamente capaces de representar datos
  compuestos**. En nuestro caso, estas funciones son suficientes para
  representar parejas en nuestros programas.

- Esto no quiere decir que Python realmente implemente las listas mediante
  funciones. En realidad las implementa de otra forma por razones de
  eficiencia, pero podría implementarlas con funciones sin ningún problema.

---

- La práctica de la abstracción de datos nos permite cambiar fácilmente unas
  representaciones por otras, y una de esas representaciones puede ser mediante
  funciones.

- La representación funcional, aunque pueda parecer extraña, es una forma
  perfectamente adecuada de representar parejas, ya que cumple las propiedades
  que deben cumplir las parejas.
  
- Este ejemplo también demuestra que la capacidad de manipular funciones como
  valores (mediante funciones de orden superior) proporciona la capacidad de
  manipular datos compuestos.

## Estado interno

- Ciertos datos pueden tener un **estado interno** consistente en información
  que el dato almacena (o *recuerda*) y que puede cambiar durante la ejecución
  del programa.

- Por ejemplo:

  - Una **lista** posee un estado interno que se corresponde con su
    **contenido**, es decir, con los **elementos que contiene** en un momento
    dado.

  - Esos elementos pueden **cambiar** durante la ejecución del programa:
    podemos añadir elementos a la lista, eliminar elementos de la lista o
    cambiar un elemento de la lista por otro distinto.

  - Cada vez que efectuamos alguna de estas operaciones sobre una lista estamos
    cambiando su estado interno.

- Por tanto, la palabra «estado» implica un proceso evolutivo en el tiempo,
  durante el cual ese estado puede ir cambiando.

---

- Al introducir el concepto de «estado interno» en nuestros datos, estamos
  introduciendo también la capacidad de cambiar dicho estado, es decir, que
  **los datos ahora son mutables**, y la _mutabilidad_ es un concepto propio de
  la **programación imperativa**.

- Esto nos va a **impedir representar un _dato abstracto mutable_ usando las
  especificaciones algebraicas** que hemos usado hasta hoy, ya que, a partir de
  ahora, el resultado de una operación puede depender no sólo de lo que dicten
  las ecuaciones de la especificación sino también de la historia previa que
  haya tenido el dato abstracto (es decir, de su estado interno).

- Y, por supuesto, nos va a **impedir usar el modelo de sustitución** para
  razonar sobre nuestros datos, por lo que tendremos que usar el modelo de
  **máquina de estados**.

---

- A cambio, ganaremos dos cosas:

  - La posibilidad de modelar **sistemas modulares**, basados en partes
    independientes que actúan como elementos autónomos.

  - La posibilidad de modelar de forma fácil y natural el comportamiento de
    **sistemas y procesos** que se dan en el mundo real y que son
    inherentemente **dinámicos**, es decir, que cambian con el tiempo y que van
    pasando por distintos estados a medida que se opera con ellos.

- Para ello, aprovecharemos una característica aún no explorada hasta ahora:
  **las funciones también pueden tener estado interno**.

---

- Por ejemplo, definamos una función que simule el proceso de retirar dinero de
  una cuenta bancaria.

- Crearemos una función llamada `retirar`, que tome como argumento una cantidad
  a retirar. Si hay suficiente dinero en la cuenta para permitir la retirada,
  `retirar` devolverá el saldo restante después de la retirada. De lo
  contrario, `retirar` producirá el error `'Fondos insuficientes'`.

- Por ejemplo, si empezamos con 100 € en la cuenta, nos gustaría obtener la
  siguiente secuencia de valores de retorno al ir llamando a `retirar`:

  ```python
  >>> retirar(25)
  75
  >>> retirar(25)
  50
  >>> retirar(60)
  'Fondos insuficientes'
  >>> retirar(15)
  35
  ```

---

- La expresión `retirar(25)`, evaluada dos veces, produce valores diferentes.

- Por lo tanto, la función `retirar` **no es pura**.

- Llamar a la función no sólo devuelve un valor, sino que también tiene el
  **efecto lateral** de cambiar la función de alguna manera, de modo que la
  siguiente llamada con el mismo argumento devolverá un resultado diferente.

- Este efecto lateral es el resultado de retirar dinero de los fondos
  disponibles **provocando un cambio en el estado de una variable** que
  almacena dichos fondos y que se encuentra **fuera del marco actual**.

---

- Para que todo funcione, debe empezarse con un saldo inicial.

- La función `deposito` es una función de orden superior que recibe como
  argumento un saldo inicial y devuelve la propia función `retirar`, pero de
  forma que esa función **recuerda** el saldo inicial.

  ```python
  >>> retirar = deposito(100)
  ```

- La implementación de `deposito` requiere un **acceso no local** al valor de
  los fondos iniciales y una **función local** que actualiza y devuelve dicho
  valor:

  ```python
  def deposito(fondos):
      """Devuelve una función que reduce los fondos en cada llamada."""
      def deposito_local(cantidad):
          nonlocal fondos
          if cantidad > fondos:
              return 'Fondos insuficientes'
          fondos -= cantidad  # Asignación a variable no local
          return fondos

      return deposito_local
  ```

## Paso de mensajes

- Al poder asignar valores a una variable no local, hemos podido conservar un
  estado que es interno para una función pero que evoluciona y cambia con el
  tiempo a través de llamadas sucesivas a esa función.

- Supongamos que queremos ampliar la idea anterior definiendo más operaciones
  sobre los fondos de la cuenta corriente.

- Por ejemplo, además de poder retirar una cantidad, queremos también poder
  ingresar cantidades en la cuenta, así como consultar en todo momento su saldo
  actual.

- En ese caso, podemos usar una técnica que consiste en usar una función que
  **despacha** las operaciones en función del *mensaje* recibido.

---

```python
def deposito(fondos):
    def retirar(cantidad):
        nonlocal fondos
        if cantidad > fondos:
            return 'Fondos insuficientes'
        fondos -= cantidad
        return fondos

    def ingresar(cantidad):
        nonlocal fondos
        fondos += cantidad
        return fondos

    def saldo():
        return fondos

    def despacho(mensaje):
        if mensaje == 'retirar':
            return retirar
        elif mensaje == 'ingresar':
            return ingresar
        elif mensaje == 'saldo':
            return saldo
        else:
            raise ValueError('Mensaje incorrecto')

    return despacho
```

---

<!--
```python
def retirar(dep, cantidad):
    return dep('retirar')(cantidad)

def ingresar(dep, cantidad):
    return dep('ingresar')(cantidad)

def saldo(dep):
    return dep('saldo')()
```
-->

- Ahora, un depósito se representa internamente como una función que recibe
  mensajes y los despacha a la función correspondiente:

  ```python
  >>> dep = deposito(100)
  >>> dep
  <function deposito.<locals>.despacho at 0x7f0de1300e18>
  >>> dep('retirar')(25)
  75
  >>> dep('ingresar')(200)
  275
  >>> dep('saldo')()
  275
  ```

- También podemos hacer:

  ```python
  >>> dep = deposito(100)
  >>> retirar = dep('retirar')
  >>> ingresar = dep('ingresar')
  >>> saldo = dep('saldo')
  >>> retirar(25)
  75
  >>> ingresar(200)
  275
  >>> saldo()
  275
  ```

---

- Una variante de esta técnica es la de usar un diccionario para asociar a cada
  mensaje con cada operación:

```python
def deposito(fondos):
    def retirar(cantidad):
        nonlocal fondos
        if cantidad > fondos:
            return 'Fondos insuficientes'
        fondos -= cantidad
        return fondos

    def ingresar(cantidad):
        nonlocal fondos
        fondos += cantidad
        return fondos

    def saldo():
        return fondos

    dic = {'retirar': retirar, 'ingresar': ingresar, 'saldo': saldo}

    def despacho(mensaje):
        if mensaje in dic:
            return dic[mensaje]
        else:
            raise ValueError('Mensaje incorrecto')

    return despacho
```

---

- Se denomina **paso de mensajes** a este estilo de programación que consiste
  en agrupar, dentro de una función que responde a diferentes mensajes, las
  operaciones que actúan sobre un dato.

- El paso de mensajes combina **dos técnicas de programación**:

  - Las **funciones de orden superior** que devuelven otras funciones.

  - El uso de una función que **_despacha_** a otras funciones dependiendo del
    mensaje recibido.

## Especificación de datos abstractos con estado interno

- Ya hemos dicho que las especificaciones algebraicas no nos sirven para
  especificar un tipo abstracto que contenga estado interno y mutabilidad,
  porque las operaciones ya no conservan la transparencia referencial y sus
  propiedades ya no siempre se pueden describir con ecuaciones.

- Lo que sí se puede hacer es usar el lenguaje natural para describir dichas
  propiedades.

- El resultado es mucho menos elegante y formal, además de que favorece la
  aparición de ambigüedades en la interpretación, pero es lo mejor que podemos
  hacer, en general.

---

- Por ejemplo, la especificación del tipo **Depósito** podría expresarse así si no hubiera mutabilidad ni estado interno:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **espec** _depósito_
      **operaciones**
            `depósito` : $\mathbb{R}$ $\rightarrow$ _depósito_
            **parcial** `retirar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\mathbb{R}$
            `ingresar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\mathbb{R}$
            `saldo` : _depósito_ $\rightarrow$ $\mathbb{R}$
      **ecuaciones**
            $f < c$ $\Rightarrow$ `retirar`(`depósito`($f$), $c$) $\doteq$ $error$
            $f \geq c$ $\Rightarrow$ `retirar`(`depósito`($f$), $c$) $\doteq$ `depósito`($f - c$)
            `ingresar`(`depósito`($f$), $c$) $\doteq$ `depósito`($f + c$)
            `saldo`(`depósito`($f$)) $\doteq$ $f$
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- `deposito` es la operación generadora.

- `retirar` e `ingresar` son operaciones modificadoras.

- `saldo` es una operación selectora.

---

- Si el dato abstracto es mutable y recuerda su estado interno, las operaciones
  modificadoras ya no producen un nuevo dato **Depósito** a partir de otro,
  sino que cambian el estado interno del dato existente.

- En tal caso, la especificación debe describir el **efecto** que producen las
  operaciones modificadoras sobre el dato abstracto:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _depósito_
    **operaciones**
          `depósito` : $\mathbb{R}$ $\rightarrow$ _depósito_
          **parcial** `retirar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\empty$
          `ingresar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\empty$
          `saldo` : _depósito_ $\rightarrow$ $\mathbb{R}$
    **var**
          $d$ : _depósito_; $f$, $c$ : $\mathbb{R}$
    **ecuaciones**
          `depósito`($f$) \ \ \{ Crea un depósito con un fondo (estado interno) inicial de $f$
                                     y lo devuelve }
          `saldo`($d$) $\doteq$ «los fondos actuales de $d$»
          `saldo`($d$) $\geq$ $c$ $\Rightarrow$ `retirar`($d$, $c$) \ \ \{ Reduce en $c$ unidades los fondos del depósito $d$ \}
          `saldo`($d$) $<$ $c$ $\Rightarrow$ `retirar`($d$, $c$) $\doteq$ $error$
          `ingresar`($d$, $c$) \ \ \{ Aumenta en $c$ unidades los fondos del depósito $d$ \}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Los _efectos_ que produce una operación se indican entre llaves \{ \} al lado
  de la operación correspondiente.

  Toda operación _impura_ debe indicar sus efectos entre llaves.

- La signatura de las operaciones `retirar` e `ingresar` indican mediante
  «$\rightarrow \empty$» que son operaciones que no devuelven ningún valor, ya
  que su cometido es el de provocar un efecto lateral (en este caso, modificar
  el estado interno del **Depósito**).

- En concreto, los efectos que producen dichas operaciones son los de cambiar
  los fondos del depósito, restándole o sumándole una cantidad.

- Por tanto, una vez ejecutada cualquiera de esas operaciones, se habrá
  cambiado el estado interno del dato abstracto.

---

- Otra opción es que las operaciones modificadoras devolvieran un valor además
  de cambiar el estado interno del dato abstracto (por ejemplo, el saldo que
  queda en el depósito tras ingresar o retirar efectivo).

- En tal caso, podría quedar algo así:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**espec** _depósito_
    **operaciones**
          `depósito` : $\mathbb{R}$ $\rightarrow$ _depósito_
          **parcial** `retirar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\mathbb{R}$ 
          `ingresar` : _depósito_ $\times$ $\mathbb{R}$ $\rightarrow$ $\mathbb{R}$
          `saldo` : _depósito_ $\rightarrow$ $\mathbb{R}$
    **var**
          $d$ : _depósito_; $f$, $c$ : $\mathbb{R}$
    **ecuaciones**
          `depósito`($f$) \ \ \{ Crea un depósito con un fondo (estado interno) inicial de $f$
                                     y lo devuelve }
          `saldo`($d$) $\doteq$ «los fondos actuales de $d$»
          `saldo`($d$) $\geq$ $c$ $\Rightarrow$ `retirar`($d$, $c$) \ \ \{ Reduce en $c$ unidades los fondos del depósito $d$
                                                                  y devuelve el saldo que queda \}
          `saldo`($d$) $<$ $c$ $\Rightarrow$ `retirar`($d$, $c$) $\doteq$ $error$
          `ingresar`($d$, $c$) \ \ \{ Aumenta en $c$ unidades los fondos del depósito $d$
                                         y devuelve el saldo que queda \}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Abstracción de datos y modularidad

## El tipo abstracto como módulo

- Claramente, un **tipo abstracto** representa una **abstracción**:

  - Se **destacan** los detalles (normalmente pocos) de la **especificación**,
    es decir, el *comportamiento observable* del tipo. Es de esperar que este
    aspecto sea bastante estable y cambie poco durante la vida útil del
    programa.

  - Se **ocultan** los detalles (normalmente numerosos) de la
    **implementación**. Este aspecto es, además, propenso a cambios.

- Y estas propiedades anteriores hacen que el tipo abstracto sea el concepto
  ideal alrededor del cual basar la descomposición en módulos de un programa
  grande.

---

- Recordemos que para que haya una buena modularidad:

  - Las **conexiones** del módulo con el resto del programa han de ser pocas y
    simples. De este modo se espera lograr una relativa independencia en el
    desarrollo de cada módulo con respecto a los otros.

  - La **descomposición** en módulos ha de ser tal que la mayor parte de los
    cambios y mejoras al programa impliquen modificar sólo un módulo o un
    número muy pequeño de ellos.

  - El **tamaño** de un módulo ha de ser el adecuado: si es demasiado grande,
    será difícil realizar cambios en él; si es demasiado pequeño, los costes de
    integración con otros módulos aumenta.

---

- La parte del código fuente de un programa dedicada a la definición de un tipo
  abstracto de datos es un **candidato a módulo** que cumple los siguientes
  requisitos:

  - La **interfaz** del tipo abstracto con sus usuarios es un ejemplo de
    pocas y simples conexiones con el resto del programa: los usuarios
    simplemente invocan sus operaciones permitidas. Otras conexiones más
    peligrosas, como compartir variables entre módulos o compartir el
    conocimiento acerca de la estructura interna, son imposibles.

  - La **implementación** puede cambiarse libremente sin afectar al
    funcionamiento de los módulos usuarios. Es de esperar, por tanto, que
    muchos cambios al programa queden localizados en el interior de un sólo
    módulo.

  - El **tamaño** de una sola función que implementa una abstracción funcional
    es demasiado pequeño para ser útil como unidad modular. En cambio, la
    definición de un tipo abstracto consta, en general, de una colección de
    funciones más una representación, lo que proporciona un tamaño más
    adecuado.

---

- Un tipo abstracto de datos conecta perfectamente con los cuatro conceptos más
  importantes relacionados con la modularidad:

  - Es una **abstracción**: se usa sin necesidad de saber cómo se implementa.

  - **Oculta información**: los detalles y las decisiones de diseño quedan en
    la implementación del tipo abstracto, y son innecesarios para poder usarlo.

  - Es **funcionalmente independiente**: es un módulo destinado a una sola
    tarea, con alta cohesión y bajo acoplamiento.

  - Es **reutilizable**: su comportamiento puede resultar tan general que puede
    usarse en diferentes programas con ninguna o muy poca modificación.

!BIBLIOGRAFIA
