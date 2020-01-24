---
title: Abstracción de datos
author: Ricardo Pérez López
!DATE
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

- La abstracción es un proceso pero también es algo que puede formar parte de
  un programa.

- Hasta ahora, las únicas abstracciones que hemos utilizado y creado son las
  **funciones**, también llamadas **abstracciones funcionales**.

- Una función es una abstracción funcional porque el usuario de la función sólo
  necesita conocer la **especificación** de la abstracción (el *qué* hace) y
  puede ignorar el resto de los detalles de **implementación** que se
  encuentran en el cuerpo de la función (el *cómo* lo hace).

- Por eso decimos que las funciones definen dos niveles de abstracción.

- En otras palabras, al diseñar una función estamos creando una abstracción que
  separa la forma en la que se utiliza la función de la forma en como está
  implementada esa función.

---

- Las abstracciones funcionales son un mecanismo que nos permite:

  #. componer una **operación compleja** combinando otras operaciones más
     simples (dándole un nuevo nombre a todo el conjunto), y

  #. poder usar esa nueva operación compleja sin necesidad de conocer cómo está
     hecha por dentro (es decir, sin necesidad de conocer cuáles son esas
     operaciones más simples que la forman, que son detalles que quedan ocultos
     al usuario).

- Una vez que la función se ha diseñado y se está utilizando, se puede
  sustituir por cualquier otra que tenga el mismo comportamiento observable.

- De forma similar, los datos compuestos o estructurados son un mecanismo que
  nos permite crear un **dato complejo** combinando otros datos más simples,
  formando una única unidad conceptual.

- Pero, por desgracia, estos datos compuestos **no ocultan sus detalles de
  implementación al usuario**, sino que éste tiene que conocer cómo está
  construido.

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

- La **abstracción de datos** es una **técnica** pero también es algo que puede
  formar parte de un programa.

- Diseñar programas usando abstracción de datos da como resultado la creación
  y utilización de **tipos abstractos de datos** (o **TAD**), a los que también
  se se les denomina **abstracciones de datos**.

---

- La abstracción de datos se parece a la abstracción funcional:

  - Cuando creamos una **abstracción funcional**, se ocultan los detalles de
    cómo se implementa una función, y esa función particular se puede sustituir
    luego por cualquier otra función que tenga el mismo comportamiento general
    sin que los usuarios de la función se vean afectados.

    En otras palabras, podemos hacer una abstracción que separe la forma en que
    se utiliza la función de los detalles de cómo se implementa la función.

  - Igualmente, la **abstracción de datos** separa el uso de un dato compuesto
    de los detalles de cómo está construido ese dato compuesto, que quedan
    ocultos para los usuarios de la abstracción de datos.

    Para usar una abstracción de datos no necesitamos conocer sus detalles
    internos de implementación.

---

