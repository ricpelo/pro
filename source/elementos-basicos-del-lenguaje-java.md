---
title: Elementos básicos del lenguaje Java
author: Ricardo Pérez López
!DATE
---

# Tipos y valores en Java

## Introducción

- El lenguaje de programación Java es un **lenguaje de tipado estático**, lo
  que significa que cada variable y cada expresión tiene un tipo que se conoce
  en el momento de la compilación.

- El lenguaje de programación Java también es un **lenguaje fuertemente
  tipado**, porque los tipos limitan los valores que una variable puede
  contener o que una expresión puede producir, limitan las operaciones
  admitidas en esos valores y determinan el significado de las operaciones.

- El tipado estático fuerte ayuda a **detectar errores en tiempo de
  compilación**.

---

- Los **tipos** del lenguaje de programación Java se dividen en **dos
  categorías**:
  
  - Tipos **primitivos**.

  - Tipos **referencia**.

- Consecuentemente, en Java hay dos categorías de **valores**:

  - Valores primitivos.

  - Valores referencia.

---

 - Los **tipos primitivos** son:

   - El tipo **booleano** (!JAVA(boolean)).

   - Los tipos **numéricos**, los cuales a su vez son:

     - Los tipos **integrales**: !JAVA(byte), !JAVA(short), !JAVA(int),
       !JAVA(long) y !JAVA(char).

     - Los tipos **de coma flotante**: !JAVA(float) y !JAVA(double).

 - Los **tipos referencia** son:

   - Tipos de **clase**.

   - Tipos de **interfaz**.

   - Tipos de **_array_**.

- Además, hay un tipo especial que representa el valor **nulo** (!JAVA(null)).

---

- En Java, un objeto es una de estas dos cosas:

  - O bien es una instancia creada dinámicamente de un tipo de clase.

  - O bien es un _array_ creado dinámicamente.

- Los valores de un tipo referencia son referencias a objetos.

- Todos los objetos, incluidos los _arrays_, admiten los métodos de la clase
  `Object`.

- Las cadenas literales representan objetos de la clase `String`.

## Tipos primitivos

- Los **tipos primitivos** están predefinidos en Java y se identifican mediante
  su nombre, el cual es una palabra clave reservada en el lenguaje.

- Un valor primitivo es un valor de un tipo primitivo.

- Los valores primitivos **no son objetos** y no comparten estado con otros
  valores primitivos.

- En consecuencia, los valores primitivos no se almacenan en el montículo y,
  por tanto, las variables que contienen valores primitivos no guardan una
  referencia al valor, sino que almacenan el valor mismo.

- Los tipos primitivos son los **booleanos**, los **integrales** y los tipos de
  **coma flotante**.

### Booleanos

- El tipo booleano (!JAVA(boolean)) contiene dos valores, representados por los
  literales booleanos !JAVA{true} (verdadero) y !JAVA{false} (falso).

- Un literal booleano siempre es de tipo !JAVA(boolean).

- Sus operaciones son:

  -------------------------------- ------------------------------
  Igualdad:                        !JAVA(==), !JAVA(!=)
  Complemento lógico (_not_):      !JAVA(!)
  _And_, _or_ y _xor_ estrictos:   !JAVA(&), !JAVA(|), !JAVA(^)
  _And_ y _or_ perezosos:          !JAVA(&&), !JAVA(||)
  Condicional ternario:            !JAVA(? :)
  -------------------------------- ------------------------------

:::: columns

::: column

```java
jshell> true && false
$1 ==> false

jshell> false == false
$2 ==> true
```

:::

::: column

```java
jshell> true ^ false
$3 ==> true

jshell> !true
$4 ==> false
```

:::

::::

### Integrales

- Los **tipos integrales** son:

  - **Enteros** (!JAVA(byte), !JAVA(short), !JAVA(int) y !JAVA(long)): sus
    valores son **números enteros con signo** en complemento a dos.

  - **Caracteres** (!JAVA(char)): sus valores son **enteros sin signo** que
    representan caracteres Unicode almacenados en forma de _code units_ de
    UTF-16.

- Sus tamaños y rangos de valores son:

  -----------------------------------------------------------------------------------
  Tipo             Tamaño   Rango
  --------------   -------- ---------------------------------------------------------
  !JAVA(byte)      8 bits   !JAVA(-128) a !JAVA(127) inclusive
                  
  !JAVA(short)     16 bits  !JAVA(32768) a !JAVA(32767) inclusive
                  
  !JAVA(int)       32 bits  !JAVA(2147483648) a !JAVA(2147483647) inclusive
                  
  !JAVA(long)      64 bits  !JAVA(9223372036854775808) a !JAVA(9223372036854775807) inclusive
                  
  !JAVA(char)      16 bits  !JAVA('\u0000') a !JAVA('\uffff') inclusive, es decir, de !JAVA(0) a !JAVA(65535)
  -----------------------------------------------------------------------------------

