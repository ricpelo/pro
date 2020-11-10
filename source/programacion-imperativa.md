---
title: Programación imperativa
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008
---

# Modelo de ejecución

## Máquina de estados

- La **programación imperativa** es un paradigma de programación basado en los
  conceptos de «**_estado_**» y «**_sentencia_**».

- Un programa imperativo está formado por una **secuencia de sentencias**

- El programa imperativo va pasando por diferentes **estados** a medida que se
  van ejecutando las sentencias que lo forman.

- Por tanto, una **sentencia** es una instrucción que cambia el estado del
  programa.

- El modelo de ejecución de un programa imperativo es el de una **máquina de
  estados**, es decir, un dispositivo abstracto que va pasando por diferentes
  estados a medida que el programa va ejecutándose.

---

- El concepto de «_**tiempo**_» también es muy importante en programación
  imperativa, ya que el estado del programa va cambiando a lo largo del tiempo
  conforme se van ejecutando las sentencias que lo forman.
  
- A su vez, el comportamiento del programa depende del estado en el que se
  encuentre.

  Eso significa que, ante los mismos datos de entrada, una función en
  programación imperativa puede devolver **valores distintos en momentos
  distintos**.

- En programación funcional, en cambio, el comportamiento de una función no
  depende del momento en el que se ejecute, ya que siempre devolverá los mismos
  resultados ante los mismos datos de entrada (_transparencia referencial_).

- Eso significa que, para modelar el comportamiento de un programa imperativo,
  ya **no nos vale el modelo de sustitución** que hemos estado usando hasta
  ahora en programación funcional.

## Sentencias

- Las instrucciones que forman un programa imperativo son las **sentencias**.

- La ejecución de una sentencia **cambia el estado interno del programa**
  provocando uno de estos **efectos**:

  - **Cambiar las coordenadas** del proceso asociado al programa, normalmente
    mediante la llamada **sentencia de asignación**.

  - Cambiar el **flujo de control** del programa, haciendo que la ejecución se
    bifurque (*salte*) a otra parte del mismo.

- La principal diferencia entre una _sentencia_ y una _expresión_ es que las
  sentencias no denotan ningún valor, sino que son órdenes a ejecutar por el
  programa para producir un _efecto_.

  - Las _expresiones_ se _evalúan_ y devuelven un _valor_.

  - Las _sentencias_ se _ejecutan_ para producir un _efecto_.

---

- **En un lenguaje funcional puro:**

  - Un programa es una expresión.

  - Ejecutar un programa consiste en evaluar dicha expresión usando las
    definiciones predefinidas del lenguaje y las definidas por el programador.

  - Todo son expresiones, excepto las sentencias de definición, que producen el
    efecto de crear _ligaduras_.

  - Evaluar una expresión no produce ningún otro efecto salvo el de calcular su
    valor.

  - Las expresiones devuelven siempre el mismo valor (tienen _transparencia
    referencial_).

  - El comportamiento de un programa se puede modelar usando el _modelo de
    sustitución_.

---

- **En cambio, en un lenguaje imperativo:**

  - Los programas están formados por sentencias que, al ejecutarse, van
    cambiando el estado del programa.

  - El valor de una expresión depende del estado de en el que se encuentre el
    programa en el momento de evaluar dicha expresión (no hay _transparencia
    referencial_).

  - Evaluar una expresión puede provocar otros efectos (los llamados _efectos
    laterales_) más allá de calcular su valor.

  - En muchos lenguajes imperativos es posible colocar una expresión donde
    debería ir una sentencia (aunque no al revés).

    Esto sólo resultaría útil en caso de que la evaluación de la expresión
    provocara *efectos laterales*. De lo contrario, el valor de la evaluación
    se perdería sin más y no habría servido de nada calcularlo.

## Secuencia de sentencias

- Un programa imperativo está formado por una **secuencia de sentencias**.

- Ejecutar un programa imperativo es provocar los **cambios de estado** que
  dictan las sentencias en el **orden** definido por el programa.

- Las sentencias del programa van provocando **transiciones** entre estados,
  haciendo que la máquina pase de un estado al siguiente.

- Para modelar el comportamiento de un programa imperativo tendremos que saber
  en qué estado se encuentra el programa, para lo cual tendremos que seguirle
  la pista desde su estado inicial al estado actual.

- Eso básicamente se logra «ejecutando» mentalmente el programa sentencia por
  sentencia y llevando la cuenta de los cambios que van produciendo conforme se
  van ejecutando.

---

- Al decir que un programa imperativo está formado por una _secuencia_ de
  sentencias, estamos diciendo que importa mucho el orden en el que están
  colocadas las sentencias dentro del programa.

- En general, un programa imperativo se comportará de forma diferente si se
  cambia el orden en el que se ejecutan sus sentencias.

  Por eso, si se ejecuta _A_ antes que _B_, el programa seguramente no
  producirá el mismo efecto que si se ejecuta _B_ antes que _A_.

- Por ejemplo, muchas veces el funcionamiento de una sentencia _B_ depende del
  efecto producido por una sentencia _A_ anterior. Por tanto, en ese caso, _A_
  debería ejecutarse antes que _B_.

# Asignación destructiva

## Referencias al montículo

- Todos los valores se almacenan en una zona de la memoria conocida como el
  **montículo**.

- Cada vez que aparece un nuevo dato en el programa, el intérprete lo crea
  dentro del montículo a partir de una determinada dirección de la memoria y
  ocupando el espacio de memoria que se necesite en función del tamaño que
  tenga el dato.

- Esa dirección de comienzo de la zona que ocupa el dato dentro del montículo
  se denomina **referencia** y sirve para identificar al dato y acceder al
  mismo.

- En determinados casos, el intérprete no crea un nuevo dato sino que aprovecha
  otro exactamente igual que ya haya en el montículo para así ahorrar memoria
  (lo estudiaremos más adelante cuando hablemos de los *alias*).

## Variables

- Una **variable** es un lugar en la **memoria** donde se puede **almacenar una
  referencia** a un valor almacenado en el montículo.

- Cuando una variable contiene una referencia a un valor, decimos que la
  variable **hace referencia al valor** o que **apunta al valor**.

- Por abuso del lenguaje, también se suele decir que la variable **almacena o
  contiene el valor**, aunque eso no es estrictamente cierto.

- El valor de una variable (o mejor dicho, la referencia que contiene) **puede
  cambiar** durante la ejecución del programa, haciendo que la variable pueda
  *apuntar* a distintos valores durante la ejecución del programa.

---

- A partir de ahora, un identificador no se liga directamente con un valor,
  sino que tendremos:

  - Una **ligadura** entre un identificador y una **variable**.

  - La variable **hace referencia** al valor.

