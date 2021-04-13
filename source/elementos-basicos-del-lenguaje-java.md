---
title: Elementos básicos del lenguaje Java
author: Ricardo Pérez López
!DATE
nocite: |
  @gosling_java_2014
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
  !JAVA(Object).

- Las cadenas literales representan objetos de la clase !JAVA(String).

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
  Igualdad:                        `==`, `!=`
  Complemento lógico (_not_):      `!`
  _And_, _or_ y _xor_ estrictos:   `&`, `|`, `^`
  _And_ y _or_ perezosos:          `&&`, `||`
  Condicional ternario:            `? :`
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
                  
  !JAVA(short)     16 bits  !JAVA(-32768) a !JAVA(32767) inclusive
                  
  !JAVA(int)       32 bits  !JAVA(-2147483648) a !JAVA(2147483647) inclusive
                  
  !JAVA(long)      64 bits  !JAVA(-9223372036854775808) a !JAVA(9223372036854775807) inclusive
                  
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

- Un literal de tipo !JAVA(char) representa un carácter o secuencia de escape.

- Se escriben encerrados entre comillas simples, también llamadas _apóstrofes_
  (`'`).

- Los literales de tipo !JAVA(char) sólo pueden representar _code units_ de
  Unicode y, por tanto, sus valores deben estar comprendidos entre
  !JAVA('\u0000') y !JAVA('\uffff').

- Ejemplos de literales de tipo !JAVA(char):

  :::: columns

  ::: column

  !JAVA('a')

  !JAVA('%')

  !JAVA('\t')

  !JAVA('\\')

  :::

  ::: column

  !JAVA('\'')

  !JAVA('\u03a9')

  !JAVA('\uFFFF')

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
  Comparación numérica:       `<`, `<=`, `>`, `>=`            
  Igualdad numérica:          `==`, `!=`                                
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
  Signo más y menos (unarios):         `+`, `-`
  Multiplicativos:                     `*`, `/`, \ `%`
  Suma y resta:                        `+`, `-`
  Preincremento y postincremento:      `++`
  Predecremento y postdecremento:      `--`
  Desplazamiento con y sin signo:      `<<`, `>>`, `>>>`
  Complemento a nivel de bits:         `~`
  _And_, _or_ y _xor_ a nivel de bits: `&`, `|`, `^`
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
  división entera (`/`) y el resto de la división entera (`%`) lanzan una
  excepción !JAVA(ArithmeticException) si el operando derecho es cero.

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

- El literal positivo finito de tipo !JAVA(float) más grande es
  !JAVA(3.4028235e38f).

- El literal positivo finito de tipo !JAVA(float) más pequeño distinto de cero
  es !JAVA(1.40e-45f).

- El literal positivo finito de tipo !JAVA(double) más grande es
  !JAVA(1.7976931348623157e308).

- El literal positivo finito de tipo !JAVA(double) más pequeño distinto de
  cero es !JAVA(4.9e-324).

---

- Ejemplos de literales de tipo !JAVA(float):

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

- Ejemplos de literales de tipo !JAVA(double):

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
  Comparación numérica:       `<`, `<=`, `>`, `>=`            
  Igualdad numérica:          `==`, `!=`                                
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
  Signo más y menos (unarios):         `+`, `-`
  Multiplicativos:                     `*`, `/`, \ `%`
  Suma y resta:                        `+`, `-`
  Preincremento y postincremento:      `++`
  Predecremento y postdecremento:      `--`
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

  - !JAVA(float) $<_1$ !JAVA(double)

  - !JAVA(long) $<_1$ !JAVA(float)

  - !JAVA(int) $<_1$ !JAVA(long)

  - !JAVA(char) $<_1$ !JAVA(int)

  - !JAVA(short) $<_1$ !JAVA(int)

  - !JAVA(byte) $<_1$ !JAVA(short)

---

- Sabiendo qué tipos son subtipos directos de otros (relación $<_1$), podemos
  determinar qué tipos son subtipos de otros (relación `<:`), usando estas dos
  propiedades:

  - Todo tipo es subtipo de sí mismo (propiedad reflexiva).

  - Si $T_1\ \texttt{<:} T_2$\  y\  $T_2\ \texttt{<:} T_3$, entonces
    $T_1\ \texttt{<:} T_3$ (propiedad transitiva).

- Por ejemplo, sabiendo que !JAVA(byte) $<_1$ !JAVA(short) y que !JAVA(short)
  $<_1$ !JAVA(int), podemos deducir que:

  - !JAVA(byte) `<:` !JAVA(byte)

  - !JAVA(short) `<:` !JAVA(short)

  - !JAVA(int) `<:` !JAVA(int)

  - !JAVA(byte) `<:` !JAVA(short)

  - !JAVA(short) `<:` !JAVA(int)

  - !JAVA(byte) `<:` !JAVA(int)

