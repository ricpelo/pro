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

## Constantes

# Efectos laterales

## Transparencia referencial

## Entrada y salida por consola

### La función `print()`

### La función `input()`

# Saltos

## Incondicionales

## Condicionales

## Implementación de bucles mediante saltos condicionales

