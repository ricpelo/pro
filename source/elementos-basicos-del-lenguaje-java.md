---
title: Elementos básicos del lenguaje Java
author: Ricardo Pérez López
!DATE
---

# Tipos y valores en Java

## Introducción

- El lenguaje de programación Java es un **lenguaje de tipado estático**, lo
  que significa que cada variable y cada expresión tienen un tipo que se conoce
  en tiempo de compilación.

- El lenguaje de programación Java también es un **lenguaje fuertemente
  tipado**, porque los tipos limitan las operaciones que se pueden realizar
  sobre unos valores dependiendo de sus tipos y determinan el significado de
  dichas operaciones.

- El tipado estático fuerte ayuda a **detectar errores en tiempo de
  compilación**, es decir, antes incluso de ejecutar el programa.

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

   - Tipos **clase**.

   - Tipos **interfaz**.

   - Tipos **_array_**.

- Además, hay un tipo especial que representa el valor **nulo** (!JAVA(null)).

---

- En Java, un objeto sólo puede ser una de estas dos cosas:

  - Una instancia creada en tiempo de ejecución a partir de una clase.

  - Un _array_ creado en tiempo de ejecución.

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
  por tanto, **las variables que contienen valores primitivos** no guardan una
  referencia al valor, sino que **almacenan el valor mismo**.

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

jshell> true ^ true
$3 ==> false
```

:::

::: column

```java
jshell> !true
$4 ==> false

jshell> true ? 1 : 2
$5 ==> 1

jshell> false ? 1 : 2
$6 ==> 2
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

- Los **operadores numéricos** dan como resultado un valor de tipo !JAVA(int) o
  !JAVA(long):

  ------------------------------------ -----------------------------------------------------
  Signo más y menos (unarios):         !JAVA(+), !JAVA(-)
  Multiplicativos:                     !JAVA(*), !JAVA(/), \ !JAVA(%) <!-- \* -->
  Suma y resta:                        !JAVA(+), !JAVA(-)
  Preincremento y postincremento:      !JAVA(++)
  Predecremento y postdecremento:      !JAVA(--)
  Desplazamiento con y sin signo:      !JAVA(<<), !JAVA(>>), !JAVA(>>>)
  Complemento a nivel de bits:         !JAVA(~)
  _And_, _or_ y _xor_ a nivel de bits: !JAVA(&), !JAVA(|), !JAVA(^)
  ------------------------------------ -----------------------------------------------------

---

- Si un operador integral (que no sea el desplazamiento) tiene al menos un
  operando de tipo !JAVA(long), la operación se llevará a cabo en precisión de
  64 bits y el resultado de la operación numérica será de tipo !JAVA(long).

  Si el otro operando no es !JAVA(long), se convertirá primero a !JAVA(long).

- En caso contrario, la operación se llevará a cabo usando precisión de 32
  bits y el resultado de la operación numérica será de tipo !JAVA(int).

  Si alguno de los operandos no es !JAVA{int} (por ejemplo, !JAVA(short) o
  !JAVA(byte)), se convertirá primero a !JAVA(int).

- Ciertas operaciones pueden lanzar excepciones. Por ejemplo, el operador de
  división entera (!JAVA(`/`)) y el resto de la división entera (!JAVA(%))
  lanzan una excepción !JAVA(ArithmeticException) si el operando derecho es
  cero.

---

