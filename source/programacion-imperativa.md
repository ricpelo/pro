---
title: Programación imperativa
author: Ricardo Pérez López
!DATE
---

# Modelo de ejecución

## Máquina de estados

- La **programación imperativa** es un paradigma de programación basado en el
  concepto de **sentencia**.

- Un programa imperativo está formado por una sucesión de sentencias que se
  ejecutan en un orden determinado.

- Una sentencia es una instrucción del programa que lleva a cabo una de estas
  acciones:

  - **Cambiar el estado interno** del programa, normalmente mediante la llamada
    **sentencia de asignación**.

  - Cambiar el **flujo de control** del programa, haciendo que la ejecución se
    bifurque (*salte*) a otra parte del mismo.

- El modelo de ejecución de un programa imperativo es el de una **máquina de
  estados**, es decir, una máquina que va pasando por diferentes estados a
  medida que el programa va ejecutándose.

---

- En programación imperativa, el concepto de **tiempo** cobra mucha
  importancia: el programa actuará de una forma un otra según el estado en el
  que se encuentre, es decir, según el momento en el que estemos observando al
  programa.

  Eso significa que, ante los mismos datos de entrada, una función puede
  devolver **valores distintos en momentos distintos**.

- En programación funcional, en cambio, el comportamiento de una función no
  depende del momento en el que se ejecute, ya que siempre devolverá los mismos
  resultados ante los mismos datos de entrada.

- Eso significa que, para modelar el comportamiento de un programa imperativo,
  ya **no nos vale el modelo de sustitución**.

## Secuencia de instrucciones

- Un programa imperativo es una **secuencia de instrucciones**, y ejecutar un
  programa es provocar los **cambios de estado** que dictan las instrucciones
  en el **orden** definido por el programa.

- Las instrucciones del programa van provocando **transiciones** entre estados,
  haciendo que la máquina pase de un estado al siguiente.

- Para modelar el comportamiento de un programa imperativo tendremos que saber
  en qué estado se encuentra el programa, para lo cual tendremos que seguirle
  la pista desde su estado inicial al estado actual.

- Eso básicamente se logra «ejecutando» mentalmente el programa instrucción por
  instrucción y llevando la cuenta de los valores ligados a sus
  identificadores.

# Asignación destructiva

## Variables

- Una **variable** es un lugar en la **memoria** donde se puede **almacenar un
  valor**.

- El valor de una variable **puede cambiar** durante la ejecución del programa.

- A partir de ahora, un identificador no se liga directamente con un valor,
  sino que tendremos:

  - Una **ligadura** entre un identificador y una **variable**.

  - **La variable almacena el valor**.