--------------------------------------------------------------------------------
Elementos del lenguaje      Instrucciones               Datos
--------------------------- --------------------------- ------------------------
Primitivas                  Definiciones, literales y   Datos simples (enteros,
                            sentencias simples          reales, booleanos...

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
  valores, sino sus **operaciones** y las propiedades que cumplen éstas.

- Los **valores** de un tipo abstracto se definen también como operaciones.

---

- Por ejemplo, `set` es un tipo primitivo en Python que actúa como un tipo
  abstracto de datos.

  - Se nos proporcionan **operaciones primitivas** para crear conjuntos y
    manipular conjuntos (unión, intersección, etc.) y también un modo de
    visualizar sus valores.

  - Pero no sabemos, ni necesitamos saber, cómo se representan internamente los
    conjuntos en la memoria del ordenador. Ese es un detalle interno del
    intérprete.

- En general, el programador que usa un tipo abstracto puede no saber, e
  incluso se le impide saber, cómo se representan los elementos del tipo de
  datos.

- Esas **barreras de abstracción** son muy útiles porque permiten cambiar la
  representación interna sin afectar a las demás partes del programa que
  utilizan dicho tipo abstracto.

---

- En resumen, tenemos que un tipo abstracto debe cumplir:

  - **Privacidad de la representación**: los usuarios no conocen la
    representación de los valores del tipo abstracto en la memoria del
    ordenador.

  - **Protección**: sólo se pueden utilizar para el nuevo tipo las operaciones
    previstas en la especificación.

> «Son las especificaciones, y no los programas, los que realmente describen
> una abstracción; los programas simplemente la implementan.»
>
> -- Barbara Liskov


---

- El programador de un tipo abstracto debe crear, por tanto, dos partes bien
  diferenciadas:

  - La **especificación** del tipo: única parte que conoce el usuario del mismo
    y que consiste en:
  
    - El **nombre** del tipo.
    
    - La especificación de las **operaciones** permitidas. Esta especificación
      tendrá:

      - Una parte **sintáctica**: la *signatura* de cada operación.

      - Otra parte **semántica**: que define las **propiedades** que deben
        cumplir dichas operaciones y que se pueden expresar mediante
        **ecuaciones** o directamente en lenguaje natural.

  - La **implementación** del tipo: conocida sólo por el programador del mismo
    y que consiste en la *representación* del tipo por medio de otros tipos y
    en la implementación de las operaciones.

# Especificaciones

## Sintaxis

:::: columns

::: column

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

::: column

- Donde:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~
!NT(decl_var) ::= !NT{variable} !T{:} !NT{tipo}
!NT(ecuación) ::= !NT(izquierda) $\doteq$ !NT(derecha)
~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

## Operaciones

- Las operaciones que forman parte de la especificación de un tipo abstracto
  $T$ pueden clasificarse en:

  - **Constructoras**: operaciones que devuelven un valor de tipo $T$.

    - A su vez, las constructoras se dividen en:

      - **Generadoras**: el conjunto de operaciones generadoras está formado
        por aquellas operaciones constructoras que tienen la propiedad de que
        sólo con ellas es suficiente para generar cualquier valor del tipo, y
        excluyendo cualquiera de ellas hay valores que no pueden ser generados.

      - **Modificadoras**: son las operaciones constructoras que no forman
        parte del conjunto de las generadoras.

  - **Selectoras**: operaciones que toman como argumento uno o más valores de
    tipo $T$ que no devuelven un valor de tipo $T$.

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

- Este estilo de especificación se denomina **especificación algebraica**.

- Su principal virtud es que permite definir un nuevo tipo de forma *totalmente
  independiente* de cualquier posible representación o implementación.

- ¿A qué categoría pertenencen cada una de esas operaciones?

:::

::::

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

- Y un programa que hiciera uso de las pilas una vez implementado el tipo
  abstracto de datos, podría ser:

  ```python
  p = pvacia()        # crea vacía
  p = apilar(p, 4)    # apila valor 4
  p = apilar(p, 8)    # apila valor 8
  print(vacia(p))     # imprime False
  print(cima(p))      # imprime 8
  print(desapilar(p)) # imprime 8
  print(desapilar(p)) # imprime 4
  print(vacia(p))     # imprime True
  print(cima(pvacia)) # error
  ```

- El programa usa la pila a través de las operaciones sin necesidad de conocer
  su representación interna (su implementación).

:::

::::

---

- Y los **números racionales** se podrían especificar así:

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
          `imprimir`($r$) \{ imprime el racional $r$ \}
          `racional`($n$, 0) $\doteq$ $error$
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Según la especificación anterior, podemos suponer que disponemos de un
  constructor y dos selectores a través de las siguientes funciones:

  - `racional(`$n$`, `$d$`)`: devuelve el número racional con numerador $n$ y
    denominador $d$.

  - `numer(`$x$`)`: devuelve el numerador del número racional $x$.

  - `denom(`$x$`)`: devuelve el denominador del número racional $x$.

- Estamos usando una estrategia poderosa para diseñar programas: el
  **pensamiento optimista**, ya que todavía no hemos dicho cómo se representa
  un número racional, o cómo se deben implementar las funciones `numer`,
  `denom` y `racional`.

- Aun así, si definimos estas tres funciones, podríamos sumar, multiplicar,
  imprimir y comprobar la igualdad de números racionales, con lo que podemos
  definir las funciones `suma`, `mult`, `imprimir` e `iguales?` en función de
  `racional`, `numer` y `denom`.

---

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

- Por ejemplo, si estamos diseñando un módulo de números racionales y aún no
  hemos decidido si calcular el m.c.d. en el constructor o en los selectores,
  la metodología de la abstracción de datos nos permite retrasar esa decisión
  sin perder la capacidad de seguir programando el resto del programa.

# Barreras de abstracción

## Barreras de abstracción

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

---

- Cada una de las filas de la tabla anterior representa un nivel de
  abstracción, de forma que cada nivel usa las operaciones y las facilidades
  ofrecidas por el nivel inmediatamente inferior.

- Dicho de otra forma: en cada nivel, las funciones que aparecen en la última
  columna imponen una barrera de abstracción. Estas funciones son usadas desde
  un nivel más alto de abstracción e implementadas usando un nivel más bajo de
  abstracción.

---

!IMGP(barreras-abstraccion.svg)(Barreras de abstracción)(width=75%)(width=55%)

---

- Se produce una violación de una barrera de abstracción cada vez que una parte
  del programa que puede utilizar una función de nivel superior utiliza una
  función de un nivel inferior.

- Por ejemplo, una función que calcula el cuadrado de un número racional se
  implementa mejor en términos de `mult`, que no necesita supone nada sobre
  cómo se implementa un número racional:

  ```python
  def cuadrado(x): 
      return mult(x,x)      
  ```

---

- Si hiciéramos referencia directa a los numeradores y los denominadores
  estaríamos violando una barrera de abstracción:

  ```python
  def cuadrado_viola_una_barrera(x): 
      return racional(numer(x) * numer(x), denom(x) * denom(x)) 
  ```

- Y si suponemos que los racionales se representan como listas estaríamos
  violando dos barreras de abstracción:

  ```python
  def cuadrado_viola_dos_barreras(x): 
      return [x[0] * x[0], x[1] * x[1]]    
  ```

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
  que cambien las signaturas del constructor o los selectores, y
  `cuadrado_viola_dos_barreras` tendrá que cambiarse cada vez que cambie la
  representación interna de los números racionales.

# Las propiedades de los datos

## Las propiedades de los datos

- Las barreras de abstracción determinan la forma en la que pensamos sobre los
  datos.

- Pero... ¿qué es un *dato*? No basta con decir que es «cualquier cosa
  implementada mediante determinados constructores y selectores».
  
- Por ejemplo: es evidente que cualquier conjunto arbitrario de tres funciones
  (un constructor y dos selectores) no sirven para representar adecuadamente a
  los números racionales. Además, tenemos que garantizar que, entre el
  constructor `racional` y los selectores `numer` y `denum`, se cumple la
  siguiente propiedad:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $x$ `=` `racional(`$n$, $d$`)`, entonces `numer(`$x$`)/denom(`$x$`)` `==`
  $n/d$ .
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
---

- Una representación válida de un número racional no está limitada a ninguna
  implementación particular (como, por ejemplo, una lista de dos elementos),
  sino que nos sirve cualquier implementación que satisfaga la propiedad
  anterior.

- En general, podemos pensar que **los datos abstractos se definen mediante una
  colección de selectores y constructores junto con algunas propiedades que los
  datos abstractos deben cumplir**. Mientras se cumplan dichas propiedades
  (como la anterior de la división), los selectores y constructores constituyen
  una representación válida de un tipo de datos.

---

- **Los detalles de implementación** debajo de una barrera de abstracción
  **pueden cambiar**, pero si no cambia su comportamiento, entonces la
  abstracción de datos sigue siendo válida y cualquier programa escrito
  utilizando esta abstracción de datos seguirá siendo correcto.

- Este punto de vista tambíen se puede aplicar, por ejemplo, a las parejas con
  forma de lista que hemos usado para implementar números racionales.
  
- En realidad, tampoco hace falta que sea una lista. Nos basta con cualquier
  representación que agrupe dos valores juntos y que nos permita acceder a cada
  valor por separado. Es decir, la propiedad que tienen que cumplir las parejas
  es que:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $p$ `=` `pareja(`$x$, $y$`)`, entonces `select(`$p$`, 0)` `==` $x$ \
  y `select(`$p$`, 1)` `==` $y$.
  ~~~~~~~~~~~~~~~~~~~~~~~~~

- Tales propiedades se describen como **ecuaciones** en la **especificación
  algebraica** del tipo abstracto.

## Representación funcional

- De hecho, ni siquiera necesitamos estructuras de datos para representar
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

!DOT(entorno-pareja-get.svg)(Entorno en la función `get` al llamar a `pareja(4, 1)`)(width=50%)(width=55%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compound = true
graph [rankdir = LR]
node [fontname = "monospace"]
1 [shape = circle]
4 [shape = circle]
x [shape = plaintext, fillcolor = transparent, label = "x"]
y [shape = plaintext, fillcolor = transparent, label = "y"]
i [shape = plaintext, fillcolor = transparent, label = "indice"]
subgraph cluster0 {
    label = "Marco de pareja"
    bgcolor = "white"
    x -> 4
    y -> 1
}
subgraph cluster1 {
    label = "Marco de get"
    bgcolor = white
    i -> i
}
i -> x [lhead = cluster0, ltail = cluster1, minlen = 2]
E [shape = point]
E -> i [lhead = cluster1]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Lo interesante es que el marco de la función `pareja` no se elimina de la
  memoria al salir de la función con `return get`, ya que la función `get`
  necesita seguir accediendo a valores (las variables `x` e `y`) cuyas
  ligaduras se almacenan en el marco de `pareja` y no en el suyo.

- Es decir: el intérprete conserva todo el entorno que la función `get`
  necesita para poder funcionar, incluyendo sus variables no locales, como es
  el caso aquí de de los parámetros `x` e `y` de la función `pareja`.

- La combinación de una función más el entorno necesario para su ejecución se
  denomina **clausura**.

---

- Las funciones `pareja` y `select`, así definidas, son **funciones de orden
  superior**: la primera porque devuelve una función y la segunda porque recibe
  una función como argumento.

- La función que devuelve `pareja` y que recibe `select` **representa una
  pareja**, es decir, un **dato**.

- A esto se le denomina **representación funcional**.

- El uso de funciones de orden superior para representar datos no se
  corresponde en absoluto con nuestra noción intuitiva de lo que deben ser los
  datos. Sin embargo, **las funciones son perfectamente capaces de representar
  datos compuestos**. En nuestro caso, estas funciones son suficientes para
  representar parejas en nuestros programas.

- El hecho de ver aquí la **representación funcional** de una pareja no es
  porque Python realmente trabaje de esta manera (las listas en Python se
  implementan internamente de otra forma, por razones de eficiencia), sino
  porque podría trabajar de esta manera.
  
---

- La práctica de la abstracción de datos nos permite cambiar fácilmente unas
  representaciones por otras.

- La representación funcional, aunque pueda parecer extraña, es una forma
  perfectamente adecuada de representar parejas, ya que cumple las propiedades
  que deben cumplir las parejas.
  
- Este ejemplo también demuestra que la capacidad de manipular funciones como
  valores (mediante funciones de orden superior) proporciona la capacidad de
  manipular datos compuestos.

## Estado interno

- Ciertos datos pueden tener **estado interno**, lo que significa que su
  contenido puede cambiar durante la ejecución del programa.

- Por ejemplo:

  - Una **lista** posee un estado interno que se corresponde con su
    **contenido**, es decir, con los **elementos que contiene** en un momento
    dado.

  - Esos elementos pueden **cambiar** durante la ejecución del programa:
    podemos añadir elementos a la lista, eliminar elementos de la lista o
    cambiar un elemento de la lista por otro distinto.

  - Cada vez que efectuamos alguna de estas operaciones sobre una lista estamos
    cambiando su estado interno.

- Por tanto, la palabra «estado» implica un proceso evolutivo durante el cual
  ese estado puede ir cambiando.

- **Las funciones también pueden tener estado interno**.

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

---

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
        if mensaje in d:
            return dic[mensaje]
        else:
            raise ValueError('Mensaje incorrecto')

    return despacho
```

---

- Se denomina **paso de mensajes** a este estilo de programación que consiste
  en agrupar, dentro de una función que responde a diferentes mensajes, las
  operaciones que actúan sobre un dato.

- El paso de mensajes combina dos técnicas de programación:

  - Las funciones de orden superior que devuelven otras funciones.

  - El uso de una función que *despacha* a otras funciones dependiendo del
    mensaje recibido.

<!--
  - Los datos tienen estado interno.

  - El almacenamiento y acceso al estado interno de una función mediante
    variables no locales.

  - La representación de datos como funciones.

  - La encapsulación de los datos junto con las operaciones que los manipulan
    en una sola unidad sintáctica.
-->

# La metáfora del objeto

## La metáfora del objeto

- Al principio, distinguíamos entre funciones y datos: las funciones realizan
  operaciones sobre los datos y éstos esperan pasivamente a que se opere con
  ellos.

- Cuando empezamos a representar a los datos con funciones, vimos que los datos
  también pueden encapsular **comportamiento**.

- Esos datos ahora representan información, pero también **se comportan** como
  las cosas que representan.

- Por tanto, los datos ahora saben cómo reaccionar ante los mensajes que
  reciben cuando las demás partes del programa les envían mensajes.

- Esta forma de ver a los datos como objetos activos que se relacionan entre sí
  y que son capaces de reaccionar y cambiar su estado interno en función de los
  mensajes que reciben, da lugar a todo un nuevo paradigma de programación
  llamado **programación orientada a objetos**.

# El tipo abstracto como módulo

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