---

- Los literales que representan números enteros pueden ser de tipo !JAVA(int) o
  de tipo !JAVA(long).

- Un literal entero será de tipo !JAVA(long) si lleva un sufijo `l` o `L`; en
  caso contrario, será de tipo !JAVA(int).

- Se pueden usar caracteres de subrayado (`_`) como separadores entre los
  dígitos del número entero.

- Los literales de tipos enteros se pueden expresar en:

  - **Decimal:** no puede empezar por !JAVA(0), salvo que sea el propio número
    !JAVA(0).

  - **Hexadecimal:** debe empezar por !JAVA(0x) o !JAVA(0X).

  - **Octal:** debe empezar por !JAVA(0).

  - **Binario:** debe empezar por !JAVA(0b) o !JAVA(0B).

---

- Ejemplos de literales de tipo !JAVA(int):

  :::: columns

  ::: {.column width=40%}

  !JAVA(0)

  !JAVA(2)

  !JAVA(0372)

  :::

  ::: {.column width=20%}

  :::

  ::: {.column width=40%}

  !JAVA(0xDada_Cafe)

  !JAVA(1996)

  !JAVA(0x00_FF__00_FF)

  :::

  ::::

- Ejemplos de literales de tipo !JAVA(long):

  :::: columns

  ::: {.column width=40%}

  !JAVA(0l)

  !JAVA(0777L)

  !JAVA(0x100000000L)

  :::

  ::: {.column width=20%}

  :::

  ::: {.column width=40%}

  !JAVA(2_147_483_648L)

  !JAVA(0xC0B0L)

  :::

  ::::

---

- Un literal de tipo `char` representa un carácter o secuencia de escape.

- Se escriben encerrados entre comillas simples (también llamadas _apóstrofes_).

- Los literales de tipo `char` sólo pueden representar _code units_ de Unicode
  y, por tanto, sus valores deben estar comprendidos entre !JAVA('\u0000') y
  !JAVA('\uffff').

- Ejemplos de literales de tipo `char`:

  :::: columns

  ::: column

  !JAVA('a')

  !JAVA('%')

  !JAVA('\t')

  !JAVA('\\')

  !JAVA('\'')

  :::

  ::: column

  !JAVA('\u03a9')

  !JAVA('\uFFFF')

  !JAVA('\177')

  !JAVA('™')

  :::

  ::::

!CAJACENTRADA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
En Java, los **caracteres** y las **cadenas** son **tipos distintos**.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Operadores integrales

- Java proporciona una serie de operadores que actúan sobre valores integrales.

- Los **operadores de comparación** dan como resultado un valor de tipo
  !JAVA(boolean):

  --------------------------- -----------------------------------------------------
  Comparación numérica:       !JAVA(<), !JAVA(<=), !JAVA(>), !JAVA(>=)            
  Igualdad numérica:          !JAVA(==), !JAVA(!=)                                
  --------------------------- -----------------------------------------------------

  ```java
  jshell> 2 <= 3
  $1 ==> true

  jshell> 4 != 4
  $2 ==> false
  ```

---

- Los **operadores numéricos** dan como resultado un valor de tipo !JAVA(int) o !JAVA(long):

  ------------------------------------ -----------------------------------------------------
  Signo más y menos (unarios):         !JAVA(+), !JAVA(-)
  Multiplicativos:                     !JAVA(*), !JAVA(/), \ !JAVA(%) <!-- \* -->
  Suma y resta:                        !JAVA(+), !JAVA(-)
  Preincremento y postincremento:      !JAVA(++)
  Predecremento y postdecremento:      !JAVA(--)
  Desplazamiento con y sin signo:      !JAVA(<<), !JAVA(>>), !JAVA(>>>)
  Complemento a nivel de bits:         !JAVA(~)
  _And_, _or_ y _xor_ a nivel de bits: !JAVA(&), !JAVA(|), !JAVA(^)
  Ternario condicional:                !JAVA(? :)
  ------------------------------------ -----------------------------------------------------

---

- Si un operador integral (que no sea el desplazamiento) tiene al menos un
  operando de tipo !JAVA(long), la operación se llevará a cabo en precisión de
  64 bits y el resultado de la operación numérica será de tipo !JAVA(long).

  Si el otro operando no es !JAVA(long), se convertirá primero a !JAVA(long).

- En caso contrario, la operación se llevará a cabo usando precisión de 32
  bits, y el resultado de la operación numérica será de tipo !JAVA(int).

  Si alguno de los operandos no es !JAVA{int} (por ejemplo, !JAVA(short) o
  !JAVA(byte)), se convertirá primero a !JAVA(int).

---

```java
```

### De coma flotante