```java
jshell> 2 + 3
$1 ==> 5             // Devuelve un int

jshell> 2 + 3L
$2 ==> 5             // Devuelve un long

jshell> 8 >> 1
$3 ==> 4

jshell> -8 >> 1
$4 ==> -4

jshell> -8 >>> 1
$5 ==> 2147483644

jshell> 2 == 3 ? 5 : 6L
$6 ==> 6
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

#### Operadores de coma flotante

- Los operadores que actúan sobre valores de coma flotante son los siguientes:

- Los **operadores de comparación** dan como resultado un valor de tipo
  !JAVA(boolean):

  --------------------------- -----------------------------------------------------
  Comparación numérica:       !JAVA(<), !JAVA(<=), !JAVA(>), !JAVA(>=)            
  Igualdad numérica:          !JAVA(==), !JAVA(!=)                                
  --------------------------- -----------------------------------------------------

  ```java
  jshell> 2.0 <= 3.0
  $1 ==> true

  jshell> 4.0 != 4.0
  $2 ==> false
  ```

---

- Los **operadores numéricos** dan como resultado un valor de tipo !JAVA(float)
  o !JAVA(double):

  ------------------------------------ -----------------------------------------------------
  Signo más y menos (unarios):         !JAVA(+), !JAVA(-)
  Multiplicativos:                     !JAVA(*), !JAVA(/), \ !JAVA(%) <!-- \* -->
  Suma y resta:                        !JAVA(+), !JAVA(-)
  Preincremento y postincremento:      !JAVA(++)
  Predecremento y postdecremento:      !JAVA(--)
  ------------------------------------ -----------------------------------------------------

---

- Si al menos uno de los operandos de un operador binario es de un número de
  coma flotante, la operación se realizará en coma flotante, aunque el otro
  operando sea un integral.

- Si al menos uno de los operandos de un operador numérico es de tipo
  !JAVA(double), la operación se llevará a cabo en aritmética de coma flotante
  de 64 bits y el resultado de la operación numérica será de tipo
  !JAVA(double).

  Si el otro operando no es !JAVA(double), se convertirá primero a
  !JAVA(double).

- En caso contrario, la operación se llevará a cabo usando aritmética de coma
  flotante 32 bits y el resultado de la operación numérica será de tipo
  !JAVA(float).

  Si el otro operando no es !JAVA(float), se convertirá primero a !JAVA(float).

---

```java
jshell> 4 / 3
$1 ==> 1

jshell> 4 / 3.0
$2 ==> 1.3333333333333333

jshell> 4 / 3.0f
$3 ==> 1.3333334

jshell> 4 / 0.0
$4 ==> Infinity

