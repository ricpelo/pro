---
title: Introducción
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008, @van-roy_concepts_2004
---

# Conceptos básicos

<!--

---

!QUIZ
~~~~~~~~~~~~~~~~~~~~~~~
{
   "info": {
      "name": "",
      "main": ""
   },
   "questions": [
      {
         "q": "What number is the letter A in the English alphabet?",
         "a": [
            {"option": "8",  "correct": false},
            {"option": "14", "correct": false},
            {"option": "1",  "correct": true},
            {"option": "23", "correct": false}
         ],
         "correct": "The letter A is the first letter in the alphabet!",
         "incorrect": "It's the first letter of the alphabet. Did you actually <em>go</em> to kindergarden?"
      }
   ]
}
~~~~~~~~~~~~~~~~~~~~~~~

-->

## Informática

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Informática**:

  La ciencia que estudia los sistemas de procesamiento automático de la
  información, también llamados **sistemas informáticos**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Estos sistemas están formados por:

  - Elementos físicos (**hardware**).

  - Elementos lógicos (**software**).

  - Elementos humanos (profesionales y usuarios).

---

- El *hardware* es todo aquello que podemos tocar:

  - Ordenadores

  - Soportes de almacenamiento

  - Redes de comunicaciones

  - ...

- El *software* es todo lo que **no** podemos tocar:

  - Datos

  - Programas

- Pero en este módulo, cuando hablemos de *software* en general, nos estaremos
  refiriendo a **programas**.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Nuestra tarea como programadores es la de escribir programas que resuelvan los
problemas de los usuarios.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Procesamiento automático

- Los sistemas informáticos (en particular, los ordenadores que los forman)
  procesan la información de forma automática siguiendo las instrucciones de un
  programa.

- Las instrucciones que forman el programa son las que dictan qué operaciones
  hay que realizar con la información.

- Esa información se codifica, almacena y manipula en forma de **datos**.

- Los datos, por tanto, son información codificada y almacenada en un formato y
  en un soporte adecuados para ser manipulados por un sistema informático.

---

- El procesamiento automático de la información siempre sigue el mismo esquema:

!DOT(procesamiento-automatico.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
E [label = "Entrada", shape = plaintext, fillcolor = transparent];
S [label = "Salida", shape = plaintext, fillcolor = transparent];
E -> Proceso -> S
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El **objetivo** del procesamiento automático de la información es **convertir
  los _datos de entrada_ en _datos de salida_** mediante un *hardware* que
  ejecuta las instrucciones definidas por un *software* (**programas**).

- Los programas gobiernan el funcionamiento del *hardware*, indicándole qué
  tiene que hacer y cómo.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~
La **Programación** es la ciencia y el arte de diseñar dichos programas.
~~~~~~~~~~~~~~~~~~~~~~~

!EJEMPLOS

- Calcular la suma de cinco números:

  - **Entrada**: los cinco números.

  - **Proceso**: sumar cada número con el siguiente hasta acumular el resultado
    final.

  - **Salida**: la suma calculada.

- Dada una lista de alumnos con sus calificaciones finales, obtener otra lista
  ordenada de mayor a menor por la calificación obtenida y que muestre sólo los
  alumnos aprobados:

  - **Entrada**: Una lista de pares *(Nombre del alumno, Calificación)*.

  - **Proceso**: Eliminar de la lista los pares que tengan una calificación
    menor que cinco y ordenar la lista resultante de mayor a menor según la
    calificación.

  - **Salida**: la lista ordenada de alumnos aprobados.

!EJERCICIO

@. Identificar la entrada, el proceso y la salida en los siguientes supuestos:

    a. Convertir una temperatura en grados Fahrenheit a Celsius.

    b. Calcular el área de un triángulo a partir de su base y su altura.

    c. Calcular el perímetro de un cuadrado.

    d. Determinar si una llamada entrante en un teléfono móvil es sospechosa de
       *spam*.

## Ordenador

### Definición

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Ordenador**:

Un ordenador es una máquina que procesa información automáticamente de
acuerdo con un programa almacenado.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Es una *máquina*.

- Su función es *procesar información*.

- El procesamiento se realiza de forma *automática*.

- El procesamiento se realiza siguiendo un *programa* (*software*).

- Este programa está *almacenado* en una memoria interna del mismo ordenador
  (arquitectura de **Von Neumann**).

### Funcionamiento básico

#### Elementos funcionales

- Un ordenador consta de tres componentes principales:

  1. **Unidad central de proceso (CPU) o procesador**

     - *Unidad aritmético-lógica (ALU)*

     - *Unidad de control (UC)*

  2. **Memoria**

     - *Memoria principal* o central

       - *Memoria de acceso aleatorio (RAM)*

       - *Memoria de sólo lectura (ROM)*

     - *Memoria secundaria* o externa

  3. **Dispositivos de E/S**

     - *Dispositivos de entrada*

     - *Dispositivos de salida*

#### Unidad central de proceso (CPU) o procesador

- **Unidad aritmético-lógica (ALU)**:

  Realiza los cálculos y el procesamiento numérico y lógico.

- **Unidad de control (UC)**:

  Ejecuta de las instrucciones enviando las señales a las distintas unidades
  funcionales involucradas.

#### Memoria

- **Memoria principal** o central:

  - De menor capacidad pero mayor velocidad que la memoria secundaria.

  - La CPU puede acceder directamente a la información almacenada en la memoria
    principal.

- **Memoria secundaria**, externa o masiva:

  - Más lenta que la memoria principal, pero de mucha más capacidad.

  - La información debe pasar primero de la memoria secundaria a la principal
    para que la CPU pueda trabajar con ella.

!UNUN(Memoria principal)

- Está formada por celdas o posiciones numeradas.

- Cada celda almacena cierta cantidad de información (la misma cantidad todas
  las celdas).

- El número que identifica cada celda se denomina **dirección** de memoria.

- Para acceder a la información almacenada en la memoria, la CPU debe indicar
  la dirección de la celda a la que desea acceder.

- La memoria principal almacena los datos y los programas que los manipulan.

- Ambos (datos y programas) deben estar en la memoria principal para que la CPU
  pueda acceder a ellos.

---

- Dos tipos de memoria principal:

  - **Memoria de acceso aleatorio (RAM)**:

    Su contenido se borra al apagar el ordenador.

  - **Memoria de sólo lectura (ROM)**:

    Información permanente (ni se borra ni se puede cambiar).

    Contiene la información esencial (datos y software) para que el ordenador
    pueda arrancar.

#### Dispositivos de E/S

- **Dispositivos de entrada**:

  Introducen datos en el ordenador (*ejemplos*: teclado, ratón, escáner...)

- **Dispositivos de salida**:

  Vuelcan datos fuera del ordenador (*ejemplos*: pantalla, impresora...)

- **Dispositivos de entrada/salida**:

  Actúan simultáneamente como dispositivos de entrada y de salida (*ejemplos*:
  pantalla táctil, adaptador de red...)

- Los dispositivos que acceden a **soportes de almacenamiento masivo** (las
  **memorias secundarias**) también se pueden considerar dispositivos de E/S:

  - Los soportes de **sólo lectura** se leen con dispositivos de entrada
    (*ejemplo*: discos ópticos).

  - Los soportes de **lectura/escritura** operan como dispositivos de
    entrada/salida (*ejemplos*: discos duros, pendrives, tarjetas SD...).

---

!DOT(esquema-basico.svg)(Esquema básico de un ordenador)(!WIDTH)(width=100%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = LR, splines = ortho];
node [shape = box];
compound = true;

ALU [label = "Unidad Aritmético-Lógica\n(ALU)"];
UC [label = "Unidad de Control\n(UC)"];
M [label = "Memoria\nprincipal"];
MS [label ="Memoria\nsecundaria", shape = "cylinder"];
E [label = "Dispositivos\n de entrada"];
S [label = "Dispositivos\n de salida"];

subgraph cluster0 {
    label = < <b>Unidad central</b> >;
    bgcolor = white;
    subgraph cluster1 {
        label = < <b>Unidad Central de Proceso<br/>(CPU)</b> >;
        bgcolor = white;
        ALU -> UC;
        UC -> ALU;
    }
    M -> UC [lhead = cluster1];
    UC -> M [ltail = cluster1];
}

E -> ALU [lhead = cluster0];
M -> S [ltail = cluster0];
MS -> UC [lhead = cluster0];
UC -> MS [ltail = cluster0];
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El programa se **carga** de la memoria secundaria a la memoria principal.

- Una vez allí, la CPU va **extrayendo** las instrucciones que forman el
  programa y las va **ejecutando** paso a paso, en un bucle continuo que se
  denomina **ciclo de instrucción**.

- Durante la ejecución del programa, la CPU recogerá los datos de entrada desde
  los dispositivos de entrada y los almacenará en la memoria principal, para
  que las instrucciones puedan operar con ellos.

- Finalmente, los datos de salida se volcarán hacia los dispositivos de salida.

#### Ciclo de instrucción

- En la **arquitectura Von Neumann**, los programas se almacenan en la memoria
  principal junto con los datos (por eso también se denomina «arquitectura de
  **programa almacenado**»).

- Una vez que el programa está cargado en memoria, la CPU repite siempre los
  mismos pasos:

  #. (**Fetch**) Busca la siguiente instrucción en la memoria principal.

  #. (**Decode**) Decodifica la instrucción (identifica qué instrucción es y se
     prepara para su ejecución).

  #. (**Execute**) Ejecuta la instrucción (envía las señales de control
     necesarias a las distintas unidades funcionales).