#### Subtipado entre tipos referencia

- El subtipado entre tipos referencia resulta bastante más complicado que el de
  los tipos primitivos, pero básicamente se fundamenta en el _principio de
  sustitución de Liskov_.

- Hay muchas reglas de subtipado entre tipos referencia, pero la más importante
  y básica es la siguiente:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Dado un tipo referencia $C$, el **supertipo directo** de $C$ es la superclase
  directa de $C$.

  Dicho de otra forma: $C <_1 S$, siendo $S$ la superclase directa de $C$. <!-- \_ -->
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Esta regla se ampliará en su momento cuando estudiemos las interfaces y la
  programación genérica.

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

  - De !JAVA(byte) a !JAVA(short), !JAVA(int), !JAVA(long), !JAVA(float) o
    !JAVA(double).

  - De !JAVA(short) a !JAVA(int), !JAVA(long), !JAVA(float) o !JAVA(double).

  - De !JAVA(char) a !JAVA(int), !JAVA(long), !JAVA(float) o !JAVA(double).

  - De !JAVA(int) a !JAVA(long), !JAVA(float) o !JAVA(double).

  - De !JAVA(long) a !JAVA(float) o !JAVA(double).

  - De !JAVA(float) a !JAVA(double).

---

- Una conversión primitiva de ampliación nunca pierde información sobre la
  magnitud general de un valor numérico.

- Una conversión primitiva de ampliación de un tipo integral a otro tipo
  integral no pierde ninguna información en absoluto; el valor numérico se
  conserva exactamente.

- En determinados casos, una conversión primitiva de ampliación de !JAVA(float)
  a !JAVA(double) puede perder información sobre la magnitud general del valor
  convertido.

- Una conversión de ampliación de un valor !JAVA(int) o !JAVA(long) a
  !JAVA(float), o de un valor !JAVA(long) a !JAVA(double), puede producir
  pérdida de precisión; es decir, el resultado puede perder algunos de los bits
  menos significativos del valor. En este caso, el valor de coma flotante
  resultante será una versión correctamente redondeada del valor entero.

---

- Una conversión de ampliación de un valor entero con signo a un tipo integral
  simplemente extiende el signo de la representación del complemento a dos del
  valor entero para llenar el formato más amplio.

- Una conversión de ampliación de !JAVA(char) a un tipo integral rellena con
  ceros la representación del valor !JAVA(char) para llenar el formato más
  amplio.

- A pesar de que puede producirse una pérdida de precisión, una conversión
  primitiva de ampliación nunca da como resultado una excepción en tiempo de
  ejecución.

#### De restricción (*narrowing*!ifdef(HTML)(&nbsp;)())

- Existen 22 conversiones de restricción o _narrowing_ sobre tipos primitivos:

  - De !JAVA(short) a !JAVA(byte) o !JAVA(char).

  - De !JAVA(char) a !JAVA(byte) o !JAVA(short).

  - De !JAVA(int) a !JAVA(byte), !JAVA(short) o !JAVA(char).

  - De !JAVA(long) a !JAVA(byte), !JAVA(short), !JAVA(char) o !JAVA(int).

  - De !JAVA(float) a !JAVA(byte), !JAVA(short), !JAVA(char), !JAVA(int) o
    !JAVA(long).

  - De !JAVA(double) a !JAVA(byte), !JAVA(short), !JAVA(char), !JAVA(int),
    !JAVA(long) o !JAVA(float).

---

- Una conversión primitiva de restricción puede perder información sobre la
  magnitud general de un valor numérico y además también puede perder precisión
  y rango.

- Las conversiones primitivas de restricción de !JAVA(double) a !JAVA(float) se
  llevan a cabo mediante las reglas de redondeo del IEEE-754. Esta conversión
  puede perder precisión y también rango, por lo que puede resultar un
  !JAVA(float) cero a partir de un !JAVA(double) que no es cero, y un
  !JAVA(float) infinito a partir de un !JAVA(double) finito. Los !JAVA(NaN) se
  convierten en !JAVA(NaN) y los infinitos en infinitos.

- Una conversión de restricción de un entero con signo a un integral $T$
  simplemente descarta todos los bits excepto los $n$ menos significativos,
  siendo $n$ el número de bits usados para representar un valor de tipo $T$.
  Por tanto, además de poder perder información sobre la magnitud del valor
  numérico, también puede cambiar el signo del valor original.

- Una conversión de restricción de un !JAVA(char) a un integral $T$ se comporta
  igual que en el caso anterior.

---

