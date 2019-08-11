---
title: Introducción
author: Ricardo Pérez López
!DATE
nocite: |
  @joyanes_aguilar_fundamentos_2008
---

# Conceptos básicos

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

## Informática

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Informática**:

  La ciencia que estudia los sistemas de tratamiento automático de la
  información, también llamados **sistemas informáticos**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Estos sistemas están formados por:

  - elementos físicos (**hardware**)
  - elementos lógicos (**software**) y
  - elementos humanos (profesionales y usuarios).

- El *hardware*, a su vez, está formado por componentes:

  - Ordenadores
  - Soportes de almacenamiento
  - Redes de comunicaciones
  - ...

### Procesamiento automático

- El procesamiento automático de la información siempre tiene el mismo
  esquema de funcionamiento:

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

- La **Programación** es la ciencia y el arte de diseñar dichos programas.

## Ordenador

### Definición

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Ordenador**:

Un ordenador es una máquina que procesa información automáticamente de
acuerdo con un programa almacenado.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  #. Es una *máquina*.

  #. Su función es *procesar información*.

  #. El procesamiento se realiza de forma *automática*.

  #. El procesamiento se realiza siguiendo un *programa* (*software*).

  #. Este programa está *almacenado* en una memoria interna del mismo ordenador
     (arquitectura de **Von Neumann**).

### Funcionamiento básico

#### Elementos funcionales

- Un ordenador consta de tres componentes principales:

  #. **Unidad central de proceso (CPU) o procesador**

     - *Unidad aritmético-lógica (ALU)*

     - *Unidad de control (UC)*

  #. **Memoria**

     - *Memoria principal* o central

       - *Memoria de acceso aleatorio (RAM)*

       - *Memoria de sólo lectura (ROM)*

     - *Memoria secundaria* o externa

  #. **Dispositivos de E/S**

     - *Dispositivos de entrada*

     - *Dispositivos de salida*

---

#### Unidad central de proceso (CPU) o procesador

- **Unidad aritmético-lógica (ALU)**:

  Realiza los cálculos y el procesamiento numérico y lógico.

- **Unidad de control (UC)**:

  Ejecuta de las instrucciones enviando las señales a las distintas unidades
  funcionales involucradas.

---

#### Memoria

- **Memoria principal** o central:

  Almacena los datos y los programas que los manipulan.

  Ambos (datos y programas) deben estar en la memoria principal para que la CPU
  pueda acceder a ellos.

  Dos tipos:

  - **Memoria de acceso aleatorio (RAM)**:

    Su contenido se borra al apagar el ordenador.

  - **Memoria de sólo lectura (ROM)**:
   
    Información permanente (ni se borra ni se puede cambiar).

    Contiene la información esencial (datos y software) para que el ordenador
    pueda arrancar.

- **Memoria secundaria** o externa:

  La información no se pierde al apagar el ordenador.

  Más lenta que la memoria principal, pero de mucha más capacidad.

---

####  Dispositivos de E/S

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
MS [label ="Memoria\nsecundaria"];
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

- Al finalizar el programa, los datos de salida se volcarán hacia los
  dispositivos de salida.

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
  informático, asociando a cada dato (elemental o estructurado) uno o más
  valores numéricos.
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

!DOT(codificaciones)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
E [label = "Exterior", shape = oval];
S [label = "Sistema\ninformático\n\n(Codificación interna)"];

S -> E [dir = both, label = "Código de E/S"];
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

- Generalmente, los números naturales se codifican internamente mediante su
  representación en binario.

- Los números enteros se suelen codificar mediante:

  - Bit de signo (signo y magnitud)

  - Complemento a uno

  - Complemento a dos

- Los números reales se pueden codificar mediante:

  - Coma fija

  - Coma flotante

    - Simple precisión

    - Doble precisión

  - Decimal codificado en binario (BCD)

#### Codificación externa


#### ASCII


#### Unicode


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

!DOT(resolucion-problema.svg)(Resolución de un problema)(!WIDTH)(width=80%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Problema" -> "Diseño de algoritmo" -> "Programa informático"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Características

- Un algoritmo debe ser:

  - **Preciso**: debe indicar el orden de ejecución de cada paso.

  - **Definido**: si se sigue un algoritmo dos veces, se debe obtener el mismo
    resultado cada vez.

  - **Finito**: debe terminar en algún momento, es decir, debe tener un número
    finito de pasos.

### Representación


#### Ordinograma


#### Pseudocódigo


### Cualidades deseables


### Computabilidad


### Corrección


### Complejidad


## Programa


## Lenguaje de programación


# Evolución histórica


## Culturas de la programación


## Ingeniería del software


# Resolución de problemas mediante programación


## Análisis del problema


## Especificación


## Diseño del algoritmo


## Codificación del algoritmo en forma de programa


# Paradigmas de programación


## Imperativo


### Estructurado


### Orientado a objetos


## Declarativo


### Funcional


### Lógico


# Lenguajes de programación


## Definición


### Sintaxis


#### Notación EBNF


### Semántica


## Evolución histórica


## Clasificación


### Por nivel


### Por generación


### Por paradigma


# Traductores


## Compiladores


## Intérpretes


### Interactivos (*REPL*)


### Por lotes


# Entornos integrados de desarrollo


## Terminal


### `Zsh`


### Oh My Zsh


### `less`


## Editores de texto


### Editores vs. IDE


### Vim y less


### Visual Studio Code


#### Instalación


#### Configuración


#### Extensiones

!RESPUESTAS

!BIBLIOGRAFIA