- Los **tipos de coma flotante** son valores que representan **números reales**
  almacenados en el formato de coma flotante **IEEE-754**.

- Existen dos tipos de coma flotante:

  - **!JAVA(float):** sus valores son números de coma flotante de 32 bits
    (simple precisión).

  - **!JAVA(double):** sus valores son números de coma flotante de 64 bits
    (doble precisión).

- Un literal de coma flotante tiene las siguientes partes en este orden (que
  algunas son opcionales según el caso):

  #. Una parte entera.

  #. Un punto (`.`).

  #. Una parte fraccionaria.

  #. Un exponente.

  #. Un sufijo de tipo.

---

- Los literales de coma flotante se pueden expresar en decimal o hexadecimal
  (usando el prefijo !JAVA(0x) o !JAVA(0X)).

- Todas las partes numéricas del literal (la entera, la fraccionaria y el
  exponente) deben ser decimales o hexadecimales, sin mezclar algunas de un
  tipo y otras de otro.

- Se permiten caracteres de subrayado (`_`) para separar los dígitos de la
  parte entera, la parte fraccionaria o el exponente.

- El exponente, si aparece, se indica mediante el carácter `e` o `E` (si el
  número es decimal) o el carácter `p` o `P` (si es hexadecimal), seguido por
  un número entero con signo.

- Un literal de coma flotante será de tipo !JAVA(float) si lleva un sufijo `f`
  o `F`; si no lleva ningún sufijo (o si lleva opcionalmente el sufijo `d` o
  `D`), será de tipo !JAVA(double).

---

- El literal positivo finito de tipo `float` más grande es `3.4028235e38f`.

- El literal positivo finito de tipo `float` más pequeño distinto de cero es
  `1.40e-45f`.

- El literal positivo finito de tipo `double` más grande es
  `1.7976931348623157e308`.

- El literal positivo finito de tipo `double` más pequeño distinto de cero es
  `4.9e-324`.

---

- Ejemplos de literales de tipo `float`:

  :::: columns

  ::: {.column width=40%}

    !JAVA(1e1f)

    !JAVA(2.f)

    !JAVA(.3f)

  :::

  ::: {.column width=20%}

  :::

  ::: {.column width=40%}

    !JAVA(0f)

    !JAVA(3.14f)

    !JAVA(6.022137e+23f)

  :::

  ::::

- Ejemplos de literales de tipo `double`:

  :::: columns

  ::: {.column width=40%}

  !JAVA(1e1)

  !JAVA(2.)

  !JAVA(.3)

  !JAVA(0.0)

  :::

  ::: {.column width=20%}

  :::

  ::: {.column width=40%}

  !JAVA(3.14)

  !JAVA(1e-9d)

  !JAVA(1e137)

  :::

  ::::

---

- El estándar IEEE-754 incluye números positivos y negativos formados por un
  signo y una magnitud.

- También incluye:

  - Ceros positivo y negativos:

    !JAVA(+0)

    !JAVA(-0)

  - Infinitos positivos y negativos:

    :::: columns

    ::: column

    !JAVA(Float.POSITIVE_INFINITY)

    !JAVA(Float.NEGATIVE_INFINITY)

    :::

    ::: column

    !JAVA(Double.POSITIVE_INFINITY)

    !JAVA(Double.NEGATIVE_INFINITY)

    :::

    ::::

  - Valores especiales _Not-a-Number_ (o _NaN_), usados para representar
    ciertas operaciones no válidas como dividir entre cero:

    :::: columns

    ::: column

    !JAVA(Float.NaN)

    :::

    ::: column

    !JAVA(Double.NaN)

    :::

    ::::

### Subtipado

#### Subtipado entre tipos primitivos

### Conversiones entre datos primitivos

#### *Casting*

#### De ampliación (*widening*)

#### De restricción (*narrowing*)

### Promociones numéricas

## Tipos por referencia

### Nulo

- Existe un tipo especial llamado **tipo _nulo_**.

- El tipo nulo es el tipo de la expresión !JAVA(null), la cual representa la
  **referencia nula**.

- La referencia nula es el único valor posible de una expresión de tipo nulo.

- El tipo nulo no tiene nombre y, por tanto, no se puede declarar una variable
  de tipo nulo o convertir un valor al tipo nulo.

- La referencia nula siempre puede asignarse o convertirse a cualquier tipo
  referencia.

- En la práctica, el programador puede ignorar el tipo nulo y suponer que
  !JAVA(null) es simplemente un literal especial que pertenece a cualquier tipo
  referencia.

# Variables en Java

## Variables de tipos primitivos

## Variables de tipos por referencia

## Declaraciones de variables

# Estructuras de control

## Bloques

## `if`

## `switch`

## `while`

## `for`

## `do ... while`

# Entrada/salida

## Flujos `System.in`, `System.out` y `System.err`

## `java.util.Scanner`