- Las conversiones de restricción de un número en coma flotante a un integral
  $T$ se realizan en dos pasos:

  1. El número en coma flotante se convierte a !JAVA(long) (si $T$ es
     !JAVA(long)) o a !JAVA(int) (si $T$ es !JAVA(byte), !JAVA(short),
     !JAVA(char) o !JAVA(int)). Para ello:

     - Si el número flotante es !JAVA(NaN), el resultado del primer paso de la
       conversión es !JAVA(0).

     - Si el número flotante no es infinito, el valor se redondea a entero
       truncando a cero la parte fraccionaria.

       - Si $T$ es !JAVA(long) y ese entero cabe en un !JAVA(long), el
         resultado es !JAVA(long).

       - Si cabe en un !JAVA(int), el resultado es !JAVA(int).

       - Si es demasiado pequeño (o grande), el resultado es el valor
         más pequeño (o grande) que se pueda representar con !JAVA(int) o
         !JAVA(long).

  2. Si $T$ es !JAVA(int) o !JAVA(long), el resultado final será el del primer
     paso.

     Si $T$ es !JAVA(byte), !JAVA(char) o !JAVA(short), el resultado final será
     el resultado de convertir al tipo $T$ el valor del primer paso.

---

- Al convertir un valor de !JAVA(byte) a !JAVA(char), se produce una doble
  conversión:

  1. Primero, una conversión de ampliación de !JAVA(byte) a !JAVA(int).

  2. Después, una conversión de restricción de !JAVA(int) a !JAVA(char).

### Promociones numéricas

- Las **promociones numéricas** son _conversiones implícitas_ que el compilador
  realiza automáticamente al realizar ciertas operaciones.

- **Promociones numéricas unarias:**

  - Se llevan a cabo sobre expresiones en las siguientes situaciones:

    - El índice de un _array_.

    - El operando de un `+` o `-` unario.

    - El operando de un operador de complemento de bits `~`.

    - Cada operando, por separado, de los operadores `>>`, `>>>` y `<<`.

  - En tales casos, se lleva a cabo una promoción numérica que consiste en lo
    siguiente:

    - Si tipo del operando es !JAVA(byte), !JAVA(short), o !JAVA(char), su
      valor se promociona a !JAVA(int) mediante una conversión primitiva de
      ampliación.

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

    1. Si algún operando es !JAVA(double), el otro se convierte a
       !JAVA(double).

    2. Si no, si alguno es !JAVA(float), el otro se convierte a !JAVA(float).

    3. Si no, si alguno es !JAVA(long), el otro se convierte a !JAVA(long).

    4. Si no, ambos operandos se convierten a !JAVA(int).

## Tipos referencia

 - Los **tipos referencia** son:

   - Tipos **clase**.

   - Tipos **interfaz**.

   - Tipos **_array_**.

- Un tipo clase o interfaz consiste en un identificador, o una secuencia de
  identificadores separados por puntos (`.`).

- Cada identificador de un tipo clase o interfaz puede ser el nombre de un
  paquete o el nombre de un tipo.

- Opcionalmente puede llevar _argumentos de tipo_. Si un argumento de tipo
  aparece en alguna parte de un tipo clase o interfaz, se denomina _tipo
  parametrizado_.

- Los tipos parametrizados se verán con detalle cuando estudiemos la
  **programación genérica**.

---

- Un objeto es una instancia de una clase o un _array_.

- Las referencias son punteros a esos objetos.

- Existe una referencia especial llamada _referencia nula_ (o !JAVA(null)) que
  no apunta a ningún objeto.

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

### Acceso a miembros

- Si tenemos una referencia a un objeto, podemos acceder a cualquiera de sus
  miembros (campos o métodos) usando el operador punto (`.`), como es habitual.

  Por ejemplo, para saber la longitud de una cadena, podemos invocar al método
  `length` sobre el objeto cadena:

  ```java
  jshell> "hola".length()
  $1 ==> 4
  ```

- Lo mismo sirve para acceder a los miembros estáticos de una clase:

  ```java
  jshell> String.valueOf(25)
  $1 ==> "25"
  ```

#### Llamadas a métodos sobrecargados

- En Java los métodos pueden estar _sobrecargados_.

- Un **método sobrecargado** es aquel que tiene varias implementaciones.

- Todas esas implementaciones tienen el mismo nombre pero se diferencian en la
  cantidad y tipo de sus parámetros.

- Al llamar a un método sobrecargado, la implementación seleccionada dependerá
  de los argumentos indicados en la llamada.

---

- Por ejemplo, el método estático !JAVA(valueOf) de la clase !JAVA(String) está
  sobrecargado porque dispone de varias implementaciones dependiendo de los
  argumentos que recibe:

  -------------------------------------------------------------------
  !JAVA(static String valueOf(boolean b))

  !JAVA(static String valueOf(char c))

  !JAVA(static String valueOf(char[] data))

  !JAVA(static String valueOf(char[] data, int offset, int count))

  !JAVA(static String valueOf(double d))

  !JAVA(static String valueOf(float f))

  !JAVA(static String valueOf(int i))

  !JAVA(static String valueOf(long l))

  !JAVA(static String valueOf(Object obj))
  -------------------------------------------------------------------

