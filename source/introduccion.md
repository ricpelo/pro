---
title: Introducción
author: Ricardo Pérez López
!DATE
---

# Conceptos básicos

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

!DOT(esquema-basico.svg)(Esquema básico de un ordenador)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

!DOT(ciclo-instruccion.svg)(Ciclo de instrucción)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = TB, splines = ortho];
Fetch -> Decode -> Execute -> Fetch[constraint = false];
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Representación de información


##### Codificación interna


###### Sistema binario


##### Codificación externa


###### ASCII


###### Unicode


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

!DOT(resolucion-problema.svg)(Resolución de un problema)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Problema" -> "Diseño de algoritmo" -> "Programa informático"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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