!DOT(identificador-variable-valor.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
identificador [shape = plaintext, fillcolor = transparent]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable -> valor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Este comportamiento es el propio de los **lenguajes de programación
  _orientados a objetos_** (como Python o Java), que son los lenguajes
  imperativos más usados a día de hoy.

- Otros lenguajes imperativos más «clásicos» se comportan, en general, de una
  forma diferente.

- En esos lenguajes (como C o Pascal), los valores se almacenan directamente
  dentro de las variables, es decir, las variables son contenedores que
  almacenan valores.

- Por tanto, el compilador tiene que reservar espacio suficiente en la memoria
  para cada variable del programa de manera que dicha variable pueda contener
  un dato de un determinado tamaño y que ese dato «quepa» dentro de la
  variable.

---

- De todos modos, algunos lenguajes de programación tienen un comportamiento
  híbrido, que combina ambas técnicas:

  - En Java, existen _tipos primitivos_ (cuyos valores se almacenan
    directamente en las variables) y _tipos referencia_ (cuyos valores se
    almacenan en el montículo y las variables contienen referencias a esos
    valores).

  - En C, los valores se almacenan dentro de las variables, pero es posible
    reservar memoria dinámicamente dentro del montículo y almacenar en una
    variable un *puntero* al comienzo de dicha zona de memoria, lo que permite
    crear y destruir datos en tiempo de ejecución.

## Estado

- La **ligadura** es la asociación que se establece entre un identificador y
  una variable.

- El **estado de una variable** es el valor al que hace referencia una variable
  en un momento dado.

  Por tanto, el estado es la asociación que se establece entre una variable y
  un valor (es decir, la referencia que contiene).

!DOT(identificador-ligadura-variable-estado-valor.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
identificador [shape = plaintext, fillcolor = transparent]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable [label = "ligadura"]
variable -> valor [label = "estado"]
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Tanto las ligaduras como los estados pueden cambiar durante la ejecución de
  un programa imperativo.

- El **estado de un programa** es el conjunto de los estados de todas sus
  variables (más cierta información auxiliar gestionada por el intérprete).

## Marcos en programación imperativa

- Hasta ahora, los marcos contenían ligaduras entre identificadores y valores.

- A partir de ahora, un marco contendrá:

  - Las **ligaduras entre identificadores y variables**, y

  - El **estado de cada variable**, es decir, las referencias que contiene cada
    variable en un momento dado.

!DOT(marcos-imperativa.svg)()(width=30%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
subgraph cluster0 {
    label = "Montículo"
    bgcolor = grey95
    style = rounded
    4 [shape = circle, width = 0.3, fixedsize = shape]
    5 [shape = circle, width = 0.3, fixedsize = shape]
}
subgraph cluster1 {
    label = "Marco global"
    bgcolor = white
    node [fixedsize = shape, fontname = "monospace"]
    x [shape = plaintext, fillcolor = transparent, width = 0.01]
    y [shape = plaintext, fillcolor = transparent, width = 0.01]
    v1 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    v2 [label = "⬤", width = 0.3, height = 0.3, fixedsize = true]
    x -> v1 -> 4
    y -> v2 -> 5
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Para simplificar la representación gráfica, generalmente dibujaremos cada
  identificador al lado de su correspondiente variable (representando la
  _ligadura_), y la variable apuntando a su valor en el montículo
  (representando el _estado_).

!DOT(marcos-imperativa-simplificado.svg)()(width=20%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
5 [shape = circle, width = 0.3, fixedsize = shape]
4 [shape = circle, width = 0.3, fixedsize = shape]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x:f1 -> 4
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El montículo como tal normalmente no lo dibujaremos, ya que sabemos que los
  valores se almacenan en él.

- Igualmente, a veces tampoco dibujaremos el marco si se sobreentiende cuál es
  (o si no tiene importancia en ese momento).

- A veces, y llegado el caso, también dibujaremos el valor directamente
  almacenado en la variable que le apunta, para simplificar (aunque sabemos que
  eso no es lo que ocurre en Python).

## Sentencia de asignación

- La forma más básica de cambiar el estado de una variable es usando la
  **sentencia de asignación**.

- Es la misma instrucción que hemos estado usando hasta ahora para ligar
  valores a identificadores, pero ahora, en el paradigma imperativo, tiene otro
  significado:

  ```python
  x = 4      # se lee: «asignar el valor 4 a la variable x»
  ```

  El efecto que produce es el de almacenar, en la variable ligada al
  identificador !PYTHON(x), una referencia al valor !PYTHON(4) almacenado en el
  montículo.

  Normalmente se dice (mal dicho) que «la variable !PYTHON(x) pasa a valer
  !PYTHON(4)».

- La asignación es **destructiva** porque al cambiarle el valor a una variable
  se destruye su valor anterior. Por ejemplo, si ahora hacemos:

  ```python
  x = 9
  ```

  El valor de la variable a la que está ligada el identificador !PYTHON(x) pasa
  ahora a ser `9`, perdiéndose el valor !PYTHON(4) anterior.

---

- Por abuso del lenguaje, se suele decir:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor !PYTHON(9) a la variable !PYTHON(x)»*
  ~~~~~~~~~~~~~~~~~~~~~~~

  o

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor !PYTHON(9) a la variable ligada al identificador
  !PYTHON(x)»*
  ~~~~~~~~~~~~~~~~~~~~~~~

  en lugar de la forma correcta:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna una referencia al valor !PYTHON(9) a la variable ligada al
  identificador !PYTHON(x)»*.
  ~~~~~~~~~~~~~~~~~~~~~~~

- Aunque esto simplifica las cosas a la hora de hablar, hay que tener cuidado,
  porque llegado el momento es posible tener:

  - Varios identificadores distintos ligados a la misma variable (ocurre en
    algunos lenguajes, aunque no en Python ni Java).

  - Un mismo identificador ligado a distintas variables en diferentes puntos
    del programa.

  - Varias variables apuntando al mismo valor.

---

- Cada nueva asignación provoca un cambio de estado en el programa.

- En el ejemplo anterior, el programa pasa de estar en un estado en el que la
  variable !PYTHON(x) vale 4 a otro en el que la variable vale !PYTHON(9).

- Al final, un programa imperativo se puede reducir a una **secuencia de
  asignaciones** realizadas en el orden dictado por el programa.

- Este modelo de funcionamiento está estrechamente ligado a la arquitectura de
  un ordenador: hay una memoria formada por celdas que contienen datos que
  pueden cambiar a lo largo del tiempo según dicten las instrucciones del
  programa que controla al ordenador.

#### Un ejemplo completo

- Cuando se ejecuta la siguiente instrucción en el ámbito global:

  ```python
  x = 2500
  ```

  ocurre lo siguiente:

  1. Se crea el valor !PYTHON(2500) en el montículo y el intérprete devuelve
     una referencia al mismo.

     En determinadas situaciones, no crea un nuevo valor si ya había otro
     exactamente igual en el montículo, pero éste no es el caso.

  2. El intérprete identifica a qué variable está ligado el identificador
     !PYTHON(x) consultando el marco global (si no existía dicha variable, la
     crea en ese momento y la liga a !PYTHON(x)).

  3. Almacena en la variable la referencia creada en el paso 1.

## Evaluación de expresiones con variables

- Al evaluar expresiones, las variables actúan de modo similar a las ligaduras
  de la programación funcional, pero ahora los valores de las variables pueden
  cambiar a lo largo del tiempo, por lo que deberemos *seguirle la pista* a las
  asignaciones que sufran dichas variables.

- Todo lo visto hasta ahora sobre marcos, ámbitos, sombreado, entornos, etc. se
  aplica igualmente a las variables.

- Por ejemplo:

  ```python
  >>> x = 4
  >>> y = 3
  >>> x * y + 5
  17
  >>> x = 9
  >>> x * y + 5
  32
  ```

## Constantes

- En programación funcional no existen las variables y un identificador sólo
  puede ligarse a un valor (un identificador ligado no puede re-ligarse a otro
  valor distinto).

  - En la práctica, eso significa que un identificador ligado actúa como un
    valor constante que no puede cambiar durante la ejecución del programa.

  - El valor de esa constante es el valor al que está ligado el identificador.

- En programación imperativa, los identificadores se ligan a variables, que son
  las que realmente apuntan a los valores.

- Una **constante** en programación imperativa sería el equivalente a una
  variable cuyo valor no puede cambiar durante la ejecución del programa.

---

- Muchos lenguajes de programación permiten definir constantes, pero **Python
  no es uno de ellos**.

- En Python, una constante **es una variable más**, pero **es responsabilidad
  del programador** no cambiar su valor durante todo el programa.

- Python no hace ninguna comprobación ni muestra mensajes de error si se cambia
  el valor de una constante.

- En Python, por **convenio**, los identificadores ligados a una variable con
  valor constante se escriben con todas las letras en **mayúscula**:

  ```python
  PI = 3.1415926
  ```

  El nombre en mayúsculas nos recuerda que !PYTHON(PI) es una constante.

- Aunque nada nos impide cambiar su valor (cosa que debemos evitar):

  ```python
  PI = 99
  ```

## Tipado estático vs. dinámico

- Cuando una variable tiene asignado un valor, al ser usada en una expresión
  actúa como si fuera ese valor.

- Como cada valor tiene un tipo de dato asociado, también podemos hablar del
  **tipo de una variable**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  El **tipo de una variable** es el tipo del dato al que hace referencia la
  variable.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si a una variable se le asigna otro valor de un tipo distinto al del valor
  anterior, el tipo de la variable cambia y pasa a ser el del nuevo valor que
  se le ha asignado.

---

- Eso quiere decir que **el tipo de una variable podría cambiar durante la
  ejecución del programa**.

- A este enfoque se le denomina **tipado dinámico**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado dinámico:**

  Son aquellos que **permiten** que el tipo de una variable **cambie** durante
  la ejecución del programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En contraste con los lenguajes de tipado dinámico, existen los llamados
  **lenguajes de tipado estático**.

- En un lenguaje de tipado estático, el tipo de una variable se define una sola
  vez (en la fase de compilación o justo al empezar a ejecutarse el programa),
  y **no puede cambiar** durante la ejecución del mismo.

---

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Lenguajes de tipado estático:**

  Son aquellos que asocian forzosamente un tipo a cada variable del programa
  desde que comienza a ejecutarse y **prohíben** que dicho tipo **cambie**
  durante la ejecución del programa.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Estos lenguajes disponen de construcciones sintácticas que permiten declarar
  de qué tipo serán los datos que se pueden asignar a una variable.

  Por ejemplo, en Java podemos hacer:

  ```java
  String x;
  ```

  con lo que declaramos que a !JAVA(x) sólo se le podrán asignar valores de
  tipo !JAVA(String) (es decir, *cadenas*) desde el primer momento y a lo largo
  de toda la ejecución del programa.

---

- A veces, se pueden realizar al mismo tiempo la declaración del tipo y la
  asignación del valor:

  ```java
  String x = "Hola";
  ```

- Otros lenguajes disponen de un mecanismo conocido como **inferencia de
  tipos**, que permite *deducir* automáticamente el tipo de una variable.

- Por ejemplo, en Java podemos hacer:

  ```java
  var x = "Hola";
  ```

  El compilador de Java deduce que la variable !JAVA(x) debe ser de tipo
  !JAVA(String) porque se le está asignando una cadena (el valor
  !JAVA("Hola")).

---

- Normalmente, los lenguajes de tipado estático son también lenguajes
  compilados y también fuertemente tipados.

- Asimismo, los lenguajes de tipado dinámico suelen ser lenguajes interpretados
  y a veces también son lenguajes débilmente tipados.

- Pero nada impide que un lenguaje de tipado dinámico pueda ser compilado, por
  ejemplo.

- Los tres conceptos de:

  - Compilado vs. interpretado

  - Tipado fuerte vs. débil

  - Tipado estático vs. dinámico

  son diferentes aunque están estrechamente relacionados.

## Asignación compuesta

- Los operadores de **asignación compuesta** nos permiten realizar operaciones
  sobre una variable y luego asignar el resultado a la misma variable.

- Tienen la forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_compuesta) ::= !T(identificador)\  !NT(op)!T(=)\  !NT(expresión)
!NT(op) ::= !T(+) | !T(-) | !T( * ) | !T(/) | !T(%) | !T(//) | !T( ** ) | !T(&) | !T(|) | !T(^) | !T(>>) | !T(<<)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

-----------------------------------------------------------------
   Operador           Ejemplo              Equivalente a
----------------- ------------------- ---------------------------
!PYTHON(=)        !PYTHON(x = 5)         !PYTHON(x = 5)
                        
!PYTHON(+=)       !PYTHON(x += 5)        !PYTHON(x = x + 5)
                        
!PYTHON(-=)       !PYTHON(x -= 5)        !PYTHON(x = x - 5)
                        
!PYTHON(*=)       !PYTHON(x *= 5)        !PYTHON(x = x * 5)
                        
!PYTHON(/=)       !PYTHON(x /= 5)        !PYTHON(x = x / 5)
                        
!PYTHON(%=)       !PYTHON(x %= 5)        !PYTHON(x = x % 5)
                        
!PYTHON(//=)      !PYTHON(x //= 5)       !PYTHON(x = x // 5)
                        
!PYTHON(**=)      !PYTHON(x **= 5)       !PYTHON(x = x ** 5)
                        
!PYTHON(&=)       !PYTHON(x &= 5)        !PYTHON(x = x & 5)
                        
!PYTHON(|=)       !PYTHON(x |= 5)        !PYTHON(x = x | 5)
                        
!PYTHON(^=)       !PYTHON(x ^= 5)        !PYTHON(x = x ^ 5)
                        
!PYTHON(>>=)      !PYTHON(x >>= 5)       !PYTHON(x = x >> 5)
                        
!PYTHON(<<=)      !PYTHON(x <<= 5)       !PYTHON(x = x << 5)
-----------------------------------------------------------------

<!-- -->

## Asignación múltiple

- Con la **asignación múltiple** podemos asignar valores a varias variables
  **al mismo tiempo** en una sola sentencia.

- La sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(asig_múltiple) ::= !NT(lista_identificadores) !T(=) !NT(lista_expresiones)
!NT(lista_identificadores) ::= !T{identificador} (!T(,) !T{identificador})\*
!NT(lista_expresiones) ::= !NT{expresión}(!T(,) !NT{expresión})\*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  con la condición de que tiene que haber tantos identificadores como
  expresiones.

- Por ejemplo:

  ```python
  x, y = 10, 20
  ```

  asigna el valor !PYTHON(10) a !PYTHON(x) y el valor !PYTHON(20) a !PYTHON(y).

# Mutabilidad

## Estado de un dato

- Ya hemos visto que en programación imperativa es posible cambiar el estado de
  una variable asignándole un nuevo valor (un nuevo dato).

- Al hacerlo, no estamos cambiando el valor en sí, sino que estamos
  sustituyendo el valor de la variable por otro nuevo, mediante el uso de la
  asignación destructiva.

- Sin embargo, también existen valores que poseen su propio **estado interno**
  y es posible cambiar dicho estado, no asignando un nuevo valor a la variable
  que lo contiene, sino **modificando el contenido de dicho valor**.

- Es decir: no estaríamos **cambiando** el estado de la variable (haciendo que
  ahora contenga un nuevo valor) sino **el estado interno** del propio valor
  contenido dentro de la variable.

- Los valores que permiten cambiar su estado interno se denominan **mutables**.

## Tipos mutables e inmutables

- En Python existen tipos cuyos valores son *inmutables* y otros que son
  *mutables*.

- Un valor **inmutable** es aquel cuyo estado interno no puede cambiar durante
  la ejecución del programa.

  Los tipos inmutables en Python son los números (!PYTHON(int) y
  !PYTHON(float)), los booleanos (!PYTHON(bool)), las cadenas (!PYTHON(str)),
  las tuplas (!PYTHON(tuple)), los rangos (!PYTHON(range)) y los conjuntos
  congelados (!PYTHON(frozenset)).

- Un valor **mutable** es aquel cuyo estado interno (normalmente, su
  **contenido**) puede cambiar durante la ejecución del programa.

  El principal tipo mutable en Python es la lista (!PYTHON(list)), pero también
  están los conjuntos (!PYTHON(set)) y los diccionarios (!PYTHON(dict)).

### Inmutables

- Un valor de un tipo inmutable no puede cambiar su estado interno.

:::::: columns

:::: column

Por ejemplo, si tenemos:

```python
x = 4
y = 5
```

!DOT(inmutable1.svg)()(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
4 [shape = circle, width = 0.3]
5 [shape = circle, width = 0.3]
x:f1 -> 4
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 7
```

quedaría:

!DOT(inmutable2.svg)()(width=40%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
5 [shape = circle, width = 0.3]
7 [shape = circle, width = 0.3]
4 [shape = circle, width = 0.3]
x:f1 -> 7
x:f1 -> 4 [style = dashed, color = grey]
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- Lo que hace la asignación !PYTHON(x = 7) no es cambiar el contenido del valor
  !PYTHON(4), sino hacer que la variable !PYTHON(x) contenga otro valor
  distinto (el valor !PYTHON(4) en sí mismo no se cambia internamente en ningún
  momento).

---

- Con las cadenas sería exactamente igual.

- Si tenemos:

  ```python
  x = 'hola'
  ```

  !DOT(inmutable3.svg)()(width=25%)(width=30%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x:f1 -> hola
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

  y luego hacemos:

  ```python
  x = 'hola manolo'
  ```

  **se crea una nueva cadena** y se la asignamos a la variable !PYTHON(x).
  
  Es decir: la cadena !PYTHON('hola') original **no se cambia** (p. ej., no se
  le añade !PYTHON(' manolo') al final), sino que **se sustituye por una
  nueva**.

  !DOT(inmutable4.svg)()(width=35%)(width=40%)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  splines = polyline
  node [fixedsize = shape, fontname = "monospace"]
  x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
  holamanolo [shape = ellipse, width = 1.8, label = "'hola manolo'", fixedsize = true] 
  hola [shape = ellipse, width = 0.8, label = "'hola'", fixedsize = true]
  x:f1 -> holamanolo
  x:f1 -> hola [style = dashed, color = grey]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Aunque las cadenas son datos inmutables, también son datos compuestos y
  podemos acceder individualmente a sus elementos componentes y operar con
  ellos aunque no podamos cambiarlos.

- Para ello podemos usar las operaciones comunes a toda secuencia de elementos
  (una cadena también es una **secuencia de caracteres**):

--------------------------------------------------------------------------------------
Operación                    Resultado
---------------------------- ---------------------------------------------------------
$x\ $ !PYTHON(in) $\ s$      !PYTHON(True) si $\underline{x}$ está en $\underline{s}$

$x\ $ !PYTHON(not in) $\ s$  !PYTHON(True) si $\underline{x}$ **no** está en
                             $\underline{s}$

$s$`[`$i$`]`                 (*Indexación*) El $\underline{i}$-ésimo elemento
                             de $\underline{s}$, empezando por 0

$s$`[`$i$`:`$j$`]`           (*Slicing*) Rodaja de $\underline{s}$ desde
                             $\underline{i}$ hasta $\underline{j}$

$s$`[`$i$`:`$j$`:`$k$`]`     Rodaja de $\underline{s}$ desde $\underline{i}$
                             hasta $\underline{j}$ con paso $\underline{k}$

$s$!PYTHON(.index)`(`$x$`)`  Índice de la primera aparición de $\underline{x}$
                             en $\underline{s}$

$s$!PYTHON(.count)`(`$x$`)`  Número de veces que aparece $\underline{x}$ en
                             $\underline{s}$
--------------------------------------------------------------------------------------

---

- El *operador* de **indexación** consiste en acceder al elemento situado en la
  posición indicada entre corchetes:

:::: columns

::: column

```python
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
    0   1   2   3   4   5
   -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[2]
't'
>>> s[-2]
'o'
```

:::

::::

!SALTOBEAMER

- El **slicing** (*hacer rodajas*) es una operación que consiste en obtener una
  subsecuencia a partir de una secuencia, indicando los índices de los
  elementos inicial y final de la misma:

:::: columns

::: column

```python
     con paso positivo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
  0   1   2   3   4   5   6
 -6  -5  -4  -3  -2  -1

     con paso negativo
  +---+---+---+---+---+---+
s | P | y | t | h | o | n |
  +---+---+---+---+---+---+
      0   1   2   3   4   5
 -7  -6  -5  -4  -3  -2  -1
```

:::

::: column

```python
>>> s[0:2]
'Py'
>>> s[-5:-4]
'y'
>>> s[-4:-5]
''
>>> s[0:4:2]
'Pt'
>>> s[-3:-6]
''
>>> s[-3:-6:-1]
'hty'
```

:::

::::

### Mutables

- Los valores de tipos **mutables**, en cambio, pueden cambiar su estado
  interno durante la ejecución del programa.

- El tipo mutable más frecuente es la **lista**.

- Una lista es como una tupla que puede cambiar sus elementos, aumentar o
  disminuir de tamaño (puede cambiar su contenido y, por tanto, su estado).

- Al cambiar el estado interno de una lista no se crea una nueva lista, sino
  que **se modifica la ya existente**:

  ```python
  >>> x = [24, 32, 15, 81]
  >>> x[1] = 99
  >>> x
  [24, 99, 15, 81]
  ```

---

:::: columns

::: column

!DOT(cambio-estado-lista-antes.svg)(La lista antes de cambiar `x[`1`]`)(width=75%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
99 [style= invis, width = 0.6]
24 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6]
15 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
lista:f0 -> 24
lista:f1 -> 99 [style = invis]
lista:f1 -> 32
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

!DOT(cambio-estado-lista-despues.svg)(La lista después de cambiar `x[`1`]`)(width=75%)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
99 [shape = circle, width = 0.6]
24 [shape = circle, width = 0.6]
32 [shape = circle, width = 0.6]
15 [shape = circle, width = 0.6]
81 [shape = circle, width = 0.6]
lista:f0 -> 24
lista:f1 -> 99
lista:f1 -> 32 [style = dashed, color = grey]
lista:f2 -> 15
lista:f3 -> 81
x:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- Las listas son secuencias mutables y, como tales, se pueden modificar usando
  ciertas operaciones:

  - Los *operadores* de **indexación** y **slicing** combinados con !PYTHON(=)
    y !PYTHON(del):

    ```
      +-----+-----+-----+-----+-----+-----+
    l | 124 | 333 | 'a' | 3.2 |  9  |  53 |
      +-----+-----+-----+-----+-----+-----+
      0     1     2     3     4     5     6
     -6    -5    -4    -3    -2    -1
    ```

    ```python
    >>> l = [124, 333, 'a', 3.2, 9, 53]
    >>> l[3]
    3.2
    >>> l[3] = 99
    >>> l
    [124, 333, 'a', 99, 9, 53]
    >>> l[0:2] = [40]
    >>> l
    [40, 'a', 99, 9, 53]
    >>> del l[3]
    >>> l
    [40, 'a', 99, 53]
    ```

  - *Métodos* como !PYTHON(append), !PYTHON(clear), !PYTHON(insert),
    !PYTHON(remove), !PYTHON(reverse) o !PYTHON(sort).

- Las siguientes tablas muestran todas las **operaciones** que nos permiten
  **modificar secuencias mutables**.

---

($\underline{s}$ y $\underline{t}$ son listas, y $\underline{x}$ es un valor
cualquiera)

-------------------------------------------------------------------------------------------
Operación                     Resultado
----------------------------  -------------------------------------------------------------
$s$`[`$i$`]` `=` $x$          El elemento $i$-ésimo de $\underline{s}$ se sustituye
                              por $\underline{x}$

$s$`[`$i$`:`$j$`]`            La rodaja de $\underline{s}$ desde $\underline{i}$ hasta
`=` $t$                       $\underline{j}$ se sustituye por $\underline{t}$

$s$`[`$i$`:`$j$`:             Los elementos de $s$`[`$i$`:`$j$`:`$k$`]` se sustituyen
`$k$`]` `=` $t$               por $\underline{t}$

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`]` \
`$j$`]`                       Equivale a hacer $s$`[`$i$`:`$j$`]` `=` `[]`

!PYTHON(del) $\ s$`[`$i$`:    Elimina los elementos de $s$`[`$i$`:`$j$`:`$k$`]`
`$j$`:`$k$`]`
-------------------------------------------------------------------------------------------

---

----------------------------------------------------------------------------------------------------------------
Operación                        Resultado
-------------------------------  -------------------------------------------------------------------------------
$s$!PYTHON(.append)`(`$x$`)`     Añade $\underline{x}$ al final de $\underline{s}$ \
                                 Equivale a hacer $s$!PYTHON([len)`(`$s$!PYTHON{):len(}$s$`)]` `=` `[`$x$`]`

$s$!PYTHON(.clear())             Elimina todos los elementos de $\underline{s}$ \
                                 Equivale a hacer !PYTHON(del) $\ s$`[:]`

$s$!PYTHON(.extend)`(`$t$`)`     Amplía $\underline{s}$ con el contenido de $\underline{t}$ \
ó \                              Equivale a hacer $s$!PYTHON([len)`(`$s$!PYTHON{):len(}$s$`)]` `=` $t$
$s$ !PYTHON(+=) $t$

$s$!PYTHON(.insert)`(`$i$`,`     Inserta $\underline{x}$ en $\underline{s}$ en el índice $\underline{i}$ \
$x$`)`                           Equivale a hacer $s$`[`$i$`:`$i$`]` `=` `[`$x$`]`

$s$!PYTHON(.pop)`(`[$i=-1$]`)`   Devuelve el elemento $i$-ésimo y lo elimina de $\underline{s}$

$s$!PYTHON(.remove)`(`$x$`)`     Elimina el primer elemento de $\underline{s}$ que sea igual a
                                 $\underline{x}$

$s$!PYTHON{.reverse()}           Invierte los elementos de $\underline{s}$
----------------------------------------------------------------------------------------------------------------

---

Partiendo de !PYTHON(x = [8, 10, 7, 9]):

--------------------------------------------------------
Ejemplo                    Valor de !PYTHON(x) después
-------------------------- -----------------------------
!PYTHON(x.append(14))      !PYTHON([8, 10, 7, 9, 14])

!PYTHON(x.clear())         !PYTHON([])

!PYTHON(x.insert(3, 66))   !PYTHON([8, 10, 7, 66, 9])

!PYTHON(x.remove(7))       !PYTHON([8, 10, 9])

!PYTHON(x.reverse())       !PYTHON([9, 7, 10, 8])
--------------------------------------------------------

## Alias de variables

- Cuando una variable que tiene un valor se asigna a otra, ambas variables
  pasan a tener **el mismo valor (lo _comparten_)**, produciéndose un fenómeno
  conocido como **alias de variables**.

  ```python
  x = [66, 77, 88, 99]
  y = x  # x se asigna a y; ahora y tiene el mismo valor que x
  ```

- Esto se debe a que las variables almacenan **referencias** a los valores, no
  los valores en sí mismos.

:::: columns

::: column

!DOT(alias1.svg)()(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
40 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
lista:f0 -> 66
lista:f1 -> 77
lista:f2 -> 88 [style = dashed, color = grey]
lista:f2 -> 40
lista:f3 -> 99
x:f1 -> lista
y:f1 -> lista
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: column

- Si el valor es **mutable** y cambiamos su **contenido** desde !PYTHON(x),
  también cambiará !PYTHON(y) (y viceversa), pues ambas variables **apuntan al
  mismo dato**:

  ```python
  >>> y[2] = 40
  >>> x
  [66, 77, 40, 99]
  ```

:::

::::

---

- No es lo mismo cambiar el **valor** que cambiar el **contenido** del valor.

- Cambiar el **contenido** es algo que sólo se puede hacer si el valor es
  **mutable** (por ejemplo, cambiando un elemento de una lista):

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y[2] = 40
```

:::

::: {.column width=60%}

!IMGP(alias1.svg)()(width=60%)(width=40%)

:::

::::

---

- Cambiar el **valor** es algo que **siempre** se puede hacer (da igual la
  mutabilidad) simplemente **asignando** a la variable **un nuevo valor**:

:::: columns

::: {.column width=40%}

```python
>>> x = [66, 77, 88, 99]
>>> y = x
>>> y = [1, 2, 3]
```

:::

::: {.column width=60%}

!DOT(alias2.svg)()(width=60%)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.7, height = 0.5, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
lista1 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤|<f3>⬤}"]
lista2 [shape = record, width = 1.5, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
66 [shape = circle, width = 0.6]
77 [shape = circle, width = 0.6]
88 [shape = circle, width = 0.6]
99 [shape = circle, width = 0.6]
1 [shape = circle, width = 0.6]
2 [shape = circle, width = 0.6]
3 [shape = circle, width = 0.6]
lista1:f0 -> 66
lista1:f1 -> 77
lista1:f2 -> 88
lista1:f3 -> 99
lista2:f0 -> 1
lista2:f1 -> 2
lista2:f2 -> 3
x:f1 -> lista1
y:f1 -> lista1 [style = dashed, color = grey]
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- El intérprete puede crear alias de variables **implícitamente** para ahorrar
  memoria y sin que seamos conscientes de ello.

- No tiene mucha importancia práctica, aunque es interesante saberlo en ciertos
  casos.

- Por ejemplo, el intérprete de Python crea internamente todos los números
  enteros comprendidos entre $-5$ y $256$, por lo que todas las variables de
  nuestro programa que contengan el mismo valor dentro de ese intervalo
  compartirán el mismo valor (serán *alias*):

:::: columns

::: {.column width=50%}

```python
x = 5 # está entre -5 y 256
y = 5
```

!DOT(inmutable5a.svg)(Se comparte el valor)(width=35%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
5 [shape = circle, width = 0.3, fixedsize = shape]
x:f1 -> 5
y:f1 -> 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=50%}

```python
x = 480 # no está entre -5 y 256
y = 480
```

!DOT(inmutable5b.svg)(No se comparte el valor)(width=35%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
c1 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
c2 [shape = circle, width = 0.5, fixedsize = shape, label = "480"]
x:f1 -> c1
y:f1 -> c2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::::

---

- También crea valores compartidos cuando contienen exactamente las mismas
  cadenas.

!SALTOLARGOBEAMER

:::::: columns

:::: column

Si tenemos:

```python
x = 'hola'
y = 'pepe'
```

!DOT(inmutable6.svg)()(width=45%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

:::: column

y hacemos:

```python
x = 'pepe'
```

quedaría:

!DOT(inmutable7.svg)()(width=45%)(width=30%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = polyline
node [fixedsize = shape, fontname = "monospace"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
hola [shape = ellipse, width = 1.0, fixedsize = true, label = "'hola'"]
pepe [shape = ellipse, width = 1.0, fixedsize = true, label = "'pepe'"]
x:f1 -> hola [style = dashed, color = grey]
x:f1 -> pepe
y:f1 -> pepe
~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

- El intérprete aprovecharía el dato ya creado y no crearía uno nuevo, para
  ahorrar memoria.

---

- También se comparten valores si se usa el mismo dato varias veces.

- Por ejemplo, si hacemos:

```python
>>> x = [1, 2, 3]
>>> y = [x, x]
>>> y
[[1, 2, 3], [1, 2, 3]]
```

nos quedaría:

!DOT(alias3.svg)()(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1
lista1:f1 -> 2
lista1:f2 -> 3
lista2:f0 -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Y si ahora hacemos:

```python
>>> y[0][0] = 99
>>> x[1] = 77
>>> y
[[99, 77, 3], [99, 77, 3]]
```

nos quedaría:

!DOT(alias4.svg)()(width=50%)(width=25%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fixedsize = shape, fontname = "monospace"]
y [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>y|<f1>⬤}"]
x [shape = record, fillcolor = white, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>x|<f1>⬤}"]
1 [shape = circle, width = 0.3, fixedsize = shape]
2 [shape = circle, width = 0.3, fixedsize = shape]
99 [shape = circle, width = 0.3, fixedsize = shape]
77 [shape = circle, width = 0.3, fixedsize = shape]
3 [shape = circle, width = 0.3, fixedsize = shape]
lista1 [shape = record, width = 0.7, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤|<f2>⬤}"]
lista2 [shape = record, width = 0.5, height = 0.3, fixedsize = true, label = "{<f0>⬤|<f1>⬤}"]
lista1:f0 -> 1 [style = dashed, color = grey]
lista1:f1 -> 2 [style = dashed, color = grey]
lista1:f0 -> 99
lista1:f1 -> 77
lista1:f2 -> 3
lista2:f0 -> lista1
lista2:f1 -> lista1
x:f1 -> lista1
y:f1 -> lista2
~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Recolección de basura

- En el momento en que un valor se vuelva inaccesible (cosa que ocurrirá
  cuando no haya ninguna variable en el entorno que contenga una referencia a
  dicho valor), el intérprete lo marcará como *candidato para ser eliminado*.

- Cada cierto tiempo, el intérprete activará el **recolector de basura**, que
  es un componente que se encarga de liberar de la memoria a los valores que
  están marcados como candidatos para ser eliminados.

- Por tanto, el programador Python no tiene que preocuparse de gestionar
  manualmente la memoria ocupada por los datos que componen su programa.

---

- Por ejemplo:

  ```python
  lista1 = [1, 2, 3]  # crea la lista y guarda una referencia a ella en lista1
  lista2 = lista1     # almacena en lista2 la referencia que hay en lista1
  ```

  A partir de ahora, ambas variables apuntan al mismo dato.

  ```python
  del lista1          # elimina una referencia pero el dato aún tiene otra
  del lista2          # elimina la otra referencia y ahora el dato es inaccesible
  ```

  Desde este momento, la próxima vez que se active el recolector de basura se
  active, eliminará la lista.

### !PYTHON(id)

- Para saber si dos variables comparten **el mismo dato**, se puede usar la
  función !PYTHON(id).

- La función !PYTHON(id) devuelve un **identificador único** para cada dato.

- Por tanto, si dos variables tienen el mismo !PYTHON(id), significa que el
  valor que contienen es realmente el mismo valor.
  
- Normalmente, el !PYTHON(id) de un valor se corresponde con la dirección de
  memoria donde está almacenado dicho valor.

:::: columns

::: column

```python
>>> id('hola') == id('hola')
True
>>> x = 'hola'
>>> y = 'hola'
>>> id(x) == id(y)
True
```

:::

::: column

```python
>>> x = [1, 2, 3, 4]
>>> y = [1, 2, 3, 4]
>>> id(x) == id(y)
False
>>> y = x
>>> id(x) == id(y)
True
```

:::

::::

### !PYTHON(is)

- Otra forma de comprobar si dos datos son realmente el mismo dato en memoria
  (es decir, si son **idénticos**) es usar el operador !PYTHON(is), que comprueba la
  **identidad** de un dato:

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~
  !NT(is) ::= !NT(valor1) !T(is) !NT(valor2)
  ~~~~~~~~~~~~~~~~~~~~~~~

- Es un operador relacional que devuelve !PYTHON(True) si !NT(valor1) y !NT(valor2)
  son **el mismo dato en memoria** (es decir, si se encuentran almacenados en
  la misma celda de la memoria y, por tanto, son **idénticos**) y !PYTHON(False) en
  caso contrario.

- Lo normal es usarlo con variables y, en tal caso, devuelve !PYTHON(True) si los
  datos que almacenan las variables son realmente el mismo dato.

- No tiene sentido usarlo con literales (y el intérprete lo advierte).

- En la práctica, equivale a hacer
  !PYTHON(id)`(`!NT(valor1)`)` `==` !PYTHON(id)`(`!NT(valor2)`)`.

# Cambios de estado ocultos

## Funciones puras

- Las **funciones puras** son aquellas que cumplen que:

  - su valor de retorno depende únicamente del valor de sus argumentos, y

  - calculan su valor de retorno sin provocar cambios de estado observables en
    el exterior de la función.

- Una llamada a una función pura se puede sustituir libremente por su valor de
  retorno sin afectar al resto del programa (es lo que se conoce como
  **transparencia referencial**).

- Las funciones *puras* son las únicas que existen en programación funcional.

## Funciones impuras

- Por contraste, una función se considera **impura**:

  - si su valor de retorno o su comportamiento dependen de algo más que de sus
    argumentos, o

  - si provoca cambios de estado observables en el exterior de la función.

    En éste último caso decimos que la función provoca **efectos laterales**.

- Toda función que provoca efectos laterales es impura, pero no todas las
  funciones impuras provocan efectos laterales (puede ser impura porque su
  comportamiento se vea afectado por los efectos laterales provocados por otras
  partes del programa).

## Efectos laterales

- Un **efecto lateral** es cualquier cambio de estado llevado a cabo por una
  parte del programa (normalmente, una función) que puede observarse desde
  otras partes del mismo, las cuales podrían verse afectadas por él de una
  manera poco evidente o impredecible.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Una función puede provocar efectos laterales, o bien verse afectada por
  efectos laterales provocados por otras partes del programa.

  En cualquiera de estos casos, tendríamos una función **impura**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Los casos típicos de efectos laterales en una función son:

  - Cambiar el valor de una variable global.

  - Cambiar el estado de un argumento mutable.

  - Realizar una operación de entrada/salida.

## Transparencia referencial

- En un lenguaje imperativo **se pierde la transparencia referencial**, ya que
  ahora el valor de una función puede depender no sólo de los valores de sus
  argumentos, sino también además de los valores de las variables libres que
  ahora pueden cambiar durante la ejecución del programa:

  ```python
  >>> suma = lambda x, y: x + y + z
  >>> z = 2
  >>> suma(3, 4)
  9
  >>> z = 20
  >>> suma(3, 4)
  27
  ```

- Por tanto, cambiar el valor de una variable global (en cualquier parte del
  programa) es considerado un **efecto lateral**, ya que puede alterar el
  comportamiento de otras partes del programa de formas a menudo impredecibles
  o poco evidentes.

---

- Cuando el efecto lateral lo produce la propia función también estamos
  perdiendo transparencia referencial, pues en tal caso no podemos sustituir
  libremente la llamada a la función por su valor de retorno, ya que ahora **la
  función hace _algo más_ que calcular dicho valor**, y ese _algo_ es
  observable fuera de la función.

- Por ejemplo, una función que imprime por la pantalla o escribe en un archivo
  del disco está provocando un efecto observable fuera de la función, por lo
  que tampoco es una función pura y, por tanto, en ella no se cumple la
  transparencia referencial.

- Lo mismo pasa con las funciones que modifican algún argumento mutable. Por
  ejemplo:

  ```python
  >>> ultimo = lambda x: x.pop()
  >>> lista = [1, 2, 3, 4]
  >>> ultimo(lista)
  4
  >>> ultimo(lista)
  3
  >>> lista
  [1, 2]
  ```

---

- Los efectos laterales hacen que sea muy difícil razonar sobre el
  funcionamiento del programa, porque las funciones impuras no pueden verse
  como simples correspondencias entre los datos de entrada y el resultado de
  salida, sino que además hay que tener en cuenta los **efectos ocultos** que
  producen en otras partes del programa.

- Por ello, se debe **evitar**, siempre que sea posible, escribir funciones
  impuras.

- Ahora bien: muchas veces, la función que se desea escribir tiene efectos
  laterales porque esos son, precisamente, los efectos deseados.

  - Por ejemplo, una función que actualice los salarios de los empleados en una
    base de datos, a partir del salario base y los complementos.

- En ese caso, es importante **documentar** adecuadamente la función para que,
  quien desee usarla, sepa perfectamente qué efectos produce más allá de
  devolver un resultado.

## Entrada y salida por consola

- Nuestro programa puede comunicarse con el exterior realizando **operaciones
  de entrada/salida**.

- Interpretamos la palabra *exterior* en un sentido amplio; por ejemplo:

  - El teclado
  - La pantalla
  - Un archivo del disco duro
  - Otro ordenador de la red

- La entrada/salida por consola se refiere a las operaciones de lectura de
  datos por el teclado y escritura por la pantalla.

- Las operaciones de entrada/salida se consideran **efectos laterales** porque
  producen cambios en el exterior o pueden hacer que el resultado de una
  función dependa de los datos leídos y, por tanto, no depender sólo de sus
  argumentos.

### !PYTHON(print)

- La función !PYTHON(print) imprime (*escribe*) por la salida (normalmente la
  pantalla) el valor de una o varias expresiones.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(print)`(`!NT{expresión}(`,` !NT{expresión})\* [`, sep=`!NT(expresión)][`, end=`!NT(expresión)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El `sep` es el *separador* y su valor por defecto es !PYTHON{' '} (un
  espacio).

- El `end` es el *terminador* y su valor por defecto es !PYTHON('\n') (el
  carácter de nueva línea).

- Las expresiones se convierten en cadenas antes de imprimirse.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23)
  hola pepe 23
  ```

#### Paso de argumentos por palabras clave

- Normalmente, los argumentos se pasan a los parámetros posicionalmente (lo que
  se denomina **paso de argumentos posicional**).

- Según este método, los argumentos se asignan a los parámetros
  correspondientes según la posición que ocupan en la llamada a la función (el
  primer argumento se asigna al primer parámetro, el segundo al segundo
  parámetro y así sucesivamente).

- En Python también existe el **paso de argumentos por palabra clave**, donde
  cada argumento se asigna a su parámetro indicando en la llamada el nombre del
  parámetro y el valor de su argumento correspondiente separados por un
  !PYTHON(=), como si fuera una asignación.

- Esta técnica se usa en la función !PYTHON(print) para indicar el separador o
  el terminador de la lista de expresiones a imprimir.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23, sep='*')
  hola*pepe*23
  >>> print('hola', 'pepe', 23, end='-')
  hola pepe 23-
  ```

#### El valor !PYTHON(None)

- Es importante resaltar que la función !PYTHON(print) **no devuelve** el valor
  de las expresiones, sino que las **imprime** (provoca el efecto lateral de
  cambiar la pantalla haciendo que aparezcan nuevos caracteres).

- La función !PYTHON(print) como tal no devuelve ningún valor, pero como en
  Python todas las funciones devuelven *algún* valor, en realidad lo que ocurre
  es que **devuelve un valor !PYTHON(None)**.

- !PYTHON(None) es un valor especial que significa «**ningún valor**» y se
  utiliza principalmente para casos en los que no tiene sentido que una función
  devuelva un valor determinado, como es el caso de !PYTHON(print).

- Pertenece a un tipo de datos especial llamado !PYTHON(NoneType) cuyo único
  valor posible es !PYTHON(None), y para comprobar si un valor es !PYTHON(None)
  se usa !NT(valor) !PYTHON(is None).
  
- Podemos comprobar que, efectivamente, !PYTHON(print) devuelve !PYTHON(None):

  ```python
  >>> print('hola', 'pepe', 23) is None
  hola pepe 23  # ésto es lo que imprime print
  True          # ésto es el resultado de comprobar si el valor de print es None
  ```

### !PYTHON(input)

- La función !PYTHON(input) *lee* datos introducidos desde la entrada
  (normalmente el teclado) y devuelve el valor del dato introducido, que
  siempre es una **cadena** a la cual se le ha eliminado el posible salto de
  línea final.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(input)`(`[_prompt_`:` !PYTHON(str)]`) -> `\  !PYTHON(str)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> nombre = input('Introduce tu nombre: ')
  Introduce tu nombre: Ramón
  >>> print('Hola,', nombre)
  Hola, Ramón
  ```

- Provoca el *efecto lateral* de alterar el estado de la consola imprimiendo el
  *prompt* y esperando a que desde el exterior se introduzca el dato
  solicitado (que en cada ejecución podrá tener un valor distinto).

- Eso hace que sea *impura* por partida doble: provoca un efecto lateral y
  puede devolver un resultado distinto cada vez que se la llama.

## Entrada y salida por archivos

- Para leer y/o escribir datos en un archivo, los pasos a seguir son (en este
  orden):

  #. Abrir el archivo en el modo adecuado con !PYTHON(open).

  #. Realizar las operaciones deseadas sobre el archivo.

  #. Cerrar el archivo con !PYTHON(close).

### !PYTHON(open)

- La función !PYTHON(open) abre un archivo y devuelve un objeto que lo
  representa. Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !PYTHON(open)`(`_nombre_`:` !PYTHON(str) [`, ` _modo_`:` !PYTHON(str)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El _nombre_ es una cadena que contiene el nombre del archivo a abrir.

- El _modo_ es otra cadena que contiene caracteres que describen de qué forma
  se va a usar el archivo.

- El valor devuelto es un objeto cuyo tipo depende del modo en el que se ha
  abierto el archivo.

---

- Los valores posibles de _modo_ son:

  ----------------------------------------------------------------------------------
      Carácter     Significado
  ---------------- -----------------------------------------------------------------
    !PYTHON('r')   Abre el archivo para lectura (valor predeterminado)

    !PYTHON('w')   Abre para escritura (si el archivo ya existe lo borrará)

    !PYTHON('x')   Abre para creación exclusiva (falla si el archivo ya existe)

    !PYTHON('a')   Abre para escritura, añadiendo al final del archivo si ya existe

    !PYTHON('b')   Modo binario

    !PYTHON('t')   Modo texto (valor predeterminado)

    !PYTHON('+')   Abre para lectura y escritura
  ----------------------------------------------------------------------------------

- El modo predeterminado es !PYTHON('r') (abrir para lectura en modo texto,
  sinónimo de !PYTHON('rt')).

- Los modos !PYTHON('w+') y !PYTHON('w+b') abren el archivo y lo borra si ya
  existe.

- Los modos !PYTHON('r+') y !PYTHON('r+b') abren el archivo sin borrarlo.

---

- Normalmente, los archivos se abren en **modo texto**, lo que significa que se
  leen y se escriben cadenas (valores de tipo !PYTHON(str)) desde y hacia el archivo,
  las cuales se codifican según una codificación específica que depende de la
  plataforma.

  Por ejemplo, los saltos de línea se escriben como `\n` en Unix o `\r\n` en
  Windows, y se leen siempre como `\n`.

- Al añadir una `b` en el modo se abre el archivo en **modo binario**. En tal
  caso, los datos se leen y se escriben en forma de objetos de tipo
  !PYTHON(bytes).

  El modo binario es el que debe usarse cuando se trabaje con archivos que no
  contengan texto (datos binarios _crudos_).

- Ejemplo:

  ```python
  f = open('salida.txt', 'w')
  ```

---

- El tipo de dato que devuelve !PYTHON(open) depende de cómo se ha abierto el
  archivo:

  - Si se ha abierto en **modo texto**, devuelve un !PYTHON(TextIOWrapper).

  - Si se ha abierto en **modo binario**, entonces depende:

    - En modo **sólo lectura**, devuelve un !PYTHON(BufferedReader).

    - En modo **sólo escritura o añadiendo al final**, devuelve un
      !PYTHON(BufferedWriter).

    - En modo **lectura/escritura**, devuelve un !PYTHON(BufferedRandom).

### !PYTHON(read)

- Para leer de un archivo, se puede usar el método !PYTHON(read) sobre el
  objeto que devuelve la función !PYTHON(open). Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.read)`(`[_tamaño_`:` !PYTHON(str)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El método devuelve una cadena (tipo !PYTHON(str)) si el archivo se abrió en
  modo texto, o un objeto de tipo !PYTHON(bytes) si se abrió en modo binario.

- El archivo contiene un **puntero interno** que indica hasta dónde se ha leído
  en el mismo. Cada vez que se llama al método !PYTHON(read), se mueve ese
  puntero para que en posteriores llamadas se continúe leyendo desde ese punto.

- Si se alcanza el final del archivo, se devuelve la cadena vacía
  (!PYTHON('')).

- El parámetro _tamaño_ es opcional:

  - Si se omite o es negativo, se devuelve todo lo que hay desde la posición
    actual del puntero hasta el final del archivo.

  - En caso contrario, se leerán y devolverán _al menos_ tantos caracteres (en
    modo texto) o bytes (en modo binario) como se haya indicado.

---

- Ejemplos de lectura de todo el archivo:

  ```python
  >>> f = open('entrada.txt', 'r')
  >>> f.read()
  'Este es el contenido del archivo.\n'
  >>> f.read()
  ''
  ```

- Ejemplos de lectura del archivo en varios trozos:

  ```python
  >>> f = open('entrada.txt', 'r')
  >>> f.read(4)
  'Este'
  >>> f.read(4)
  ' es '
  >>> f.read(4)
  'el c'
  >>> f.read()
  'ontenido del archivo\n'
  >>> f.read()
  ''
  ```

### !PYTHON(readline)

- El método !PYTHON(readline) también sirve para leer de un archivo y también se
  ejecuta sobre el objeto que devuelve !PYTHON(open) (y que representa al archivo
  abierto).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.readline)`(`[_tamaño_`:` !PYTHON(str)]`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- !PYTHON(readline) devuelve una línea del archivo, dejando el carácter de
  salto de línea (`\n`) al final.

- El salto de línea sólo se omite cuando es la última línea del archivo y éste
  no acaba en salto de línea.

- Si devuelve una cadena vacía (!PYTHON('')), significa que se ha alcanzado el
  final del archivo.

- Si se devuelve una cadena formada sólo por `\n`, significa que es una línea
  en blanco (una línea que sólo contiene un salto de línea).

---

- El parámetro _tamaño_ es opcional:

  - Si se omite o es negativo, se devuelve todo desde la posición actual del
    puntero hasta el final de la línea.

  - En caso contrario, se leerán y devolverán _al menos_ tantos caracteres (en
    modo texto) o bytes (en modo binario) como se haya indicado.

- Ejemplos:

:::: columns

::: column

```python
>>> f = open('entrada.txt', 'r')
>>> f.readline()
'Esta es la primera línea.\n'
>>> f.readline()
'Esta es la segunda.\n'
>>> f.readline()
'Y esta es la tercera.\n'
>>> f.readline()
''
```

:::

::: column

```python
>>> f = open('entrada.txt', 'r')
>>> f.readline(4)
'Esta'
>>> f.readline(4)
' es '
>>> f.readline()
'la primera línea.\n'
>>> f.readline()
'Esta es la segunda.\n'
>>> f.readline()
'Y esta es la tercera.\n'
>>> f.readline()
''
```

:::

::::

### !PYTHON(write)

- El método !PYTHON(write) sirve para escribir en un archivo y se ejecuta sobre
  el objeto que devuelve !PYTHON(open) (y que representa al archivo abierto).

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.write)`(`_contenido_`)`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El método escribe el _contenido_ en el !NT(archivo). Ese contenido debe ser
  una _cadena_ si el archivo se abrió en **modo texto**, o un _valor de tipo_
  !PYTHON(bytes) si se abrió en **modo binario**.

- Al escribir, modifica el puntero interno del archivo.

- Devuelve el número de caracteres o de bytes que se han escrito, dependiendo
  de si se abrió en modo texto o en modo binario.

---

- También se puede usar !PYTHON(print) para escribir en un archivo.

- En la práctica, no hay mucha diferencia entre usar !PYTHON(print) y usar
  !PYTHON(write).

- Hacer:

  ```python
  >>> f = open('archivo.txt', 'r+')
  >>> f.write('Hola Manolo\n')
  ```

  equivale a hacer:

  ```python
  >>> f = open('archivo.txt', 'r+')
  >>> print('Hola', 'Manolo', file=f)
  ```

- Hay que tener en cuenta los separadores y los saltos de línea que introduce
  !PYTHON(print).

- !PYTHON(print) escribe en el archivo !PYTHON(sys.stdout) mientras no se diga
  lo contrario.

### !PYTHON(seek) y !PYTHON(tell)

- El método !PYTHON(seek) situa el puntero interno del archivo en una
  determinada posición.

- El método !PYTHON(tell) devuelve la posición actual del puntero interno.

- Sus signaturas son:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.seek)`(`_offset_`:` !PYTHON(int)`) -> `\  !PYTHON(int)

!NT(archivo)!PYTHON(.tell)`() -> `\  !PYTHON(int)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El _offset_ es la posición a la que se desea mover el puntero, empezando por
  0 desde el comienzo del archivo.

- Además de mover el puntero, el método !PYTHON(seek) devuelve la nueva
  posición del puntero.

---

- Por ejemplo:

  ```python
  >>> f = open('archivo.txt', 'r+')       # abre en modo lectura/escritura
  >>> f.tell()
  0
  >>> f.readline()
  'Esta es la primera línea.\n'
  >>> f.tell()
  27
  >>> f.seek(0)
  0
  >>> f.readline()
  'Esta es la primera línea.\n'
  >>> f.seek(0)
  0
  >>> f.write('Cambiar')
  7
  >>> f.tell()
  7
  >>> f.seek(0)
  0
  >>> f.readline()
  'Cambiar la primera línea.\n'
  ```

### !PYTHON(close)

- El método !PYTHON(close) cierra un archivo previamente abierto por
  !PYTHON(open), finalizando la sesión de trabajo con el mismo.

- Su signatura es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(archivo)!PYTHON(.close())
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Siempre hay que cerrar un archivo previamente abierto, para así asegurarse de
  que los cambios realizados se vuelquen al archivo a través del sistema
  operativo y liberar inmediatamente los recursos del sistema que pudiera estar
  consumiendo.

- Una vez que se ha cerrado el archivo ya no se podrá seguir usando:

  ```python
  >>> f.close()
  >>> f.read()
  Traceback (most recent call last):
    File "<stdin>", line 1, in <module>
  ValueError: I/O operation on closed file.
  ```

---

- Podemos comprobar si un archivo ya se ha cerrado consultando su atributo
  !PYTHON(closed):

  ```python
  >>> f = open('archivo.txt', 'r')
  >>> f.closed
  False
  >>> f.close()
  >>> f.closed
  True
  ```

- Observa que no es un método (no lleva paréntesis), sino un atributo que
  contiene directamente un valor lógico que el propio objeto modifica al
  cambiar su estado de abierto a cerrado o viceversa.

# Saltos

## Incondicionales

- Un **salto incondicional** es una ruptura abrupta del flujo de control del
  programa hacia otro punto del mismo.

- Se llama *incondicional* porque no depende de ninguna condición, es decir, se
  lleva a cabo **siempre** que se alcanza el punto del salto.

- Históricamente, a esa instrucción que realiza saltos incondicionales se la ha
  llamado **instrucción _GOTO_**.

- El uso de instrucciones _GOTO_ es considerado, en general, una mala práctica
  de programación ya que favorece la creación del llamado **código
  _espagueti_**: programas con una estructura de control tan complicada que
  resultan casi imposibles de mantener.

- En cambio, usados controladamente y de manera local, puede ayudar a escribir
  soluciones sencillas y claras.

---

- Python no incluye la instrucción *GOTO* pero se puede simular usando el
  módulo `with_goto` del paquete llamado `goto-statement`:

  ```console
  $ sudo apt install python3-pip
  $ python3 -m pip install goto-statement
  ```

!SALTO

:::: columns

::: {.column width=37%}

- Sintaxis:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(goto) ::= !T(goto) !NT(etiqueta)
!NT(label) ::= !T(label) !NT(etiqueta)
!NT(etiqueta) ::= !T(.)!NT(identificador)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

:::

::: {.column width=63%}

- Un ejemplo de uso:

```python
from goto import with_goto

CODIGO = """
print('Esto se hace')
goto .fin
print('Esto se salta')
label .fin
print('Aquí se acaba')
"""

exec(with_goto(compile(CODIGO, '', 'exec')))
```

:::

::::

## Condicionales

- Un **salto condicional** es un salto que se lleva a cabo sólo si se cumple
  una determinada condición.

- En Python, usando el módulo `with_goto`, podríamos implementarlo de la
  siguiente forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(salto_condicional) ::= !T(if) !NT(condición)!T(:) !T(goto) !NT(etiqueta)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Ejemplo de uso:

  ```python
  from goto import with_goto

  CODIGO = """
  primero = 2
  ultimo = 25

  i = primero

  label .inicio
  if i == ultimo: goto .fin

  print(i, end=' ')
  i += 1
  goto .inicio

  label .fin
  """

  exec(with_goto(compile(CODIGO, '', 'exec')))
  ```

!BIBLIOGRAFIA