- Más información en la [API de
  Java](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/String.html#valueOf(boolean)).

# Variables en Java

## Introducción

- Una **variable** es un lugar donde se almacena un valor.

- Cada variable tiene un **tipo** asociado, denominado **tipo en _tiempo de
  compilación_** o **tipo estático**.

- Ese tipo puede ser un **tipo primitivo** o un **tipo referencia**.

- Las variables se deben **declarar** antes de usarlas, y en la declaración se
  indica su tipo.

- El valor de una variable se puede cambiar mediante **asignación** o usando
  los operadores de pre y post incremento (`++`) o decremento (`--`).

- El diseño del lenguaje Java garantiza que el valor de una variable es
  compatible con el tipo de la variable.

## Variables de tipos primitivos

- Una variable de un tipo primitivo siempre contiene un valor primitivo de
  exactamente ese tipo primitivo.

- Las variables de tipos primitivos contienen al valor primitivo, es decir, que
  almacenan ellas mismas el valor primitivo.

- Por tanto, los valores primitivos no se almacenan en el montículo, sino
  directamente en la propia variable.

## Variables de tipos referencia

- Una variable de un tipo referencia $T$ puede contener:

  - La referencia nula (!JAVA(null)).

  - Una referencia a una instancia de $S$, siendo $S$ un subtipo de $T$.

- Una variable de un tipo «_array_ de $T$», puede contener:

  - Si $T$ es un tipo primitivo:

    - La referencia nula (!JAVA(null)).

    - Una referencia a un _array_ de tipo «_array_ de $T$».

  - Si $T$ es un tipo referencia:

    - La referencia nula (!JAVA(null)).

    - Una referencia a un _array_ de tipo «_array_ de $S$», siendo $S$ un
      subtipo de $T$.

### Tipo estático y tipo dinámico

- Eso significa que el tipo referencia que se usó al declarar una variable
  puede no coincidir exactamente con el tipo del objeto al que apunta.

- Por eso, en Java distinguimos dos tipos:

  - **Tipo estático:** el tipo que se usó para declarar la variable; nunca
    cambia durante la ejecución del programa.

  - **Tipo dinámico:** el tipo del valor al que actualmente hace referencia la
    variable; puede cambiar durante la ejecución del programa según la
    referencia que contenga la variable en un momento dado.

  En los tipos primitivos no ocurre eso, ya que una variable de un tipo
  primitivo siempre contendrá un valor de ese tipo exactamente.

- Por ejemplo, en Java, !JAVA(Object) es supertipo de cualquier tipo
  referencia.

- Por tanto, una variable declarada de tipo !JAVA(Object) puede contener una
  referencia a cualquier valor referencia de cualquier tipo referencia.

## Declaración de variables

- La forma más común de declarar variables es mediante la **sentencia de
  declaración de variables**.

- La **sentencia de declaración de variables** es una sentencia mediante la
  cual anunciamos al compilador la existencia de unas determinadas variables e
  indicamos el tipo que van a tener esas variables.

- La sintaxis de la declaración de variables es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(decl_vars) ::= !NT(tipo) !T{identificador} (!T(,) !T{identificador})\* !T(;)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Todas las variables que aparecen en la declaración tendrán el mismo tipo (el
  tipo indicado en la declaración).

- El tipo que se indica en la declaración es el **tipo estático** de la
  variable, el cual podrá o no coincidir con el _tipo dinámico_ del valor que
  contenga la variable, según sea el caso.

---

- Por ejemplo:

  ```java
  int x, y;  // Declara las variables «x» e «y» de tipo «int»
  float z;   // Declara la variable «z» de tipo «float»
  ```

- En Java, los identificadores son sensibles a mayúsculas y minúsuculas. Por
  tanto, la variable `x` no es la misma que `X`.

- La declaración de una variable siempre debe aparecer antes de su uso.

- La variable empieza a existir en el momento en el que se declara.

- Se almacena en el marco del ámbito actual, donde también se crea la ligadura
  entre el identificador y la propia variable.

- El ámbito de la variable es el bloque (porción de código encerrado entre `{`
  y `}`) dentro del cual se ha declarado la variable, ya que cada bloque
  introduce un nuevo ámbito.

- Como los bloques se pueden anidar unos dentro de otros, sus ámbitos
  correspondientes también estarán anidados.

---

```java
public static void main(String[] args) {
    int x;
    System.out.println("Bloque externo");
    {
        int y;
        System.out.println("Bloque interno");
    }
}
```

- El ámbito de `x` es el bloque más externo (el que define el cuerpo del método
  `main`).

- El ámbito de `y` es el bloque más interno.

- Por tanto, `x` se puede usar dentro del bloque más interno, pero `y` no se
  puede usar fuera del bloque más interno.

```java
public static void main(String[] args) {  // Empieza el cuerpo del método
    int x;
    System.out.println("Bloque externo");
    {                // Empieza el bloque más interno
        int y;
        System.out.println("Bloque interno");
    }                // Termina el bloque más interno
}                                         // Termina el cuerpo del método

```

---

- Las variables declaradas dentro de un método son **locales al método**,
  independientemente del nivel de anidamiento del bloque donde se haya
  declarado la variable.

  Por tanto, tanto `x` como `y` son **variables locales al método `main`**.

- Los **parámetros** de un método también se consideran variables locales al
  método.

- Una vez recién creadas, las variables locales a un método no tienen un valor
  inicial.

- Por tanto, cuando se declara una variable local, ésta permanece sin ningún
  valor hasta que se le asigna uno.

- Una variable sin valor se denomina **variable _no inicializada_**.

- Si se intenta usar una variable local no inicializada, provoca un error:

  ```java
  public static void main(String[] args) {
      int x;    // La variable «x» es local al método «main»
      System.out.println(x);  // Da error porque «x» no está inicializada
  }
  ```

---

- En los lenguajes interpretados normalmente ocurre que, al entrar en un nuevo
  ámbito, se crea un nuevo marco en la pila que contendrá las ligaduras y
  variables definidas en ese ámbito.

- En cambio, en los lenguajes compilados de tipado estático (como Java), no
  siempre se cumple eso de que cada ámbito lleva asociado un marco.

- En Java ocurre lo siguiente:

  - En tiempo de ejecución, el hecho de entrar en un nuevo ámbito no provoca la
    creación de un nuevo marco en la pila. Sólo se crean (y se apilan) marcos
    nuevos al llamar a métodos, un marco por llamada.

  - Los ámbitos se usan en tiempo de compilación para comprobar si una variable
    es visible en un determinado punto del programa.

  - Las variables locales a un método siempre se almacenan en el marco del
    método donde se declaran.

- Por eso, el concepto de «ámbito» tiene más que ver con el de «visibilidad»
  (dónde es visible una variable) que con el de «almacenamiento» (dónde se
  almacena la variable).

---

- Recordemos que los _ámbitos_ son un concepto _estático_ (existen en el texto
  del programa aunque no se ejecute) mientras que los _marcos_ son un concepto
  _dinámico_ (se crean y se destruyen durante la ejecución del programa como
  consecuencia de entrar y salir de ciertos ámbitos).

- Por otra parte, **en Java no existen las _variables globales_**.

- Por tanto, las variables en Java sólo pueden ser:

  - **Locales a un método:** se almacenan en el marco del método (en la pila)
    durante la llamada al mismo y su ámbito es el propio método.

  - **De instancia:** se almacenan dentro de su objeto en el montículo.

  - **Estáticas:** se almacenan en una zona especial del montículo llamada
    _PermGen_ (hasta Java 7) o _Metaspace_ (desde Java 8).

### Inicialización y asignación de variables

- Para darle un valor a una variable, podemos:

  - **Inicializar la variable** en el momento de la declaración, de la
    siguiente forma:

    ```java
    int x = 25;  // Declara la variable entera «x» y la inicializa con 25
    ```

  - Asignarle un valor después de haberla declarado, usando la **sentencia de
    asignación**:

    ```java
    int x;       // Declara la variable entera «x»
    x = 25;      // Le asigna el valor 25 a la variable «x»
    ```

- La asignación puede ser **simple** o **compuesta**:

  ```java
  int x;        // Declaración de la variable
  x = 25;       // Asignación simple
  x = x + 5;    // Asignación simple
  x += 5;       // Asignación compuesta, equivalente a la anterior
  ```

---

- Ejemplo:

  ```java
  public static void main(String[] args) {
      int x = 25;
      System.out.println("Bloque externo");
      System.out.println(x);
      {
          int y = 14;
          System.out.println("Bloque interno");
          System.out.println(x);
          System.out.println(y);
          x += 1;
          System.out.println(x);
      }
  }
  ```

---

- También se dispone de los operadores de pre y post incremento y decremento.

- Por ejemplo, supongamos que tenemos:

  ```java
  int x = 5, y = 4;
  ```

:::: columns

::: column

- La sentencia:

  ```java
  y = x++;
  ```

  equivale a:

  ```java
  y = x;
  x += 1;
  ```

:::

::: column

- La sentencia:

  ```java
  y = ++x;
  ```

  equivale a:

  ```java
  x += 1;
  y = x;
  ```

:::

::::

### Inferencia de tipos

- La **inferencia de tipos** es la capacidad que tiene el compilador de Java de
  poder determinar el tipo de una declaración a partir del tipo de la expresión
  usada en la inicialización.

- Esto nos permite ahorrarnos el indicar el tipo del elemento declarado, ya que
  se puede deducir automáticamente en la inicialización.

- Por ejemplo, en la siguiente declaración e inicialización, está claro que `x`
  debe ser de tipo !JAVA(int), ya que su valor inicial es de ese tipo:

  ```java
  int x = 5;
  ```

- En ese caso, en lugar de usar el tipo !JAVA(int), podríamos haber usado la
  palabra clave !JAVA(var), que sirve para declarar la variable sin indicar el
  tipo, forzando al compilador a deducirlo por él mismo:

  ```java
  var x = 5;
  ```

### Constantes

- Las **constantes** en Java se denominan **variables _finales_** y se declaran
  usando el modificador !JAVA(final):

  ```java
  final int x = 4;
  ```

- Una variable final no puede cambiar su valor.

  ```java
  final int x = 4;
  x = 9;                   // Da error
  ```

- Es posible declarar una variable final sin inicializarla, pero debemos
  asignarle un valor antes de poder usarla:

  ```java
  final int x;
  x = 5;                   // No da error porque antes no tenía valor
  System.out.println(x);
  ```

### Declaración de variables de tipo referencia

- Las variables que contienen referencias a objetos se declaran de la misma
  forma.

- Por ejemplo, en Java las cadenas son instancias de la clase !JAVA(String),
  por lo que podemos declarar una variable de tipo !JAVA(String) que podrá
  contener una cadena:

  ```java
  String s;
  ```

- Si no se inicializa en el momento de la declaración, la variable contendrá
  una referencia nula (!JAVA(null)).

- En caso contrario, la variable contendrá una referencia al objeto que es su
  valor inicial:

  ```java
  String s = "hola";
  ```

- Aquí, el tipo estático y el tipo dinámico de `s` coinciden y ambos son
  !JAVA(String).

---

- Recordemos que, por el _principio de sustitución_, una variable puede
  contener un valor referencia cuyo tipo sea un subtipo del tipo de la
  variable.

- Por tanto, si declaramos una variable de tipo !JAVA(Object), podremos guardar
  en ella una referencia a cualquier objeto de cualquier clase:

  ```java
  Object o = "hola";
  ```

- En este caso, el tipo estático de `o` es !JAVA(Object) mientras que el tipo
  dinámico de `o` es !JAVA(String).

- Esto es así porque !JAVA(Object) es supertipo de cualquier tipo referencia.

# Estructuras de control

## Bloques

- Un **bloque** es una secuencia de una o más sentencias encerradas entre
  llaves `{` y `}`.

- Java es un lenguaje **estructurado en bloques**, lo que significa que los
  bloques pueden anidarse unos dentro de otros y cada bloque define un ámbito,
  que iría anidado dentro del ámbito del bloque que lo contiene.

- Los bloques también puede incluir declaraciones, que serán locales al bloque.

- En cualquier parte del programa donde se pueda poner una sentencia, se podrá
  poner un bloque, que actuará como una sentencia compuesta.

- El cuerpo de un método siempre es un bloque.

- Todas las sentencias simples deben acabar en punto y coma (`;`) pero los
  bloques no.

## `if`

- La palabra clave !JAVA(if) introduce una sentencia condicional o estructura
  alternativa (simple o doble).

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia_if) ::= !T(if)\  !T{(}!NT(condición)!T{)}\  !NT(sentencia_si_verdadero) [!T(else) !NT(sentencia_si_falso)]
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- La ejecución de la !NT(sentencia_if) implica evaluar la !NT(condición). Si
  evalúa a !JAVA(true), se ejecutará la !NT(sentencia_si_verdadero). En caso
  contrario, se ejecutará la !NT(sentencia_si_falso), si es que existe.