---

!DOT(ciclo-instruccion.svg)(Ciclo de instrucción)(!WIDTH)(width=40%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = TB, splines = ortho];
Fetch -> Decode -> Execute -> Fetch[constraint = false];
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Representación de información

- En un sistema informático, toda la información se almacena y se manipula en
  forma de números.

- Por tanto, para que un sistema informático pueda procesar información,
  primero hay que representar dicha información usando números, proceso que se
  denomina **codificación**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Codificación**:

  Proceso mediante el cual se representa información dentro de un sistema
  informático, asociando a cada dato uno o más valores numéricos.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Una codificación, por tanto, es una correspondencia entre un conjunto de
  datos y un conjunto de números llamado **código**. Al codificar, lo que
  hacemos es asociar a cada dato un determinado número dentro del código.

---

- Hay muchos tipos de información (textos, sonidos, imágenes, valores
  numéricos...) y eso hace que pueda haber muchas formas de codificación.

- Incluso un mismo tipo de dato (un número entero, por ejemplo) puede tener
  distintas codificaciones, cada una con sus características y propiedades.

- Distinguimos la forma en la que se representa la información *internamente*
  en el sistema informático (**codificación interna**) de la que usamos para
  comunicar dicha información *desde y hacia el exterior* (**codificación
  externa** o **de E/S**).