jshell> 4.0 * Double.NaN
$5 ==> NaN
```

---

- Una operación de coma flotante que produce _overflow_ devuelve un infinito
  con signo.

- Una operación de coma flotante que produce _underflow_ devuelve un valor
  desnormalizado o un cero con signo.

- Una operación de coma flotante que no tiene un resultado matemáticamente
  definido devuelve !JAVA(NaN).

- Cualquier operación numérica que tenga un !JAVA(NaN) como operando devuelve
  !JAVA(NaN) como resultado.

### Subtipado

- Se dice que un tipo $S$ es **supertipo directo** de un tipo $T$ cuando esos
  dos tipos están relacionados según unas reglas que veremos luego. En tal
  caso, se escribe: $$S >_1 T$$ <!-- \_ -->

- Se dice que un tipo $S$ es **supertipo** de un tipo $T$ cuando $S$ se puede
  obtener de $T$ mediante clausura reflexiva y transitiva sobre la relación de
  _supertipo directo_. En tal caso, se escribe: $$S\ \texttt{:>}\ T$$

- $S$ es un **supertipo propio** de $T$ si $S$ `:>` $T$ y $S !NEQ T$. En tal
  caso, se escribe: $$S\ \texttt{>}\ T$$

---

- Los **subtipos** de un tipo $T$ son todos aquellos tipos $S$ tales que $T$ es
  un supertipo de $S$, **más el tipo nulo**. Cuando $S$ es un subtipo de $T$ se
  escribe: $$S\ \texttt{<:}\ T$$

- $S$ es un **subtipo propio** de $T$ si $S$ `<:` $T$ y $S !NEQ T$. En tal
  caso, se escribe: $$S\ \texttt{<}\ T$$

- $S$ es un **subtipo directo** de $T$ si $T >_1 S$. En tal caso, se escribe:
  $$S <_1 T$$

- Las relaciones de **subtipo** y **supertipo** son muy importantes porque:

  - Un valor de un tipo se puede convertir en un valor de un supertipo suyo sin
    perder información (es lo que se denomina **ampliación** o _widening_).

  - En cualquier expresión donde se necesite un valor de un cierto tipo, se
    puede usar un valor de un subtipo suyo.

#### Subtipado entre tipos primitivos

- Las siguientes reglas definen la relación de **subtipo directo** entre los
  tipos primitivos de Java:

  - `float` $<_1$ `double`

  - `long` $<_1$ `float`

  - `int` $<_1$ `long`

  - `char` $<_1$ `int`

  - `short` $<_1$ `int`

  - `byte` $<_1$ `short`

### Conversiones entre datos primitivos

- Es posible convertir valores de un tipo a otro, siempre y cuando se cumplan
  ciertas condiciones y teniendo en cuenta que, en determinadas ocasiones,
  puede haber pérdida de información.

- Por ejemplo, no es posible convertir directamente valores numéricos en
  booleanos o viceversa.

- Pero sí es posible convertir valores numéricos a otro tipo numérico, aunque
  es posible que se pueda perder información, según sea el caso.

- Por ejemplo, convertir un número de coma flotante en un entero supondrá
  siempre la pérdida de la parte fraccionaria del número.

- Igualmente, es posible que haya pérdida de información al convertir un número
  de más bits en otro de menos bits.

#### *Casting*

- El **_casting_** o _moldeado_ de tipos es una operación de conversión entre
  tipos.

- En el caso de tipos primitivos, el _casting_ se usa para:

  - Convertir, en tiempo de ejecución, un valor de un tipo numérico a un valor
    similar de otro tipo numérico.

  - Garantizar, en tiempo de compilación, que el tipo de una expresión es
    !JAVA(boolean).

- El _casting_ se escribe anteponiendo a una expresión, y entre paréntesis, el
  nombre del tipo al que se quiere convertir el valor de esa expresión.

- Por ejemplo, si queremos convertir a !JAVA(short) el valor de la expresión
  !JAVA(4 + 3), hacemos:

  ```java
  (short) (4 + 3)
  ```

- Los paréntesis alrededor de la expresión !JAVA(4 + 3) son necesarios para
  asegurarnos de que el _casting_ afecta a toda la expresión y no sólo al
  !JAVA(4).

#### De ampliación (*widening*!ifdef(HTML)(&nbsp;)())

- Existen 19 conversiones de ampliación o _widening_ sobre tipos primitivos:

  - De `byte` a `short`, `int`, `long`, `float` o `double`.

  - De `short` a `int`, `long`, `float` o `double`.

  - De `char` a `int`, `long`, `float` o `double`.

  - De `int` a `long`, `float` o `double`.

  - De `long` a `float` o `double`.

  - De `float` a `double`.

---

- Una conversión primitiva de ampliación nunca pierde información sobre la
  magnitud general de un valor numérico.

- Una conversión primitiva de ampliación de un tipo integral a otro tipo
  integral no pierde ninguna información en absoluto; el valor numérico se
  conserva exactamente.

- En determinados casos, una conversión primitiva de ampliación de `float` a
  `double` puede perder información sobre la magnitud general del valor
  convertido.

- Una conversión de ampliación de un valor `int` o `long` a `float`, o de un
  valor `long` a `double`, puede producir pérdida de precisión; es decir, el
  resultado puede perder algunos de los bits menos significativos del valor. En
  este caso, el valor de coma flotante resultante será una versión
  correctamente redondeada del valor entero.

---

- Una conversión de ampliación de un valor entero con signo a un tipo integral
  simplemente extiende el signo de la representación del complemento a dos del
  valor entero para llenar el formato más amplio.

- Una conversión de ampliación de `char` a un tipo integral rellena con ceros
  la representación del valor `char` para llenar el formato más amplio.

- A pesar de que puede producirse una pérdida de precisión, una conversión
  primitiva de ampliación nunca da como resultado una excepción en tiempo de
  ejecución.

#### De restricción (*narrowing*!ifdef(HTML)(&nbsp;)())

- Existen 22 conversiones de restricción o _narrowing_ sobre tipos primitivos:

  - De `short` a `byte` o `char`

  - De `char` a `byte` o `short`

  - De `int` a `byte`, `short` o `char`

  - De `long` a `byte`, `short`, `char` o `int`

  - De `float` a `byte`, `short`, `char`, `int` o `long`

  - De `double` a `byte`, `short`, `char`, `int`, `long` o `float`

---

- Una conversión primitiva de restricción puede perder información sobre la
  magnitud general de un valor numérico y además también puede perder precisión
  y rango.

- Las conversiones primitivas de restricción de `double` a `float` se llevan a
  cabo mediante las reglas de redondeo del IEEE-754. Esta conversión puede
  perder precisión y también rango, por lo que puede resultar un `float` cero a
  partir de un `double` que no es cero, y un `float` infinito a partir de un
  `double` finito. Los !JAVA(NaN) se convierten en !JAVA(NaN) y los infinitos
  en infinitos.

- Una conversión de restricción de un entero con signo a un integral $T$
  simplemente descarta todos los bits excepto los $n$ menos significativos,
  siendo $n$ el número de bits usados para representar un valor de tipo $T$.
  Por tanto, además de poder perder información sobre la magnitud del valor
  numérico, también puede cambiar el signo del valor original.

- Una conversión de restricción de un `char` a un integral $T$ se comporta
  igual que en el caso anterior.

---

- Las conversiones de restricción de un número en coma flotante a un integral
  $T$ se realizan en dos pasos:

  1. El número en coma flotante se convierte a `long` (si $T$ es `long`) o a
     `int` (si $T$ es `byte`, `short`, `char` o `int`). Para ello:

     - Si el número flotante es !JAVA(NaN), el resultado del primer paso de la
       conversión es !JAVA(0).

     - Si el número flotante no es infinito, el valor se redondea a entero
       truncando a cero la parte fraccionaria.

       - Si $T$ es `long` y ese entero cabe en un `long`, el resultado es
         `long`.

       - Si cabe en un `int`, el resultado es `int`.

       - Si es demasiado pequeño (o grande), el resultado es el valor
         más pequeño (o grande) que se pueda representar con `int` o
         `long`.

  2. Si $T$ es `int` o `long`, el resultado final será el del primer paso.

     Si $T$ es `byte`, `char` o `short`, el resultado final será el resultado
     de convertir al tipo $T$ el valor del primer paso.

---

- Al convertir un valor de `byte` a `char`, se produce una doble conversión:

  1. Primero, una conversión de ampliación de `byte` a `int`.

  2. Después, una conversión de restricción de `int` a `char`.

### Promociones numéricas

- Es posible que se apliquen **promociones numéricas unarias** o **binarias** a los operandos de un operador aritmético.

- **Promociones numéricas unarias:**

  - Se llevan a cabo sobre expresiones en las siguientes situaciones:

    - El índice de un _array_.

    - El operando de un `+` o `-` unario.

    - El operando de un operador de complemento de bits `~`.

    - Cada operando, por separado, de los operadores `>>`, `>>>` y `<<`.

  - En tales casos, se lleva a cabo una promoción numérica que consiste en lo siguiente:

    - Si tipo del operando es `byte`, `short`, o `char`, su valor se promociona a `int` mediante una conversión primitiva de ampliación.

---

- **Promociones numéricas binarias:**

  - Se llevan a cabo sobre los operandos de ciertos operadores:

    - Los operadores `*`, `/` y `%`.

    - Los operadores de suma y resta de tipos numéricos `+` y `-`.

    - Los operadores de comparación numérica `<`, `<=`, `>` y `>=`.

    - Los operadores de igualdad numérica `==` y `!=`.

    - Los operadores enteros a nivel de bits `&`, `^` y `|`.

    - En determinadas situaciones, el operador condicional `? :`.

  - En tales casos, se lleva a cabo una promoción numérica que consiste en lo
    siguiente, en función del tipo de los operandos del operador:

    1. Si algún operando es `double`, el otro se convierte a `double`.

    2. Si no, si alguno es `float`, el otro se convierte a `float`.

    3. Si no, si alguno es `long`, el otro se convierte a `long`.

    4. Si no, ambos operandos se convierten a `int`.

## Tipos referencia

 - Los **tipos referencia** son:

   - Tipos **clase**.

   - Tipos **interfaz**.

   - Tipos **_array_**.

- Un tipo clase o interfaz consiste en un identificador (o una secuencia de
  identificadores separados por `.`)

- Cada identificador de un tipo clase o interfaz puede ser el nombre de un
  paquete o el nombre de un tipo.

- Opcionalmente puede llevar _argumentos de tipo_. Si un argumento de tipo
  aparece en alguna parte de un tipo clase o interfaz, se denomina _tipo
  parametrizado_.

---

- Un objeto es una instancia de una clase o un _array_.

- Las referencias son punteros a esos objetos.

- Existe una referencia especial llamada _referencia nula_ (o `null`) que no
  apunta a ningún objeto.

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