- Aunque las !NT(sentencia_si_verdadero) y !NT(sentencia_si_falso) pueden ser
  sentencias simples, se aconseja (por regla de estilo) usar siempre bloques.

- Recordar que los bloques no hay que acabarlos en `;`.

## `switch`

- La palabra clave !JAVA(switch) introduce una estructura alternativa múltiple.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia_switch) ::=
      !T(switch)\  !T{(}!NT(expresión)!T{)}\  !T[{]
              (!T(case) !NT(expresión_case)!T(:)
                      !NT{sentencia_case}*)!MAS
              \[!T(default)!T(:)
                      !NT{sentencia_default}\]
      !T(})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Se evalúa la !NT(expresión) y se compara con las distintas
  !NT(expresión_case), de una en una y de arriba abajo.

- Cuando se encuentra una que sea igual, se ejecuta su !NT(sentencia_case)
  correspondiente y se sigue comparando con las siguientes !NT{expresión_case}
  (salvo que haya un !JAVA(break)).

- Si no hay ninguna !NT(expresión_case) que coincida, y existe la cláusula
  !T(default), se ejecuta la !NT(sentencia_default).

---

- Ejemplo:

  ```java
  switch (k) {
      case 1: System.out.println("uno");
              break;  // sale del switch
      case 2: System.out.println("dos");
              break;  // sale del switch
      case 3: System.out.println("muchos");
              break;  // no hace falta, pero es conveniente
  }
  ```

