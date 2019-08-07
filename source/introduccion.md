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
  - Redes de comunicaciones
  - Soportes de almacenamiento
  - ...

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

#. El procesamiento se realiza siguiendo un *programa*.

#. Este programa está *almacenado* en una memoria interna del mismo ordenador
   (arquitectura de **Von Neumann**).

### Funcionamiento básico

!DOT(esquema-basico.svg)(Esquema básico de un ordenador)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
graph [rankdir = LR, splines = ortho];
node [shape = box];
compound = true;

ALU [label = "Unidad Aritmético-Lógica\n(ALU)"];
UC [label = "Unidad de Control\n(UC)"];
M [label = "Memoria\nprincipal"];
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
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#### Elementos funcionales

- Un ordenador consta de tres componentes principales:

  - **Dispositivos de E/S**

    - Dispositivos de entrada

    - Dispositivos de salida

  - **Unidad central de proceso (CPU) o procesador**

    - Unidad aritmético-lógica (ALU)

    - Unidad de control (UC)

  - **Memoria**

    - Memoria principal o central

      - RAM

      - ROM

    - Memoria secundaria o externa

#### Ciclo de instrucción


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