!DOT(identificador-variable-valor.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
node [fontname = "monospace"]
identificador [shape = plaintext, fillcolor = transparent]
valor [shape = circle, width = 0.8, fixedsize = true]
identificador -> variable -> valor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Estado

- La **ligadura** es la asociación que se establece entre un identificador y
  una variable.

- El **estado de una variable** es el valor que tiene una variable en un
  momento dado.

  Por tanto, el estado es la asociación que se establece entre una variable y
  un valor.

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
  variables.

## Sentencia de asignación

- El estado de una variable se cambia usando la **sentencia de asignación**.

- Es la misma instrucción que hemos estado usando hasta ahora para ligar
  valores a identificadores, pero ahora, en el paradigma imperativo, tiene otro
  significado:

  ```python
  x = 4
  ```

  Significa que el identificador `x` está ligado a una variable cuyo valor pasa
  a ser `4`.

- La asignación es **destructiva** porque al cambiar un valor a una variable se
  destruye su valor anterior. Por ejemplo, si ahora hacemos:

  ```python
  x = 9
  ```

  El valor de la variable a la que está ligada el identificador `x` pasa ahora
  a ser `9`, perdiéndose el valor `4` anterior.

---

- Por abuso del lenguaje, se suele decir:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor `9` a la variable `x`»*
  ~~~~~~~~~~~~~~~~~~~~~~~

  en lugar de:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  *«se asigna el valor `9` a la variable ligada al identificador `x`»*
  ~~~~~~~~~~~~~~~~~~~~~~~

- Aunque esto simplifica las cosas a la hora de hablar, hay que tener cuidado,
  porque llegará el momento en el que podamos tener varios identificadores
  distintos ligados a la misma variable.

---

- Cada nueva asignación provoca un cambio de estado en el programa.

- En el ejemplo anterior, el programa pasa de estar en un estado en el que la
  variable `x` vale 4 a otro en el que la variable vale `9`.

- Al final, un programa imperativo se puede reducir a una **secuencia de
  asignaciones** realizadas en el orden dictado por el programa.

- Este modelo de funcionamiento está estrechamente ligado a la arquitectura de
  un ordenador: hay una memoria formada por celdas que contienen datos que
  pueden cambiar a lo largo del tiempo según dicten las instrucciones del
  programa que controla al ordenador.

## Evaluación de expresiones con variables

- Al evaluar expresiones, las variables actúan de modo similar a las ligaduras
  de la programación funcional, con la única diferencia de que su valor puede
  cambiar a lo largo del tiempo, por lo que deberemos *seguirle la pista* a las
  asignaciones que sufra dicha variable.

- Todo lo visto hasta ahora sobre marcos, ámbitos, sombreado de variables,
  entornos, etc. se aplica igualmente a las variables.

## Constantes

- En programación funcional no existen las variables y un identificador sólo
  puede ligarse a un valor (un identificador ligado no puede re-ligarse a otro
  valor distinto).

  - En la práctica, eso significa que un identificador ligado actúa como un
    valor constante que no puede cambiar durante la ejecución del programa.

  - El valor de esa constante es el valor al que está ligado el identificador.

- En programación imperativa, los identificadores se ligan a variables, que son
  las que realmente contienen los valores.

- Una **constante** en programación imperativa sería el equivalente a una
  variable cuyo valor no puede cambiar durante la ejecución del programa.

---

- Muchos lenguajes de programación permiten definir constantes, pero **Python
  no es uno de ellos**.

- En Python, una constante **es una variable más**, pero **es responsabilidad
  del programador** no cambiar su valor durante todo el programa.

- Python no hace ninguna comprobación ni muestra mensajes de error si se cambia
  el valor de una constante.

- En Python, por **convenio**, los identificadores ligados a un valor constante
  se escriben con todas las letras en **mayúscula**:

  ```python
  PI = 3.1415926
  ```

  El nombre en mayúsculas nos recuerda que `PI` es una constante.

- Aunque nada nos impide cambiar su valor (cosa que debemos evitar):

  ```python
  PI = 99
  ```

# Efectos laterales

## Concepto

- Las funciones que hemos visto hasta ahora en programación funcional son
  funciones **puras** en el sentido de que lo único que hacen es calcular su
  resultado sin afectar al exterior de la función.

- Cuando una función afecta a otras partes del programa decimos que es una
  función **impura** y que provoca **efectos laterales**, que son justamente
  los efectos que provoca en el exterior de la función.

- Los casos típicos de efectos laterales son:

  - Cambiar el valor de una variable global

  - Realizar una operación de entrada/salida

- También se considera efecto lateral a cualquier cambio que afecte a otras
  partes del programa de una manera no evidente o impredecible.

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

- Por tanto, cambiar el valor de una variable global es considerado un **efecto
  lateral**, ya que puede alterar el comportamiento de otras partes del
  programa de formas a menudo impredecibles.

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

- Las operaciones de entrada/salida se consideran *efectos laterales* porque
  producen cambios en el exterior o pueden provocar que el resultado de una
  función dependa de los datos leídos.

### La función `print()`

- La función `print()` imprime (*escribe*) por la salida (normalmente la
  pantalla) el valor de una o varias expresiones.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(print) ::= !T(print)!T{(}!NT{expresión}(!T(,) !NT{expresión})\*
                                [!T(, sep=)!NT(expresión)][!T(, end=)!NT(expresión)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El `sep` es el *separador* y su valor por defecto es `' '` (un espacio).

- El `end` es el *terminador* y su valor por defecto es `'\n'` (el carácter de
  nueva línea).

- Las expresiones se convierten en cadenas antes de imprimirse.

- Por ejemplo:

  ```python
  >>> print('hola', 'pepe', 23)
  hola pepe 23
  ```

#### El valor `None`

- Es importante resaltar que la función `print()` **no devuelve** el valor de
  las expresiones, sino que las **imprime** (provoca el efecto lateral de
  cambiar el estado de la pantalla haciendo que aparezcan nuevos caracteres.

- La función `print()` como tal no devuelve ningún valor, pero como en Python
  todas las funciones devuelven *algún* valor, en realidad lo que ocurre es que
  **devuelve un valor `None`**.

- `None` es un valor especial que significa **ningún valor** y se utiliza
  principalmente para casos en los que no tiene sentido que una función
  devuelva un valor determinado, como es el caso de `print()`.

- Pertenece a un tipo de datos especial llamado `NoneType` cuyo único valor
  posible es `None`.

- Podemos comprobar que, efectivamente, `print()` devuelve `None`:

  ```python
  >>> print('hola', 'pepe', 23) == True
  hola pepe 23  # ésto es lo que imprime print()
  True          # ésto es el resultado de comparar el valor de print() con True
  ```

### La función `input()`

- La función `input()` *lee* datos desde la entrada (normalmente el teclado) y
  devuelve el valor del dato introducido.

- Siempre devuelve una **cadena**.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(input) ::= !T(input)!T{(}[!NT(prompt)]!T{)}
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por ejemplo:

  ```python
  >>> nombre = input('Introduce tu nombre: ')
  >>> print('Hola,', nombre)
  Hola, Ramón
  ```

- Provoca el *efecto lateral* de alterar el estado de la consola imprimiendo el
  *prompt* y esperando a que desde el exterior se introduzca el dato
  solicitado (que en cada ejecución podrá tener un valor distinto).

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

:::: columns

::: column

- Python no incluye la instrucción *GOTO* pero se puede simular instalando un
  paquete llamado `goto-statement`:

  ```shell
  $ pip3 install --user goto-statement
  ```

:::

::: column

- Un ejemplo de uso:

  ```python
  from goto import with_goto

  CODE="""
  start = 2
  stop = 25

  i = start
  result = []

  label .begin
  if i == stop:
      goto .end

  result.append(i)
  i += 1
  goto .begin

  label .end
  print(result)
  """

  exec(with_goto(compile(CODE, '', 'exec')))
  ```

:::

::::

## Condicionales

## Implementación de bucles mediante saltos condicionales