## `while`

- La palabra clave !JAVA(while) introduce una sentencia o estructura
  repetitiva.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia_while) ::= !T(while)\  !T{(}!NT(condición)!T{)}\  !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Se evalúa la !NT(condición) y, si evalúa a !JAVA(true), se ejecuta la
  !NT(sentencia) y se vuelve de nuevo a evaluar la !NT(condición) hasta que
  evalúa a !JAVA(false).

- Si la !NT(condición) evalúa a !JAVA(false) desde el principio, la
  !NT(sentencia) no se ejecuta ninguna vez.

- La sentencia !JAVA(while) implementa un **bucle**, y cada ejecución de la
  !NT(sentencia) representa una **iteración** del bucle.

- Aunque la !NT(sentencia) puede ser simple, se aconseja (por regla de estilo)
  usar siempre un bloque.

---

- Ejemplo:

  ```java
  int i = 0;
  while (i < 5) {
      System.out.println(i);
      i++;
  }
  ```

  Imprime:

  ```
  0
  1
  2
  3
  4

  ```

## `for`

- La palabra clave !JAVA(for) introduce un variante del bucle !JAVA(while)
  donde los elementos de control del bucle aparecen todos en la misma línea al
  principio de la estructura.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia_for) ::= !T(for)\  !T{(}[!NT(inicialización)]!T(;) [!NT(condición)]!T(;) [!NT(actualización)]!T{)}\  !NT(sentencia)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Equivale a hacer:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(inicialización)