!DOT(codificaciones.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
E [label = "Exterior", shape = oval];
S [label = <Sistema<br/>informático<br/><br/>(<b><i>Codificación interna</i></b> )>];

S -> E [dir = both, label = <<b><i>Código de E/S</i></b>>];
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Codificación interna

- Los ordenadores son **sistemas electrónicos digitales** que trabajan
  conmutando entre varios posibles estados de una determinada magnitud física
  (voltaje, intensidad de corriente, etc.).

- Lo más sencillo y práctico es usar únicamente dos estados posibles.

  Por ejemplo:

  - 0 V y 5 V de voltaje.

  - 0 mA y 100 mA de intensidad de corriente.

- A cada uno de los dos posibles estados le hacemos corresponder
  (arbitrariamente) un valor numérico **0** ó **1**. A ese valor se le denomina
  **bit** (contracción de *binary digit*, dígito binario).

---

- Por ejemplo, la memoria principal de un ordenador está formada por millones
  de celdas, parecidas a microscópicos condensadores. Cada uno de estos
  condensadores puede estar cargado o descargado y, por tanto, es capaz de
  almacenar un bit:

  - Condensador cargado: bit a 1
  - Condensador descargado: bit a 0

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Bit**:

  Un bit es, por tanto, la unidad mínima de información que es capaz de
  almacenar y procesar un ordenador, y equivale a un **dígito binario**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En la práctica, se usan unidades múltiplos del bit:

  - 1 byte = 8 bits
  - 1 Kibibyte (KiB) = $2^{10}$ bytes = 1024 bytes
  - 1 Mebibyte (MiB) = $2^{20}$ bytes = 1024 Kibibytes
  - 1 Gibibyte (GiB) = $2^{30}$ bytes = 1024 Mebibytes
  - 1 Tebibyte (TiB) = $2^{40}$ bytes = 1024 Gibibytes

#### Sistema binario

- El sistema de numeración que usamos habitualmente los seres humanos es el
  **decimal** o sistema **en base diez**.

- En ese sistema disponemos de diez dígitos distintos (0, 1, 2, 3, 4, 5, 6, 7,
  8 y 9) y cada dígito en un determinado número tiene un peso que es múltiplo
  de una potencia de diez.

  Por ejemplo: $$243 = 2 \times 10^2 + 4 \times 10^1 + 3 \times 10^0$$

- El sistema de numeración que usan los ordenadores es el **sistema binario** o
  sistema **en base dos**, en el cual disponemos sólo de dos dígitos (0 y 1) y
  cada peso es múltiplo de una potencia de dos.

  Por ejemplo: $$101 = 1 \times 2^2 + 0 \times 2^1 + 1 \times 2^0$$

---

- Generalmente, los **números naturales** se codifican internamente mediante su
  representación en binario.

- Los **números enteros** se suelen codificar mediante:

  - Bit de signo (signo y magnitud)

  - Complemento a uno

  - Complemento a dos

- Los **números reales** se pueden codificar mediante:

  - Coma fija

  - Coma flotante

    - Simple precisión

    - Doble precisión

  - Decimal codificado en binario (BCD)

#### Codificación externa

- La información enviada desde y hacia el exterior del sistema informático se
  representa en forma de **cadenas de caracteres**.

- Para representar cadenas de caracteres y comunicarse con el exterior, el
  ordenador utiliza **códigos de E/S** o **códigos externos**.

- A cada carácter (letra, dígito, signo de puntuación, símbolo especial...) le
  corresponde un _código_ (que es un número) dentro de un **conjunto de
  caracteres**.

- Existen conjuntos de caracteres:

  - De **longitud fija**: a todos los caracteres les corresponden un código, y
    todos los códigos tienen la misma longitud (mismo número de bytes).

  - De **longitud variable**: en el mismo conjunto de caracteres hay códigos
    más largos y más cortos (por tanto, hay caracteres que ocupan más bytes que
    otros).

#### ASCII

- *American Standard Code for Information Interchange*.

- El conjunto de caracteres ASCII (o **código ASCII**) es el más implantado en
  el *hardware* de los equipos informáticos.

- Es la base de otros códigos más modernos, como el ISO-8859-1 o el Unicode.

- Es un código de 7 bits:

  - Cada carácter ocupa 7 bits.

  - Hay $2^7 = 128$ caracteres posibles.

  - Los 32 primeros códigos (del 0 al 31) son no imprimibles (códigos de
    control).

- El ISO-8859-1 es un código de 8 bits que extiende el ASCII con un bit más
  para contener caracteres latinos.

---

- Tabla de caracteres ASCII estándar de 7 bits:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ```
  Dec Hex Car    Dec Hex Car    Dec Hex Car    Dec Hex Car
  --- --- ---    --- --- ---    --- --- ---    --- --- ---
  32  20         56  38   8     80  50   P     104 68   h
  33  21   !     57  39   9     81  51   Q     105 69   i
  34  22   "     58  3A   :     82  52   R     106 6A   j
  35  23   #     59  3B   ;     83  53   S     107 6B   k
  36  24   $     60  3C   <     84  54   T     108 6C   l
  37  25   %     61  3D   =     85  55   U     109 6D   m
  38  26   &     62  3E   >     86  56   V     110 6E   n
  39  27   '     63  3F   ?     87  57   W     111 6F   o
  40  28   (     64  40   @     88  58   X     112 70   p
  41  29   )     65  41   A     89  59   Y     113 71   q
  42  2A   *     66  42   B     90  5A   Z     114 72   r
  43  2B   +     67  43   C     91  5B   [     115 73   s
  44  2C   ,     68  44   D     92  5C   \     116 74   t
  45  2D   -     69  45   E     93  5D   ]     117 75   u
  46  2E   .     70  46   F     94  5E   ^     118 76   v
  47  2F   /     71  47   G     95  5F   _     119 77   w
  48  30   0     72  48   H     96  60   `     120 78   x
  49  31   1     73  49   I     97  61   a     121 79   y
  50  32   2     74  4A   J     98  62   b     122 7A   z
  51  33   3     75  4B   K     99  63   c     123 7B   {
  52  34   4     76  4C   L     100 64   d     124 7C   |
  53  35   5     77  4D   M     101 65   e     125 7D   }
  54  36   6     78  4E   N     102 66   f     126 7E   ~
  55  37   7     79  4F   O     103 67   g
  ```
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Unicode

- Con 8 bits (y con 7 bits aún menos) no es posible representar todos los
  posibles caracteres de todos los sistemas de escritura usados en el mundo.

- Unicode es el estándar de codificación de caracteres más completo y universal
  en la actualidad.

- Cada carácter en Unicode se define mediante un identificador numérico llamado
  *code point*.

- Unicode define tres formas de codificación:

  - **UTF-8**: codificación de 8 bits, de longitud variable (cada *code point*
    puede ocupar de 1 a 4 bytes). **El más usado en la actualidad.**

  - **UTF-16**: codificación de 16 bits, de longitud variable (cada *code
    point* puede ocupar 1 ó 2 palabras de 16 bits).

  - **UTF-32**: codificación de 32 bits, de longitud fija (cada *code point*
    ocupa 1 palabra de 32 bits).

## Problema

- Escribimos programas para que el ordenador procese información de forma
  automática.

- Pero ese procesamiento automático se lleva a cabo por una razón: **resolver
  un problema** usando un ordenador.

- Si un problema es **resoluble** usando un ordenador (*no todos lo son*),
  podremos escribir un programa que lo resuelva.

- Estos son los problemas que nos interesa estudiar en Programación.

### Generalización

- En Programación nos interesa siempre resolver problemas generales y no casos
  particulares.

- Por ejemplo, el problema de calcular la suma de 4 y 3 es un **problema
  particular**, porque una solución al problema sólo servirá para resolver
  *ese* problema en concreto, y no servirá para sumar otro par de números (el 9
  y 5, por ejemplo).

- En cambio, el problema de calcular la suma de cualquier par de números
  enteros es un **problema general**, ya que una solución al problema serviría
  para resolver cualquier caso particular de ese problema general.

  - Por ejemplo, esa solución al problema general me serviría para calcular la
    suma de 4 y 3, de 9 y 5, de 12 y 38, ... De hecho, infinitos casos
    particulares.

### Ejemplares de un problema

- A los casos particulares de un problema general se les denomina
  **ejemplares** del problema.

  - Por ejemplo, la pareja $(4, 3)$ es un ejemplar del problema general de
    sumar dos números enteros.

- Normalmente, un problema consistirá en una colección infinita de ejemplares.

  - Pero también hay problemas finitos (aunque muy grandes) como el de jugar
    perfectamente al ajedrez.

- La solución a un problema debe resolver correctamente todos los ejemplares
  del mismo, es decir, debe resolver el problema general de forma que sirva
  para todos sus ejemplares.

### Dominio de definición

- El **dominio de definición** de un problema describe con precisión el
  conjunto de sus ejemplares.

  - Por ejemplo: en el problema de sumar dos números enteros, sus ejemplares
    serán cualquier pareja de números enteros (no vale que los números sean
    reales o fracciones). Ese es su dominio de definición.

- La solución al problema debe centrarse en el dominio de definición del
  problema, y no está obligado a resolver ejemplares que se encuentren fuera de
  dicho dominio de definición.

  - Por ejemplo: un programa que resuelva correctamente el problema de sumar
    dos números enteros no tiene por qué funcionar correctamente si intentamos
    usarlo para sumar dos fracciones.

### Jerarquías de generalización

- Se dice que un problema $P$ es **más general** que un problema $Q$ (o bien,
  que es una **generalización** del problema $Q$) si los ejemplares de $Q$
  también son ejemplares de $P$, y además hay ejemplares de $P$ que no lo son
  de $Q$.

  - Es otra forma de decir que el conjunto de ejemplares de $Q$ es un
    *subconjunto propio* del conjunto de ejemplares de $P$.

- Igualmente, se dice que $Q$ es un problema **menos general** o **más
  particular** que el problema $P$ (o bien, que es una **especialización** del
  problema $P$).

- Este concepto resulta interesante porque, si tenemos una solución al problema
  $P$, podremos usarla para resolver el problema $Q$.

---

!DOT(jerarquias-generalizacion.svg)($P$ es un problema más general que $Q$)(width=50%)(width=20%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
subgraph cluster0 {
    style = "rounded, filled"
    label = <<i>P</i>>
    bgcolor = "transparent"
    fillcolor = "grey99"
    Q [style = "rounded, filled", label = <<i>Q</i>>, fillcolor = "grey90"]
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Por ejemplo, el problema de calcular la suma de *tres* números enteros es un
  problema **más general** que el de sumar *dos* números enteros, porque éste
  último se puede considerar un caso particular del primero (haciendo que uno
  de los tres números a sumar valga cero).

- Por tanto, si tenemos un método para resolver el problema más general (el de
  sumar tres números) podemos usarlo para resolver uno menos general (el de
  sumar dos números).

- En este caso, basta con hacer que uno de los tres números sea cero y los
  otros dos sean los números a sumar:

!DOT(sumar-dos-numeros.svg)(Sumar dos números es un caso particular de sumar tres)(width=50%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
splines = ortho
node [shape = "plaintext", fillcolor = transparent]
suma [label = "suma de tres números", shape = "box", fillcolor = white]
res [label = "x + y"]
x -> suma
y -> suma
z [label = "z = 0"]
z -> suma
suma -> res
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJERCICIOS

@. Con cada uno de los siguientes problemas, dar al menos un ejemplar del mismo
   e inventar un problema más general:

    a. Calcular cuántos días han pasado entre dos fechas del mismo año.

    b. Calcular el perímetro de un cuadrado a partir de la longitud de uno de
       sus lados.

@. Inventar un problema más particular para el problema de sumar dos fracciones
   de números enteros y dar dos ejemplares distintos de cada uno de los dos
   problemas.

@. Dado el siguiente problema: «Calcular cuántos picos y cuántas patas hay en
   una granja con $X$ gallinas y $Y$ cerdos», determinar si los siguientes
   casos son *ejemplares* del problema o bien son *especializaciones* del
   problema:

    a. Calcular cuántos picos y cuántas patas hay en una granja con 5 gallinas
       y 7 cerdos.

    b. Calcular cuántas patas hay en una granja con $Z$ cerdos.

## Algoritmo

### Definición

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Algoritmo**:

Un algoritmo es un método para resolver un problema.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Está formado por una secuencia de pasos o **instrucciones** que se deben
  seguir (o **ejecutar**) para resolver el problema.

- La palabra «algoritmo» proviene de **Mohammed Al-Khowârizmi**, matemático
  persa que vivió durante el siglo IX y reconocido por definir una serie de
  reglas paso a paso para sumar, restar, multiplicar y dividir números
  decimales.

- **Euclides**, el gran matemático griego (del siglo IV a. C.) que inventó un
  método para encontrar el máximo común divisor de dos números, se considera
  con Al-Khowârizmi el otro gran padre de la Algorítmica (la ciencia que
  estudia los algoritmos).

---

- El estudio de los algoritmos es importante porque la resolución de un
  problema exige el diseño de un algoritmo que lo resuelva.

- Puede haber muchas formas distintas de resolver el mismo problema, por lo que
  **pueden existir muchos algoritmos distintos que resuelvan el mismo
  problema**.

  Un algoritmo será mejor que otro si es más claro o más eficiente.

- Una vez diseñado el algoritmo, se traduce a un programa informático usando un
  *lenguaje de programación*.

- Finalmente, un ordenador ejecuta dicho programa.

!DOT(resolucion-problema.svg)(Resolución de un problema)(!WIDTH)(width=80%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Problema" -> "Diseño de algoritmo" -> "Programa informático"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<!--

---

!QUIZ
~~~~~~~~~~~~~~~~~~~~~~~
{
   "info": {
      "name": "",
      "main": ""
   },
   "questions": [
      {
         "q": "¿Qué es lo primero que hay que hacer a la hora de resolver un problema mediante un programa informático?",
         "a": [
            {"option": "Diseñar el algoritmo", "correct": false},
            {"option": "Estudiar el problema", "correct": true},
            {"option": "Ejecutar el programa", "correct": false},
            {"option": "Escribir el programa",  "correct": false}
         ],
         "correct": "Lo primero que hay que hacer es estudiar el problema que hay que resolver.",
         "incorrect": "Hay algo que debes hacer antes."
      },
      {
         "q": "¿Y lo segundo?",
         "a": [
            {"option": "Ejecutar el programa", "correct": false},
            {"option": "Estudiar el problema", "correct": false},
            {"option": "Escribir el programa",  "correct": false},
            {"option": "Diseñar el algoritmo", "correct": true}
         ],
         "correct": "Lo segundo es diseñar el algoritmo que resuelva el problema.",
         "incorrect": "No es correcto."
      },
      {
         "q": "¿Y lo tercero?",
         "a": [
            {"option": "Estudiar el problema", "correct": false},
            {"option": "Ejecutar el programa", "correct": false},
            {"option": "Escribir el programa",  "correct": true},
            {"option": "Diseñar el algoritmo", "correct": false}
         ],
         "correct": "Lo tercero es traducir el algoritmo en un programa usando un lenguaje de programación.",
         "incorrect": "No es correcto."
      },
      {
         "q": "¿Y por último?",
         "a": [
            {"option": "Escribir el programa",  "correct": false},
            {"option": "Ejecutar el programa", "correct": true},
            {"option": "Estudiar el problema", "correct": false},
            {"option": "Diseñar el algoritmo", "correct": false}
         ],
         "correct": "Por último, se ejecuta el programa en un ordenador.",
         "incorrect": "Eso se debe hacer antes."
      }
   ]
}
~~~~~~~~~~~~~~~~~~~~~~~

-->

### Características

- Un algoritmo debe ser:

  - **Preciso**: debe expresarse de forma no ambigua. La precisión afecta por
    igual a dos aspectos:

    - Al *orden* de los pasos que han de llevarse a cabo.

    - Al *contenido* de los pasos, pues en cada uno hay que saber qué hacer
      exactamente.

  - **Determinado**: si se sigue un algoritmo dos veces, se debe obtener el
    mismo resultado cada vez.

  - **Finito**: debe terminar en algún momento, es decir, debe tener un número
    finito de pasos.

### Representación

:::::: {.columns}

:::: {.column width=47%}

- Un algoritmo se puede describir usando el **lenguaje natural**, es decir,
  cualquier idioma humano.

- ¿Qué !COLOR(red)(problema) tiene esta forma de representación?

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~
  !COLOR(red)(**Ambigüedad**)
  ~~~~~~~~~~~~~~~~~~~~~~~

- En ciertos contextos la ambigüedad es asumible, pero **NO** cuando el
  destinatario es un ordenador.

- ¿Podemos decir que esta receta de cocina es un algoritmo?

::::

:::: {.column width=3%}

::::

:::: {.column width=47%}

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<div style="font-size: 90%">
**Instrucciones para hacer una tortilla**:

1. Coger dos huevos.
2. Encender el fuego.
3. Echar aceite a la sartén.
4. Batir los huevos.
5. Echar los huevos batidos en la sartén.
6. Esperar a que se haga por debajo.
7. Dar la vuelta a la tortilla.
8. Esperar de nuevo.
9. Sacar cuando esté lista.

**Fin**
</div>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::::

::::::

#### Ordinograma

- Representación gráfica que describe un algoritmo en forma de diagrama de
  flujo.

- Las flechas indican el orden de ejecución de las instrucciones.

- Los nodos condicionales (los rombos) indican que la ejecución se bifurca a
  uno u otro camino dependiendo de si se cumple o no una condición.

!EJEMPLO

Determinar cuál es el máximo de dos números

!IMGP(maximo.svg)()(width=50%)(width=50%)

#### Pseudocódigo

- Es un **lenguaje _semi-formal_**, a medio camino entre el lenguaje natural y
  el lenguaje que entendería un ordenador (lenguaje de programación).

- Está pensado para ser interpretado por una persona y no por un ordenador, así
  que no hace falta que tenga una sintaxis muy estricta.

- En general, no se tienen en cuenta las limitaciones impuestas por el
  *hardware* (CPU, memoria...) o el *software* (tamaño máximo de los datos,
  codificación interna...), siempre y cuando no sea importante el estudio de la
  eficiencia o la complejidad del algoritmo.

- En ese sentido, se usa como un lenguaje de programación *idealizado*, es
  decir, una _abstracción_ de un lenguaje de programación real en el que no se
  tienen en cuenta ciertos detalles que resultan innecesarios para entender el
  funcionamiento del algoritmo.

- Por ejemplo, en general no nos tenemos que preocupar de si el resultado de
  sumar dos números enteros sobrepasa el tamaño máximo establecido para
  almacenar un entero.

!EJEMPLO

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Algoritmo**: Obtener el mayor de dos números

1. $X \leftarrow$ **leer** número
2. $Y \leftarrow$ **leer** número
3. **si** $X > Y$ **entonces** **saltar** al paso 6
4. **escribir** "Y es mayor que X"
5. **saltar** al paso 7
6. **escribir** "X es mayor que Y"
7. **fin**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- No existe un único _pseudocódigo_.

- A la hora de usar un pseudocódigo para representar un algoritmo, el diseñador
  del mismo decidirá qué instrucciones son válidas en ese pseudocódigo y qué
  estilo de programación (lo que luego llamaremos _paradigma_) seguirá el
  mismo.

- Además, es importante es que no haya ninguna duda posible sobre cómo
  interpretar las instrucciones del pseudocódigo.

- Lo más apropiado sería usar un pseudocódigo que se parezca lo más posible al
  lenguaje de programación con el que finalmente se escribirá el programa, de
  forma que la tarea de traducir el algoritmo en su correspondiente programa
  sea lo más fácil y directa posible.

- Por ejemplo, el algoritmo anterior sería relativamente fácil de traducir a
  _lenguaje ensamblador_ o _lenguaje máquina_, ya que las instrucciones que se
  usan en ese pseudocódigo (lecturas, escrituras, saltos...) son fáciles de
  adaptar a esos lenguajes.

- En cambio, sería bastante más complicado traducirlo a un lenguaje funcional
  como Haskell, donde no existen esas instrucciones.

### Cualidades deseables

- **Corrección**: El algoritmo debe solucionar correctamente el problema.

- **Claridad**: Debe ser legible y comprensible para el ser humano.

- **Generalidad**: Un algoritmo debe resolver problemas generales. Por ejemplo,
  un algoritmo que sume dos números enteros debe servir para sumar cualquier
  pareja de números enteros, y no, solamente, para sumar dos números
  determinados, como pueden ser el 3 y el 5.

- **Eficiencia**: Un algoritmo es mejor cuanto menos recursos (tiempo,
  espacio...) necesita para resolver el problema. Por eso no debe realizar
  pasos innecesarios ni recordar más información de la necesaria.

- **Sencillez**: Hay que intentar que la solución sea sencilla, aun a costa de
  perder un poco de eficiencia; es decir, se tiene que buscar un equilibrio
  entre la claridad y la eficiencia.

- **Modularidad**: Un algoritmo puede formar parte de la solución a un problema
  mayor. A su vez, dicho algoritmo puede descomponerse en otros si esto
  favorece a la claridad del mismo.

### Computabilidad

- ¿Todos los problemas pueden resolverse de forma algorítmica?

- Dicho de otra forma, queremos saber lo siguiente:

  !CAJACENTRADA
  ~~~~~~~~~~~~~~~~~~
  Dado un problema, ¿existe un algoritmo que lo resuelva?
  ~~~~~~~~~~~~~~~~~~

---

- Todo problema $P$ lleva asociada una función $f_P: D \longrightarrow R$,
  donde:

  - $D$ es el conjunto de los datos de entrada.

  - $R$ es el conjunto de los resultados del problema.

- Asimismo, todo algoritmo $A$ lleva asociada una función $f_A$.

- La pregunta es: ¿existe un algoritmo A tal que $f_A = f_P$?

- Y de ahí vamos a la pregunta general:

  !CAJACENTRADA
  ~~~~~~~~~~~~~~~~~~
  ¿Toda función $f$ es computable (resoluble algorítmicamente)?
  ~~~~~~~~~~~~~~~~~~

---

La respuesta es que **NO**.

- Se puede demostrar que hay más funciones que algoritmos, por lo que **existen
  funciones que no se pueden computar mediante un algoritmo** (no son
  computables).

---

- La dificultad que tiene estudiar la computabilidad de funciones está en que
  no tenemos una definición formal de «*algoritmo*».

- A comienzos del S. XX, se crearon (independientemente uno del otro) dos
  formalismos matemáticos para representar el concepto de *algoritmo*:

  - Alonzo Church creó el **cálculo lambda**.

  - Alan Turing creó la **máquina de Turing**.

- Posteriormente se demostró que los dos formalismos eran totalmente
  equivalentes y eran, además, equivalentes a las **gramáticas formales**.

- Esto llevó a formular la llamada **tesis de Church-Turing**, que dice que

  !CAJACENTRADA
  ~~~~~~~~~~~~~~~~~~
  «*Todo algoritmo es equivalente a una máquina de Turing.*»
  ~~~~~~~~~~~~~~~~~~

- La tesis de Church-Turing es indemostrable pero prácticamente toda la
  comunidad científica la acepta como verdadera.

---

- Usando esos formalismos, se pudo demostrar que hay problemas que no se pueden
  resolver mediante algoritmos.

- Uno de los problemas que no tienen una solución algorítmica es el llamado
  **problema de la parada**:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~
  **Problema de la parada**:

  Dado un algoritmo y un posible dato de entrada, determinar (a priori, sin
  ejecutarlo previamente) si el algoritmo se detendrá y producirá un valor de
  salida.
  ~~~~~~~~~~~~~~~~~~~~~~~~

- Nunca podremos hacer un algoritmo que resuelva el problema de la parada en
  términos generales (en casos particulares sí se puede).

### Corrección

- ¿Cómo sabemos si un algoritmo es **correcto**?

- ¿Qué significa eso de que un algoritmo sea correcto?

- Supongamos que, para un problema $P$, existe un algoritmo $A$. Lo que tenemos
  que averiguar es si se cumple: $$f_P = f_A$$

- ¿Cómo lo hacemos?

  - Si el conjunto $D$ de datos de entrada es **finito**, podríamos comparar
    todos los resultados de salida con los resultados esperados y ver si
    coinciden (**pruebas exhaustivas**). Normalmente es imposible.

  - Si $D$ es **infinito**, es imposible realizar una comprobación empírica de
    la corrección del algoritmo (se pueden realizar **pruebas no exhaustivas**
    que comprueban algunos datos de entrada pero no todos, por lo que no
    demuestran que el algoritmo es correcto pero sí pueden demostrar que es
    incorrecto).

---

- Lo mejor (pero más difícil) es recurrir a **métodos formales**:

  - **Diseño a priori**: se construye el algoritmo en base a una demostración
    (lo que se denomina también **demostración constructiva**).

  - **Diseño a posteriori**: se construye el algoritmo de forma más o menos
    intuitiva y, una vez diseñado, tratar de demostrar su corrección.

- En ambos casos, es importante definir con mucha precisión qué problema
  queremos resolver.

- Para ello, se describe el problema mediante una **especificación formal**.

### Complejidad

- ¿Cómo de **eficiente** es un algoritmo?

- La eficiencia de un algoritmo se mide en función del **consumo de recursos**
  que necesita el algoritmo para su ejecución.

  - Los principales recursos son el **tiempo** y el **espacio**.

- Dados dos algoritmos distintos que resuelvan el mismo problema, en general
  nos interesará usar el más eficiente de ellos (al margen de otras
  consideraciones, como la claridad, la legibilidad, la mantenibilidad, la
  reusabilidad, etc.)

- ¿Cómo medimos la eficiencia de un algoritmo?

- ¿Cómo comparamos la eficiencia de dos algoritmos?

---

- El **análisis de algoritmos** estudia la eficiencia de un algoritmo desde un
  punto de vista abstracto (independiente de la máquina, el lenguaje de
  programación, la carga de trabajo, etc.).

- Define el consumo de recursos **en función del tamaño del ejemplar del
  problema a resolver**.

- Por ejemplo:

  - Supongamos el problema de comprobar cuántas vocales hay en una frase.

  - La **entrada** al algoritmo será la frase (una cadena de caracteres).

  - La **salida** será el número de vocales que hay en la cadena.

  - Cada una de las posibles cadenas de entrada representan un **ejemplar** del
    problema a resolver.

  - Cabe esperar que el algoritmo tarde más en dar el resultado cuanto más
    larga sea la cadena de entrada.

  - Por tanto, el **tamaño del ejemplar** será la longitud de la cadena.

---

- Si tenemos dos algoritmos $A$ y $B$ (que resuelven el mismo problema
  anterior) con tiempos de ejecución $$t_A(n) \simeq 3n^2$$ y $$t_B(n) \simeq
  4n$$ siendo $n$ la longitud de la cadena de entrada, el algoritmo $B$ se
  considera más eficiente que $A$ ya que su tiempo de ejecución es menor a
  medida que aumenta $n$.

- Esto es así aunque hay algún caso (como el de $n = 1$) donde el algoritmo $A$
  es más eficiente que $B$, ya que la constante multiplicativa 3 que aparece en
  $t_A(n)$ es más pequeña que la constante 4 que aparece en $t_B(n)$.

---

!IMGP(grafica-funciones.svg)(Representación gráfica de $3n^2$ y $4n$)(width=60%)(width=30%)

---

- En general, no estamos interesados en las constantes concretas que puedan
  aparecer en las $t(n)$, ni en el valor que éstas puedan tomar para un $n$
  concreto, sino que tan sólo nos interesa la **forma** que puedan tener las
  funciones $t(n)$ y cómo crecen a medida que aumenta $n$.

- Por eso, clasificamos el consumo de recursos usando una **notación
  asintótica**, con la cual podemos ordenar las funciones $t(n)$ según
  determinados *órdenes de crecimiento* cuando $n$ crece hasta el infinito.

- En el ejemplo anterior, tenemos $$t_A(n) \in O(n^2)$$ que se lee «$t_A(n)$ es
  del orden de $n^2$», y $$t_B(n) \in O(n)$$ que se lee «$t_B(n)$ es del orden
  de $n$». Podemos decir también que $A$ tiene **tiempo cuadrático** y $B$
  **tiempo lineal**.

- Como $O(n) \subset O(n^2)$ (porque $n^2$ crece más deprisa que $n$), podemos
  concluir que $t_B(n) < t_A(n)$ para un valor de $n$ suficientemente grande (o
  sea, *asintóticamente*). Por tanto, $B$ es un algoritmo más eficiente que
  $A$.

## Programa

- Un **programa** es una secuencia de instrucciones que le dicen a un ordenador
  lo que tiene que hacer para realizar una tarea o resolver un problema.

- Esas instrucciones deben estar escritas en un lenguaje que sea entendible por
  un ordenador, o bien que se pueda traducir de forma automática en algo que
  pueda entender el ordenador.

- Esos lenguajes son los llamados **lenguajes de programación**.

---

- Los algoritmos están pensados para ser entendidos por un ser humano, y se
  representan mediante técnicas (como el _pseudocódigo_) que están pensadas
  para ser entendidas por un humano, y no por un ordenador.

- En cambio, los programas están escritos para que los entienda un ordenador,
  para que los interprete y los ejecute.

- Sabiendo eso, una definición más precisa de _programa_ sería:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~
  **Programa**:

  Un programa es la codificación de un algoritmo en un lenguaje de
  programación.
  ~~~~~~~~~~~~~~~~~~~~~~~~

---

- El texto del programa escrito en ese lenguaje de programación se denomina
  **programa fuente** o **código fuente**.

- «_Programar_», muy resumidamente, consiste en escribir el código fuente de un
  programa (proceso que se denomina _codificación_), y es lo que producen los
  _programadores_ (o sea, nosotros) como resultado de su trabajo, aunque en
  realidad es una tarea mucho más compleja que consta de más pasos que veremos
  posteriormente.

- «_Codificar_» consiste en _reescribir_ un algoritmo en un programa escrito en
  un determinado lenguaje de programación.

  Por ello, a veces se usa el término _codificar_ como sinónimo de _programar_,
  si bien no son exactamente lo mismo.

- Si el algoritmo está bien definido, la codificación puede resultar trivial.

<!--
- Los algoritmos están pensados para ser entendidos por un ser humano, mientras
  que los programas se escriben para ser interpretados y ejecutados por un
  ordenador.
-->

- Por ello, toda posible ambigüedad que pudiera quedar en el algoritmo debe
  eliminarse al codificarlo en forma de programa.

---

- Programar depende mucho de las características del lenguaje de programación
  elegido.

- Lo ideal es usar un lenguaje que se parezca lo más posible al
  _pseudocódigo_ utilizado para describir el correspondiente algoritmo.

- En un programa también hay que considerar **aspectos y limitaciones** que
  no se suelen tener en cuenta en un algoritmo:

  - **El tamaño de los datos en memoria:** por ejemplo, en un lenguaje de
    programación suele haber límites en cuanto a la cantidad de dígitos que
    puede tener un número o su precisión decimal.

  - **Restricciones en los datos:** dependiendo del tipo de los datos, pueden
    ser mutables o inmutables, de tamaño fijo o variable, etc.

  - **La semántica de las instrucciones:** un símbolo usado en un algoritmo
    puede tener otro significado distinto en el programa, o puede que sólo
    pueda usarse en el programa bajo ciertas condiciones que no hace falta
    considerar en el algoritmo.

# Paradigmas de programación

## Definición

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~
**Paradigma de programación**:

Es un **_estilo_** de desarrollar programas, es decir, un **modelo** para
resolver problemas computacionales.
~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Cada paradigma entiende la programación desde una perspectiva diferente,
  partiendo de unos conceptos básicos diferentes y con unas reglas diferentes.

- Cuando diseñamos un algoritmo o escribimos un programa, lo hacemos siguiendo
  un determinado paradigma, y éste impregna por completo la forma en la que
  describimos la solución al problema en el que estamos trabajando.

- No existe un único paradigma de programación y cada uno tiene sus
  peculiaridades que lo hacen diferente.

- Un **lenguaje de programación (o pseudocódigo)** se dice que **_soporta_ un
  determinado paradigma** cuando con dicho lenguaje se pueden escribir
  algoritmos o programas según el «estilo» que impone dicho paradigma.

- Incluso existen **lenguajes _multiparadigma_** capaces de soportar varios
  paradigmas al mismo tiempo.

---

- Los paradigmas de programación más importantes son:

!SALTO

$$\text{Paradigmas} \begin{cases}
\text{Imperativo} \begin{cases}
                    \text{Estructurado} \\
                    \text{Procedimental} \\
                    \text{Orientado a objetos}
                  \end{cases} \\
\\
\text{Declarativo} \begin{cases}
                     \text{Funcional} \\
                     \text{Lógico} \\
                     \text{De bases de datos}
                   \end{cases}
\end{cases}$$

---

!IMG(paradigmas.png)(Principales paradigmas © 2008 Peter Van Roy)(width=100%)(width=97%)

---

- Las diferencias fundamentales entre los paradigmas declarativos e imperativos
  son:

  - **Paradigmas declarativos:**

    - Se centran en las **propiedades y relaciones** que se establecen entre
      los elementos que forman el problema y la solución.

    - Escribir un programa declarativo consiste en describir **qué** forma
      tiene la solución.

  - **Paradigmas imperativos:**

    - Se centran en los **pasos detallados** (secuencia de instrucciones) que
      hay que realizar para obtener la solución.

    - Escribir un programa imperativo consiste en describir **cómo** se debe
      obtener la solución.

---

- Por ejemplo, supongamos que vamos a un restaurante porque queremos una tarta
  de chocolate.

- El enfoque declarativo sería decirle al cocinero: «_quiero una tarta de tres
  chocolates con virutas por encima_».

- En cambio, el enfoque imperativo sería darle al cocinero una lista de
  ingredientes y una receta detallada para que la siga al pie de la letra y
  pueda cocinar la tarta de chocolate que yo quiero.

## Imperativo

- El **paradigma imperativo** está basado en el concepto de **sentencia**. Un
  programa imperativo está formado por una sucesión de sentencias que se
  ejecutan en orden y que llevan a cabo una de estas acciones:

  - **Cambiar el estado** interno del programa, usualmente mediante la
    sentencia de *asignación*.

  - Cambiar el **flujo de control** del programa, haciendo que la ejecución se
    bifurque (*salte*) a otra parte del mismo.

- La ejecución de un programa imperativo, por tanto, consiste en una sucesión
  de cambios de estado controlados por mecanismos de control y que dependen del
  orden en el que se realizan.

- Existen varios paradigmas con las características del paradigma imperativo,
  por lo que podemos decir que **existen varios paradigmas imperativos**.

### Estructurado

- El **paradigma estructurado** es un paradigma imperativo en el que el flujo
  de control del programa se define mediante las denominadas **estructuras de
  control**.

- Se apoya a nivel teórico en los resultados del conocido **teorema de Böhm y
  Jacopini**, que establece que cualquier programa útil se puede escribir
  usando solamente tres estructuras básicas:

  - Secuencia
  - Selección
  - Iteración

- Con estas tres estructuras conseguimos que los programas se puedan leer de
  arriba abajo como compuestos por **bloques anidados o independientes** que se
  leen como un todo conjunto.

- Su aparición llevó asociada la aparición de una **metodología de desarrollo**
  según la cual los programas se escriben por niveles de abstracción mediante
  refinamientos sucesivos y usando en cada nivel sólo las tres estructuras
  básicas.

### Orientado a objetos

- El **paradigma orientado a objetos** se apoya en los conceptos de **objeto**
  y **mensaje**.

- Un programa orientado a objetos está formado por una colección de objetos que
  se intercambian mensajes entre sí.

- Los objetos son entidades que existen dentro del programa y que poseen un
  cierto **estado interno**.

- Cuando un objeto envía un mensaje a otro, el objeto que recibe el mensaje
  reaccionará llevando a cabo alguna acción, que probablemente provocará un
  **cambio en su estado interno** y que, posiblemente, provocará también el
  envío de mensajes a otros objetos.

- La programación orientada a objetos está vista como una forma natural de
  entender la programación y es, con diferencia, **el paradigma más usado en la
  actualidad**.

## Declarativo

- La **programación declarativa** engloba a una familia de paradigmas de
  programación de muy alto nivel.

- En programación declarativa se describe la solución a un problema definiendo
  las **propiedades** que debe cumplir dicha solución en lugar de definir las
  **instrucciones** que se deben ejecutar para resolver el problema.

- Se dice que un programa imperativo describe **cómo** resolver el problema,
  mientras que un programa declarativo describe **qué** forma debe tener la
  solución al problema.

- Para dar forma a la solución, se utilizan formalismos abstractos matemáticos
  y lógicos, lo que da lugar a los dos grandes paradigmas declarativos: la
  **programación funcional** y **la programación lógica**.

### Funcional

- La **programación funcional** es un paradigma de programación declarativa
  basado en el uso de **definiciones**, **expresiones** y **funciones
  matemáticas**.

- Tiene su origen teórico en el **cálculo lambda**, un sistema matemático
  creado en 1930 por Alonzo Church.

- Los lenguajes funcionales se pueden considerar _azúcar sintáctico_ (es decir,
  una forma equivalente pero sintácticamente más sencilla) del cálculo lambda.

- En programación funcional, una función define un cálculo a realizar a partir
  de unos datos de entrada, con la propiedad de que el resultado de la función
  sólo puede depender de esos datos de entrada.

- Eso significa que una función no puede tener estado interno ni su resultado
  puede depender del estado del programa.

---

- Además, una función no puede producir ningún efecto observable fuera de ella
  (los llamados **efectos laterales**), salvo calcular y devolver su resultado.

- Esto quiere decir que en programación funcional no existen los efectos
  laterales, o se dan de forma muy localizada en partes muy concretas e
  imprescindibles del programa.

- Por todo lo expuesto anteriormente, se dice que las funciones en programación
  funcional son **funciones puras**.

- En consecuencia, es posible sustituir cualquier expresión por su valor,
  propiedad que se denomina **transparencia referencial**.

- La programación funcional es un paradigma cada vez más utilizado, y hasta los
  lenguajes que no son funcionales están incorporando características propias
  de este paradigma.

- Esto se debe a que demostrar la corrección de un programa funcional o
  paralelizar su ejecución es **mucho más fácil** que con un programa
  imperativo.

### Lógico

- La **programación lógica** es un paradigma de programación declarativa
  que usa la **lógica matemática** como lenguaje de programación.

- Básicamente, un programa lógico es una colección de definiciones que forman
  un conjunto de **axiomas** en un sistema de **deducción lógica**.

- Ejecutar un programa lógico equivale a poner en marcha un mecanismo deductivo
  que trata de **demostrar un teorema** a partir de los axiomas.

- Se usa principalmente en **inteligencia artificial**, en **demostración
  automática** y en **procesamiento del lenguaje natural**.

- El más conocido de los lenguajes de programación lógica es **Prolog**.

### De bases de datos

- Los sistemas de gestión de bases de datos relacionales (SGBDR) disponen de un
  lenguaje que permite al usuario consultar y manipular la información
  almacenada.

- A esos lenguajes se los denomina **lenguajes de bases de datos** o
  **lenguajes de consulta**.

- El lenguaje de consulta más conocido es el **SQL**.

- Los SGBDR se basan en el *modelo relacional*, que es un modelo matemático.

- SQL es, básicamente, una implementación del **álgebra relacional**.

- Los lenguajes de consulta se consideran lenguajes declarativos porque con
  ellos el usuario indica *qué* desea obtener (qué propiedades debe cumplir la
  solución) y el SGBDR determina automáticamente el mejor camino para alcanzar
  dicho objetivo.

<!--

---

!QUIZ
~~~~~~~~~~~~~~~~~~~~~~~
{
   "info": {
      "name": "",
      "main": ""
   },
   "questions": [
      {
         "q": "El paradigma funcional es un paradigma...",
         "a": [
            {"option": "Imperativo",  "correct": false},
            {"option": "Declarativo", "correct": true}
         ],
         "correct": "El paradigma funcional es un paradigma declarativo de gran auge hoy en día.",
         "incorrect": "El paradigma funcional <em>NO</em> es un paradigma imperativo."
      },
      {
         "q": "Entre los paradigmas imperativos tenemos...",
         "a": [
            {"option": "El paradigma de bases de datos",  "correct": false},
            {"option": "El paradigma lógico", "correct": false},
            {"option": "El paradigma orientado a objetos", "correct": true}
         ],
         "correct": "El paradigma orientado a objetos es un paradigma imperativo porque los objetos cambian su estado al enviarse mensajes entre ellos.",
         "incorrect": "No es correcto."
      }
   ]
}
~~~~~~~~~~~~~~~~~~~~~~~

-->

!EJERCICIOS

@. ¿Qué paradigmas de programación soportan los lenguajes Python y Java?

@. ¿Hay más paradigmas de programación? Busca en Internet un par de ejemplos de
paradigmas que no se hayan nombrado aquí. Para cada uno, describe en una sola
frase sus características básicas.

# Resolución de problemas mediante programación

## Introducción

- El proceso de resolución de un problema con un ordenador pasa por escribir y
  ejecutar un programa.

- Aunque diseñar programas es, esencialmente, un proceso creativo, se puede
  considerar una serie de fases o pasos comunes, que generalmente deben seguir
  todos los programadores.

- Si bien se han ordenado según un esquema lógico, hay que considerar que
  algunos de esos pasos se repiten a lo largo del desarrollo del programa
  siguiendo un esquema iterativo e incremental, y otros (como la documentación)
  se deben realizar continuamente a lo largo de todo el proceso y no sólo al
  final como un paso más del mismo.

---

- Los pasos para la resolución de un problema mediante programación son los
  siguientes:

  #. Especificación.

  #. Análisis del problema.

  #. Diseño del algoritmo.

  #. Verificación.

  #. Estudio de la eficiencia.

  #. Codificación.

  #. Traducción y ejecución.

  #. Pruebas.

  #. Depuración.

  #. Documentación.

  #. Mantenimiento.

## Especificación

- La **especificación de un _problema_** describe **qué** problema hay que
  resolver sin entrar a detallar **cómo** hay que resolverlo.

- La **especificación de un _programa_** describe **qué** tiene que hacer el
  programa para resolver un problema sin detallar aún **cómo** va a resolverlo.

- En esta fase, se ve al programa como una **caja negra** de la que se sabe
  _qué_ debe hacer pero aún no sabemos _cómo_ va a hacerlo.

---

- La especificación define con precisión (cuanto más formal mejor):

  - Cuál es la **entrada requerida**:

    - Qué datos de entrada se necesitan y qué propiedades deben cumplir.

    - Con esto se determina el **dominio de definición** del problema, es
      decir, el conjunto de sus ejemplares.

  - Cuál es la **salida deseada**:

    - Básicamente, es el resultado que se desea obtener como solución al
      problema.

    - Normalmente se describe en función de los datos de entrada.

!EJEMPLO

- Se desea determinar el máximo de dos números enteros.

  - *Entrada*: los dos números enteros (llamémosles $n_1$ y $n_2$).

  - *Salida*: el mayor de los dos números.

- Se representaría esquemáticamente así:

  $$\begin{cases}
    \text{\textbf{Entrada}}: n_1, n_2 \in \mathbb{Z} \\
    \text{\textit{Máximo}} \\
    \text{\textbf{Salida}}: \text{el mayor de ambos}
  \end{cases}$$

- En las especificaciones está permitido usar operaciones (funciones, por
  ejemplo) siempre y cuando estén perfectamente especificadas, aunque no estén
  implementadas en el lenguaje de programación.

- A esas operaciones se las denomina **operaciones auxiliares**.

---

- Por ejemplo, si disponemos de la función auxiliar $max$ que devuelve el
  máximo de dos números, nuestra especificación podría quedar así:

  $$\begin{cases}
    \text{\textbf{Entrada}}: n_1, n_2 \in \mathbb{Z} \\
    \text{\textit{Máximo}} \\
    \text{\textbf{Salida}}: max(n_1, n_2)
  \end{cases}$$

- Con esta especificación estamos describiendo que, si se reciben como datos de
  entrada dos números enteros cualesquiera, el programa *Máximo* calculará y
  devolverá a la salida el mayor de ellos.

- Si los datos de entrada no satisfacen los requisitos necesarios, el programa
  tiene derecho a responder de cualquier manera, o a no responder en absoluto.

## Análisis del problema

- A partir de la especificación, se estudia detalladamente el problema a
  resolver, los requisitos que se deben cumplir y las posibles restricciones
  que pueda tener la solución.

- En el ejemplo anterior:

  - Hay que comparar el valor de los dos números y devolver el mayor de ellos.
  - Si los dos números son iguales, se puede devolver cualquiera de los dos.

## Diseño del algoritmo

- Una vez analizado el problema con detalle, se diseña un algoritmo que lo
  resuelva, cumpliendo con todas las posibles restricciones y satisfaciendo la
  especificación del problema.

- El algoritmo se representa con cualquier herramienta adecuada para ello
  (ordinogramas, pseudocódigo, etc.) la cual depende del paradigma utilizado.

- El paradigma usado para describir el algoritmo debería ir acorde con el
  paradigma del lenguaje de programación que se usará luego para codificar el
  algoritmo en forma de programa.

  Por ejemplo, se podría usar un ordinograma para representar un algoritmo
  imperativo pero no es apropiado para uno funcional.

- Igualmente, hay distintos pseudocódigos y cada uno sigue un determinado
  paradigma y posee un determinado juego de instrucciones válidas, por lo que
  ciertos pseudocódigos serán más apropiados que otros para ser traducidos
  luego a un determinado lenguaje de programación.

---

- Por ejemplo, un algoritmo descrito en pseudocódigo siguiendo un estilo
  estructurado podría ser:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Algoritmo:** Cálculo del máximo de dos números
  **Entrada:** $n_1, n_2 \in \mathbb{Z}$
  **Salida:** el mayor de ambos

  **inicio**
  !SPC(6)    **si** $n_1 > n_2$ **entonces**
  !SPC(12)        **devolver** $n_1$
  !SPC(6)    **sino**
  !SPC(12)        **devolver** $n_2$
  **fin**
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto, este algoritmo, así representado, sería muy apropiado para
  traducirlo luego a un programa escrito en un lenguaje estructurado (como
  Python o Java), pero no tanto para traducirlo a un lenguaje funcional como
  Haskell.

## Verificación

- Es el proceso por el cual se intenta **demostrar** que el algoritmo diseñado
  es **correcto**.

- Un algoritmo es correcto cuando **satisface su especificación**.

- Es un proceso basado en las matemáticas y la lógica, y consiste en considerar
  que el algoritmo es un **teorema** a demostrar en un sistema deductivo lógico
  en el que hay *axiomas* y *reglas de inferencia*.

- Puede resultar muy difícil incluso en casos sencillos.

- En la práctica, su uso se reduce a bloques pequeños y críticos del programa.

## Estudio de la eficiencia

- Cuando disponemos de un algoritmo correcto que resuelve el problema, podemos
  optar por estudiar la eficiencia del mismo (es decir, la cantidad de recursos
  que consume).

- Si el algoritmo es correcto pero ineficiente, no suele resultar práctico, y
  se debe optar por diseñar otro algoritmo más eficiente.

- Los algoritmos ineficientes sólo resultan útiles cuando el tamaño del
  problema es relativamente pequeño.

- Hay que tener en cuenta que existen problemas para los que no se conoce
  ningún algoritmo eficiente.

---

- También puede resultar muy interesante estudiar la eficiencia cuando tenemos
  varios algoritmos que resuelven el mismo problema y queremos determinar cuál
  de ellos es _mejor_.

- En ese sentido, la eficiencia sería un criterio (entre otros) a la hora de
  comparar algoritmos para determinar si un algoritmo es mejor que otro.

- Otros criterios importantes son la claridad, la elegancia o la reusabilidad.

- Es importante recordar que hay una regla no escrita que dice que un algoritmo
  más eficiente suele ser menos claro o elegante, y viceversa.

## Codificación

- Una vez diseñado y verificado, **el algoritmo se codifica en un lenguaje de
  programación** usando un editor de textos o un IDE (*Entorno Integrado de
  Desarrollo*).

- Se considera una tarea casi mecanizable, pero aún hay decisiones que pueden
  influir a la hora de codificar un programa y que sólo puede tomar un
  programador experimentado.

- El lenguaje de programación utilizado es una decisión de diseño que hay que
  justificar.

- En teoría, el diseño del algoritmo debería ser independiente del lenguaje de
  programación en el que se vaya a codificar posteriormente el programa, pero
  el *estilo* (paradigma) utilizado influye mucho.

- Por tanto, en la práctica se procura que el algoritmo esté escrito en el
  mismo paradigma que sigue el lenguaje de programación que se va a usar para
  codificar el programa.

---

- Por otra parte, el lenguaje de programación o la arquitectura hardware donde
  se va a ejecutar el programa pueden incorporar **restricciones o
  condiciones** que hasta ahora no se habían tenido en cuenta al diseñar el
  algoritmo.

- Por ejemplo, es muy común que los lenguajes de programación impongan un
  tamaño máximo de almacenamiento de los datos que maneja.

- En el caso del problema de sumar dos números enteros, eso significa que el
  programa podría no admitir números demasiado grandes, lo que habría que
  tenerlo en cuenta a la hora de escribir el programa.

- Ese detalle no lo consideramos al diseñar el algoritmo, ya que **los
  algoritmos son _ideales_ y se representan con herramientas _ideales_** (los
  pseudocódigos).

---

- Un programador experimentado podría saltarse el paso de representar el
  algoritmo usando pseudocódigo y podría pasar directamente a escribir el
  correspondiente programa en un lenguaje de programación.

- En el pasado, los lenguajes de programación eran poco expresivos y poco ricos
  en tipos de instrucciones y estructuras de datos, lo que hacía que traducir
  un algoritmo escrito en pseudocódigo a un programa resultara una trabajo más
  costoso y menos directo.

- Asimismo, el programa resultante era mucho menos claro y difícil de entender
  que su algoritmo equivalente escrito en pseudocódigo.

- Hoy día existen lenguajes de programación de alto nivel muy expresivos y con
  una sintaxis muy clara y legible que funcionan casi como «pseudocódigos
  directamente interpretables por el ordenador».

- Python, por ejemplo, se considera un ejemplo de este tipo de lenguajes.

---

- Codificación del algoritmo anterior en lenguaje Python:

  ```python
  def maximo(n1, n2):
      """Calcula el máximo de dos números enteros."""
      if n1 > n2:
          return n1
      else:
          return n2
  ```

  !SALTO

- Codificación en lenguaje Java:

  ```java
  /*
   * Calcula el máximo de dos números enteros.
   */
  public static int maximo(int n1, int n2) {
      if (n1 > n2) {
          return n1;
      } else {
          return n2;
      }
  }
  ```

---

- Codificación en lenguaje Haskell:

  ```haskell
  -- Calcula el máximo de dos números enteros.
  max :: (Ord a) => a -> a -> a
  max a b
      | a > b     = a
      | otherwise = b
  ```

  !SALTO

- Codificación en lenguaje Scheme:

  ```scheme
  ; Calcula el máximo de dos números enteros.
  (define (maximo n1 n2)
    (cond ((> n1 n2) n1)
          (else n2)))
  ```

### Implementación

- El concepto de **implementación** es muy importante en Programación.

- Está muy relacionado con los conceptos de _especificación_, _diseño_ y
  _codificación_.

- En esencia:

  - La _especificación_ describe _qué_ hay que hacer.

  - La _implementación_, en cambio, describe _cómo_ hay que hacerlo.

- Cuando lo que se está especificando es un _programa_ (es decir, cuando la
  especificación describe lo que tiene que hacer un programa), la
  _implementación_ es el _algoritmo_ o _programa_ que hace lo que la
  especificación dice que hay que hacer.

---

- En ese sentido, _implementar_ puede verse como sinónimo de _realizar_,
  _diseñar_ o _codificar_.

- Por tanto, _programar_ consiste en: primero, _especificar_ y después
  _implementar_.

- En ese sentido, la implementación va asociada siempre a una especificación,
  ya que debe satisfacer a ésta.

- Decimos que **una implementación _satisface_ a una especificación** cuando
  dicha implementación hace lo que exige esa especificación, es decir, cuando
  la implementación proporciona la salida deseada a partir de los datos de
  entrada requeridos.

  Recordemos que los datos de entrada y la salida deseada vienen descritos en
  la especificación.

---

- En Programación podemos implementar algoritmos o programas (y también otras
  cosas que ya veremos posteriormente).

- «_Implementar un algoritmo_» e «_implementar un programa_» son expresiones
  que a veces se suelen usar indistintamente, ya que tienen un significado
  similar o casi idéntico.

- Por ejemplo, podemos decir que «implementamos un algoritmo» cuando diseñamos
  un algoritmo a partir de una especificación y lo representamos usando una
  herramienta apropiada (pseudocódigo, diagramas, etc.). En este caso, se está
  usando «implementar» como sinónimo de «diseñar un algoritmo».

- Pero también podemos decir que «implementamos un algoritmo» cuando ya tenemos
  un algoritmo y lo codificamos en un determinado lenguaje de programación,
  creando así un programa. En este caso, se está usando «implementar» como
  sinónimo de «codificar».

- Y también podemos decir que «implementamos un programa» cuando el producto
  resultante es un programa, ya sea a partir de una especificación o de un
  algoritmo ya diseñado a partir de esa especificación.

---

- Por tanto, «implementar» es el acto de crear algo a partir de una
  especificación. El producto resultante (la implementación) puede ser un
  algoritmo, un programa o más cosas que ya veremos en su momento.

- Puede haber varias implementaciones (algoritmos) que satisfagan la misma
  especificación.

- Asimismo, puede haber varias implementaciones (programas) del mismo
  algoritmo.

- Separar el _qué_ hace (la _especificación_) del _cómo_ lo hace (la
  _implementación_) es una de las tareas más importantes del buen programador.

- Esta separación es útil tanto si se trata de especificar grandes programas o
  sistemas como si se trata de pequeñas piezas de software que puedan usarse
  como partes de un programa más grande.

---

- Llamaremos **usuario** de un software al entorno externo del software
  especificado, es decir, a los posibles usuarios humanos o a los posibles
  programas que podrían utilizar los servicios del software especificado y que,
  en principio, están interesados en saber _qué_ hace el programa, pero no
  _cómo_ lo hace.

- La especificación de un software tiene un doble destinatario:

  - Los _usuarios_ del software. En este sentido, debe recoger todo lo
    necesario para poder usarlo conrrectamente.

  - El _implementador_ del software. En este sentido, describe los requisitos
    que cualquier implementación válida debe satisfacer; es decir, las
    obligaciones del implementador. Ha de dejar suficiente libertad para que
    éste pueda escoger la implementación que estime más adecuada con los
    recursos disponibles. Por eso, la especificación no debería entrar en
    detalles de _cómo_ se debe implementar el software, ya que entonces el
    implementador tendría menos libertad crear su implementación.

- La especificación actúa, por tanto, como una _barrera_ y como un _contrato_
  entre los usuarios y el implementador.

## Traducción y ejecución

- Una vez escrito el programa, se procede a su ejecución. Para ello:

  - Si el lenguaje es **compilado**: se compila, se genera el código objeto y
    se ejecuta éste.

  - Si el lenguaje es **interpretado**: se ejecuta el código fuente
    directamente por medio del intérprete del lenguaje.

- Si durante la compilación (o ejecución, en el caso de un lenguaje
  interpretado) el traductor muestra **errores en el programa fuente**, hay que
  volver a editar el programa, corregir los errores e intentar de nuevo.

- Los errores que un traductor puede detectar son, principalmente:

  - Errores **sintácticos** (por ejemplo, falta o sobra un paréntesis).

  - Errores **de semántica estática** (por ejemplo, se intenta sumar una cadena
    a un número, detectable mediante un **chequeo de tipos**).

!EJERCICIO

@. Desde el punto de vista de la detección de errores sintácticos o de
semántica estática, ¿qué resulta más interesante: un compilador o un
intérprete? Razona la respuesta.

## Pruebas

- Para determinar que el programa funciona correctamente, se determina una
  **batería de pruebas** que debe superar el mismo para concluir que se
  comporta como debe.

- Esas baterías de prueba (o **casos de prueba**) consisten en una serie de
  **datos de entrada** con los que se estimula al programa, emparejados a una
  serie de **resultados esperables** que se comparan con los resultados reales
  que el programa genera a partir de los datos de entrada.

- Si los resultados obtenidos coinciden con los esperables, se concluye que el
  programa está funcionando **correctamente**.

- En caso contrario, decimos que el programa **falla** y debemos localizar el
  error (o errores) que provocan el mal funcionamiento.

---

- **Las pruebas pueden detectar la presencia de errores, pero nunca pueden
  garantizar la ausencia de los mismos.**

- La verificación formal es la única forma de garantizar la ausencia de errores
  en un programa.

- Entonces, ¿por qué hacemos pruebas?

  - Para comprobar que no se han *colado* errores al codificar el algoritmo
    (aunque hayamos verificado la corrección del algoritmo, se nos puede haber
    colado un error al codificarlo en el programa).

  - A veces, simplemente, no verificamos, y lo único que tenemos son las
    pruebas.

  - También es importante comprobar la **eficiencia** del programa con
    ejecuciones *reales*.

## Depuración

- La **depuración** es el proceso de **encontrar** los errores del programa y
  **corregir** o eliminar dichos errores.

- En caso de ser **errores sintácticos o de semántica estática**, el traductor
  facilita mucho la tarea de localizar la posición concreta del mismo en el
  programa fuente, gracias a los **mensajes de error** que genera durante la
  compilación o interpretación del programa.

- Si tenemos un **error lógico** (un error en la lógica del programa que
  provoca que éste produzca resultados incorrectos), normalmente resulta más
  difícil de localizar.

- A esos errores lógicos también se les denomina **_bugs_** («bichos», en
  inglés). Por eso, el proceso de depuración se denomina **_debug_** o
  _debugging_ en inglés.

## Documentación

- La documentación es el proceso por el cual incorporamos al código fuente del
  programa de toda la información que pueda ayudar en la comprensión y el
  mantenimiento del mismo.

- La documentación de un programa puede ser interna o externa:

  - La **documentación interna** forma parte del código fuente del programa y
    se refiere al uso de **comentarios**, identificadores descriptivos,
    indentación, **reglas de estilo**, etc. Todo orientado a ayudar a entender
    el código cuando lo lea un humano.

  - La **documentación externa** va fuera del código fuente e incluye análisis,
    diagramas de flujo y/o pseudocódigos, manuales de usuario con instrucciones
    para ejecutar el programa y para interpretar los resultados.

## Mantenimiento

- La vida útil de un programa rara vez termina cuando se ha acabado de
  programar y los usuarios comienzan a usarlo, sino que a partir de ese momento
  comienza una de las etapas más importantes y probablemente más costosas en
  tiempo y esfuerzo: el **mantenimiento**.

- Mantener un programa consiste en realizar acciones encaminadas a:

  - Corregir los fallos que puedan aparecer como consecuencia del uso del
    programa (fallos que no se localizaron previamente en la fase de pruebas).

  - Adaptar el programa a nuevas condiciones de utilización (nuevos sistemas
    operativos, nuevas plataformas *hardware*...)

  - Mejorar el programa incorporando nuevas funcionalidades.

- Para ello, es fundamental que el programa esté correctamente documentado.

## Ingeniería del software

- En los años 60, los problemas a resolver son cada vez más complejos y los
  ordenadores son cada vez más potentes pero los programadores son incapaces de
  escribir programas que aprovechen esa potencia y que sean fiables.

- Además resulta difícil estimar el presupuesto y el tiempo necesarios para
  desarrollar programas.

- En 1968, Fiedrich Bauer habla por primera vez de la **crisis del software**
  en la primera Conferencia sobre Ingeniería del Software de la OTAN en Garmish
  (Alemania).

- Se llega a la conclusión de que no basta con tener mejores herramientas
  (lenguajes), sino que hay que dar un enfoque más industrial y sistemático al
  desarrollo de software.

- Aparece la **ingeniería del software** como disciplina.

---

- La ingeniería del software no considera a la programación como una disciplina
  científica o como un arte, sino como un proceso sistemático que va más allá
  de escribir código.

- Cuando el programa a desarrollar es grande, escribir código es sólo una de
  las tareas que hay que realizar. También hay que:

  - Realizar un análisis del sistema.

  - Estimar y planificar el tiempo y el esfuerzo necesarios para desarrollar la
    solución.

  - Aplicar procedimientos estandarizados.

  - Elaborar documentación.

  - Medir la calidad del producto resultante.

- El desarrollo de software complejo requiere pasar por varias etapas que,
  juntas, forman lo que se llama el **ciclo de vida** del software.

!FIN