!T(while)\  !T{(}!NT(condición)!T{)}\  !T({)
        !NT(sentencia)
        !NT(actualización)
!T(})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- La !NT(inicialización) es una sentencia que puede ser también una
  declaración. En tal caso, esa declaración tendrá un ámbito local a la
  sentencia !JAVA(for) y no existirá fuera de ella.

---

- La !NT(inicialización), la !NT(condición) y la !NT(actualización) son todas
  opcionales.

- Aunque la !NT(sentencia) puede ser simple, se aconseja (por regla de estilo)
  usar siempre un bloque.

- Ejemplo:

  El siguiente bucle !JAVA(while):

  ```java
  int i = 0;
  while (i < 5) {
      System.out.println(i);
      i++;
  }
  ```

  se puede escribir como un bucle !JAVA(for):

  ```java
  for (int i = 0; i < 5; i++) {
      System.out.println(i);
  }
  ```

## `do ... while`

- La palabra clave !JAVA(do) introduce un tipo especial de bucle donde la
  condición de continuación se comprueba al final, y no al principio como es
  habitual.

- Su sintaxis es:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(sentencia_do_while) ::= !T(do)\  !NT(sentencia)\  !T(while)\  !T{(}!NT(condición)!T{)}!T(;)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Se ejecuta la !NT(sentencia) y, a continuación, se comprueba la
  !NT(condición). Si evalúa a !JAVA(true), se vuelve a ejecutar la
  !NT(sentencia) y a evaluar la !NT(condición), y así sucesivamente hasta que
  la !NT(condición) evalúa a !JAVA(false).

- Se garantiza que la !NT(sentencia) se ejecutará, al menos, una vez.

- Aunque la !NT(sentencia) puede ser simple, se aconseja (por regla de estilo)
  usar siempre un bloque.

---

- Ejemplo:

  ```java
  do {
      System.out.println(i);
      i++;
  } while (i < 5);
  ```

  Independientemente de lo que valga `i` al empezar a ejecutar el !JAVA(do), el
  !JAVA(println) se va a ejecutar, al menos, una vez.

## `break` y `continue`

- Por tanto, la sentencia !JAVA(break) sólo puede aparecer dentro de un
  !JAVA(switch), !JAVA(while), !JAVA(do) o !JAVA(for).

- La sentencia !JAVA(break) produce un salto incondicional que hace que el
  control salga de la sentencia !JAVA(switch), !JAVA(while), !JAVA(do) o
  !JAVA(for) más interna en la que se encuentra el !JAVA(break).

- La sentencia !JAVA(continue) transfiere el control a la siguiente iteración
  del bucle actual más interno. Por tanto, sólo puede aparecer dentro de un
  !JAVA(while), !JAVA(for) o !JAVA(do).

# Entrada/salida

## Flujos `System.in`, `System.out` y `System.err`

- Java tiene 3 flujos denominados !JAVA(System.in), !JAVA(System.out) y
  !JAVA(System.err) que se utilizan normalmente para proporcionar entrada y
  salida a las aplicaciones Java.

- El más utilizado es probablemente !JAVA(System.out), que sirve para escribir
  en la consola desde programas de consola (aplicaciones de línea de órdenes).

- Estos flujos son inicializados por la máquina virtual de Java, por lo que no
  es necesario crearlos uno mismo.

- Todos son objetos de la clase !JAVA(java.lang.System).

---

- La JVM y el sistema operativo conectan:

  - !JAVA(System.in) con el flujo 0 (que normalmente es el teclado), también
    llamado _entrada estándar_.

  - !JAVA(System.out) con el flujo 1 (que normalmente es la pantalla), también
    llamado _salida estándar_.

  - !JAVA(System.err) con el flujo 2 (que normalmente también es la pantalla),
    también llamado _salida estándar de errores_.

- Eso se puede cambiar al llamar al programa desde la línea de órdenes del
  sistema operativo usando _redirecciones_.

- !JAVA(System.in) es un objeto de la clase !JAVA(java.io.InputStream).

- !JAVA(System.out) y !JAVA(System.err) son objetos de la clase
  !JAVA(java.io.PrintStream).

  Esta clase dispone de métodos !JAVA(print) y !JAVA(println) muy usados para
  imprimir datos por la salida.

## `java.util.Scanner`

- La clase !JAVA(java.util.Scanner) se usa para recoger la entrada del usuario,
  normalmente a través del flujo !JAVA(System.in).

- Un objeto de la clase !JAVA(Scanner) rompe su entrada en _tokens_ usando un
  determinado patrón delimitador que, por defecto, simplemente troceará las
  palabras separadas con espacios en blanco.

- Los _tokens_ resultantes pueden convertirse en valores de distintos tipos
  usando alguno de los métodos !JAVA(next).

- Cada vez que se llama a uno de esos métodos, se consume el siguiente dato (de
  un determinado tipo) que se encuentre en el flujo de entrada.

!EJEMPLOS

- El siguiente código lee un número de la entrada estándar:

  ```java
  Scanner sc = new Scanner(System.in);
  int i = sc.nextInt();
  ```

- Este código va recogiendo valores de tipo !JAVA(long) a partir de un archivo
  llamado `mis_numeros`:

  ```java
  Scanner sc = new Scanner(new File("mis_numeros"));
  while (sc.hasNextLong()) {
      long unLong = sc.nextLong();
  }
  ```

- Lee una línea de la entrada del usuario y la imprime:

  ```java
  import java.util.Scanner;  // Importa la clase Scanner

  class MyClass {
      public static void main(String[] args) {
          Scanner myObj = new Scanner(System.in);  // Crea un objeto Scanner
          System.out.println("Introduzca nombre de usuario:");

          String userName = myObj.nextLine();  // Lee entrada del usuario
          System.out.println("El nombre es: " + userName);  // Imprime la entrada
      }
  }
  ```

---

- Los métodos que permiten leer el siguiente dato de la entrada según su tipo
  son:

-------------------------------------------------------------------------
Método                 Descripción
---------------------- --------------------------------------------------
!JAVA(nextBoolean)     Devuelve un valor !JAVA(boolean) de la entrada

!JAVA(nextByte)        Devuelve un valor !JAVA(byte) de la entrada

!JAVA(nextDouble)      Devuelve un valor !JAVA(double) de la entrada

!JAVA(nextFloat)       Devuelve un valor !JAVA(float) de la entrada

!JAVA(nextInt)         Devuelve un valor !JAVA(int) de la entrada

!JAVA(nextLine)        Devuelve un valor !JAVA(String) de la entrada

!JAVA(nextLong)        Devuelve un valor !JAVA(long) de la entrada

!JAVA(nextShort)       Devuelve un valor !JAVA(short) de la entrada
-------------------------------------------------------------------------

---

- Los métodos !JAVA(next) and !JAVA(hasNext) y sus correspondientes
  acompañantes (como !JAVA(nextInt) and !JAVA(hasNextInt)) primero saltarán
  cualquier entrada que encaje con el patrón delimitador y luego intentarán
  devolver el siguiente _token_.

- Una operación realizada sobre el !JAVA(Scanner) puede detener el programa a
  la espera de una entrada.

- Tanto !JAVA(hasNext) como !JAVA(next) pueden detener el programa a la espera
  de una entrada.

- El que un !JAVA(hasNext) detenga o no el programa, no tiene nada que ver con
  que su !JAVA(next) asociado pueda o no detener el programa.

---

- Con el método !JAVA(useDelimiter) podemos indicar otro patrón delimitador que
  no sean espacios en blanco.

- Por ejemplo, el siguiente código:

  ```java
  String input = "1 fish 2 fish red fish blue fish";
  Scanner s = new Scanner(input).useDelimiter("\\s*fish\\s*");
  System.out.println(s.nextInt());
  System.out.println(s.nextInt());
  System.out.println(s.next());
  System.out.println(s.next());
  s.close();
  ```

  produce la siguiente salida:

  ```
  1
  2
  red
  blue
  ```

- El argumento de !JAVA(useDelimiter) es una expresión regular.

!BIBLIOGRAFIA
