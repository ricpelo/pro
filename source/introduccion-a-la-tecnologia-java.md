---
title: Introducción a la tecnología Java
author: Ricardo Pérez López
!DATE
nocite: |
  @gosling_java_2014
---

# Introducción

## Historia

:::: columns

::: {.column width=60%}

- Java es un lenguaje creado en 1995 por James Gosling en la empresa Sun
  Microsystems.

- La versión 1.0 se publicó en enero de 1996.

- Desde 2002, la evolución del lenguaje ha sido regulada por el JCP (_Java
  Community Process_).

:::

::: {.column width=40%}

!IMGP(java.png)(Logo de Java)(width=40%)(width=10%)

:::

::::

- El 13 de noviembre de 2006, Sun publicó gran parte de la tecnología Java como
  software libre, bajo los términos de la Licencia Pública General GNU (GPL).

- En 2010, Oracle Corporation compra Sun Microsystems, por lo que Java pasa a
  formar parte de Oracle.

## Versiones

:::: columns

::: {.column width=49%}

Versión	     Publicación
-----------  -----------------
JDK Beta     1995
JDK1.0       23-ene-1996
JDK 1.1      19-feb-1997
J2SE 1.2     8-dic-1998
J2SE 1.3     8-may-2000
J2SE 1.4     6-feb-2002
J2SE 5.0     30-sep-2004
Java SE 6    11-dic-2006
Java SE 7    28-jul-2011

:::

::: {.column width=2%}

:::

::: {.column width=49%}

Versión	     Publicación
-----------  -----------------
Java SE 8    18-mar-2014
Java SE 9    21-sep-2017
Java SE 10   20-mar-2018
Java SE 11   25-sep-2018
Java SE 12   19-mar-2019
Java SE 13   17-sep-2019
Java SE 14   17-mar-2020
Java SE 15   15-sep-2020

:::

::::

## Características principales

- Los cinco objetivos principales que se plantearon al diseñar el lenguaje
  Java, y que a día de hoy siguen siendo sus características principales, son:

  - Debe ser sencillo, orientado a objetos y basado en una sintaxis conocida.

  - Debe ser robusto y seguro.

  - Debe ser portable e independiente de la arquitectura, permitiendo la
    ejecución de un mismo programa en varios sistemas operativos.

  - Debe ejecutarse con gran rendimiento.

  - Debe ser interpretado, multihilo y de enlace dinámico.

# La tecnología Java

## Máquinas reales vs. virtuales

- Una **máquina abstracta** es una máquina diseñada independientemente de una
  determinada tecnología de fabricación.

  Su finalidad no es la de ser construida, sino servir como **modelo de
  computación teórica**.

- Una **máquina virtual** es una máquina emulada mediante hardware o software.

  Las máquinas virtuales pueden ser emulaciones de máquinas reales o
  abstractas.

## Código objeto (*bytecode*!ifdef(HTML)(&nbsp;)())

- El compilador de Java traduce el código fuente (archivos con extensión
  `.java`) en código objeto (código binario almacenado en archivos con
  extensión `.class`) para una máquina virtual llamada **_Java Virtual Machine_
  (JVM)**.

- Al código objeto generado por el compilador de Java se le denomina
  **_bytecode_**.

- Por tanto, el _bytecode_ es el lenguaje máquina al que compila el compilador
  de Java y es, además, el único lenguaje que entiende la JVM.

!DOT(compilacion-java.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = <Código fuente<br/>(lenguaje Java)<br/><br/><font face="monospace" point-size="11">archivo.java</font>>, shape = note, fillcolor = aliceblue];
O [label = <Código objeto<br/>(<i>bytecode</i>)<br/><br/><font face="monospace" point-size="11">clase1.class<br/>clase2.class<br/>...</font>>, shape = note, fillcolor = aliceblue];
F -> "Compilador Java" -> O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## La plataforma Java

- La **plataforma Java** es el nombre de una plataforma de desarrollo y
  ejecución de programas que se compone de un amplio abanico de tecnologías:

  - La **especificación** de:

    - El **lenguaje de programación** Java.
    - La **biblioteca estándar** de Java.
    - La **máquina virtual** de Java (**_Java Virtual Machine_ (JVM)**).

  - La **implementación**, que se reparte en:

    - El **_Java Runtime Environment_ (JRE)**: implementa la JVM y la
      biblioteca estándar.
    - El **_Java Development Kit_ (JDK)**: implementa las **herramientas de
      desarrollo** y el lenguaje Java.

- Para poder desarrollar y ejecutar programas Java, necesitamos una
  implementación de la plataforma Java que funcione en nuestro sistema
  operativo y nuestra arquitectura hardware. 

---

- Existen **cuatro _ediciones_ distintas** de la plataforma Java (cuatro
  «plataformas Java»), centradas en diferentes entornos de aplicaciones y
  segmentando mucha de sus API.

- Las plataformas son:

  - **Java Card**: para tarjetas inteligentes.

  - **Java Platform, Micro Edition (Java ME)**: para entornos con recursos
    limitados.

  - **Java Platform, Standard Edition (Java SE)**: para entornos de estaciones
    de trabajo.

  - **Java Platform, Enterprise Edition (Java EE)**: para grandes empresas o
    entornos de Internet.

### La máquina virtual de Java (JVM)

- La **máquina virtual de Java** (del inglés, _Java Virtual Machine_ o **JVM**)
  es una máquina virtual capaz de interpretar y ejecutar instrucciones
  expresadas en un código binario especial llamado _bytecode_, el cual es
  generado por el compilador del lenguaje Java, entre otros.

- El _bytecode_ de Java no es un lenguaje de alto nivel, sino un verdadero
  **código máquina de bajo nivel**, viable incluso como lenguaje de entrada
  para un microprocesador físico. 

- La gran ventaja de usar la JVM es la **portabilidad**, de manera que se han
  creado diferentes implementaciones de la misma máquina virtual para
  diferentes arquitecturas, y, así, un código objeto (archivo `.class`) puede
  ser ejecutado en cualquier sistema operativo y arquitectura hardware que
  disponga de una implementación de la máquina virtual.

---

- La regla máxima del diseño de Java es:

«Escríbelo una vez, ejecútalo en cualquier parte.»

«_Write once, run anywhere_.»

---

- La JVM puede estar implementada en software, hardware, una herramienta de
  desarrollo o un navegador web.

- Lee y ejecuta código _bytecode_ independiente de la plataforma en la que está
  implementada la JVM.

- La JVM proporciona definiciones para un conjunto de instrucciones, un
  conjunto de registros, un formato para archivos de clases, la pila, un
  montículo con recolector de basura y un área de memoria.

- La definición detallada de la JVM está especificada mediante un estándar.

- Por tanto, toda implementación de la JVM debe cumplir con la especificación.

### La API de Java

- Una **API (_Application Programming Interface_)** define un conjunto de
  funcionalidades recogidas en funciones y/o métodos que ofrece una determinada
  biblioteca para ser utilizado como una capa de abstracción por otro software
  o por el programador de un lenguaje.

- Los sistemas operativos ofrecen servicios para simplificar la tarea de
  programación.

  Esos servicios se ofrecen en forma de un conjunto de _bibliotecas dinámicas_
  que las aplicaciones pueden llamar cuando lo necesiten.

- Como la plataforma Java está pensada para ser independiente del sistema
  operativo subyacente, las aplicaciones no pueden apoyarse en servicios
  ofrecidos por cada sistema en concreto.

- Por tanto, lo que hace la plataforma Java es ofrecer una **biblioteca
  estándar** que contiene mucha de las funciones disponibles en los sistemas
  operativos actuales.

---

- Esa biblioteca es accesible desde Java a través de la API de Java. 

- Por tanto, **la API de Java especifica el contenido de esa biblioteca**, que
  ofrece sus servicios en forma de **clases** y otros elementos relacionados
  (como _interfaces_).

- La documentación del API de la versión 14 de la plataforma _Java Standard
  Edition_ (Java SE) se encuentra bajo la siguiente dirección:

[https://docs.oracle.com/en/java/javase/14/docs/api/index.html](https://docs.oracle.com/en/java/javase/14/docs/api/index.html){target="\_blank"}

- Allí podemos comprobar que el API de Java SE está dividido en _módulos_, que
  a su vez se dividen en _paquetes_, que a su vez se dividen en _clases_ e
  _interfaces_.

- Es fundamental tener siempre a mano la documentación de la API para poder
  programar con agilidad en este lenguaje.

---

- La **biblioteca de Java** tienen **tres funciones principales** dentro de la
  plataforma Java:

  - Ofrecen al programador un conjunto bien definido de funciones para realizar
    **tareas comunes**, como manejar listas de elementos u operar de forma
    sofisticada sobre cadenas de caracteres.

  - Proporcionan una **interfaz abstracta** para tareas que son altamente
    **dependientes del hardware** de la plataforma destino y de su sistema
    operativo.

  - No todas las plataformas soportan todas las funciones que una aplicación
    Java espera. En estos casos, las bibliotecas bien pueden **emular esas
    funciones** usando lo que esté disponible, o bien ofrecer un mecanismo para
    comprobar si una funcionalidad concreta está presente.

## Las herramientas de desarrollo de Java (JDK)

- Las **herramientas de desarrollo de Java** (del inglés, **_Java Development
  Kit_ o JDK**) constituyen el software necesario para desarrollar programas
  Java.

- Contiene:

  - Un **compilador** (`javac`) que traduce código Java a _bytecode_.

  - Una copia completa del **JRE**.

  - Otras **herramientas de desarrollo**: un generador de documentación, un
    empaquetador de archivos `.jar`, un desensamblador de archivos `.class`, un
    depurador, el intérprete interactivo `jshell`...

---

- A lo largo de los años han ido saliendo varios JDK que cumplen con las
  especificaciones de Java pero que se diferencian en aspectos muy concretos:
  licencia, técnicas de optimización, recolección de basura...

- El principal JDK usado a día de hoy es **OpenJDK**.

- OpenJDK es una **implementación gratuita y libre de la plataforma Java SE**,
  publicada bajo la licencia GNU GPL versión 2 basada en la máquina virtual
  _HotSpot_ desarrollada inicialmente por Sun.

- OpenJDK es la **implementación oficial de referencia** para Java SE desde la
  versión 7.

- OpenJDK es el resultado de la decisión que tomó Sun en 2006 de hacer que Java
  fuese **software libre** (al principio no lo era). Desde entonces, a lo largo
  de los años se han ido liberando partes de la plataforma hasta que,
  finalmente, **desde diciembre de 2010 todos los componentes del JDK son
  libres**.

#### Instalación

- **Instalación en Ubuntu:**

  Ejecutar los siguientes comandos desde un terminal del sistema operativo:

   ```console
   $ sudo apt update
   $ sudo apt install openjdk-14-jdk
   ```

- **Instalación en Windows:**

  Visitar [https://adoptopenjdk.net](https://adoptopenjdk.net), descargar e
  instalar la versión adecuada a la versión de Windows que se está usando.

### El compilador `javac`

- El programa `javac` es el **compilador** que traduce el código fuente escrito
  en lenguaje Java (y almacenado en archivos `.java`) a _bytecode_ almacenado
  en archivos `.class`.

- Por cada clase definida en el archivo fuente, el compilador generará un
  archivo `.class` con el código objeto en _bytecode_ generado para esa clase.

- El código objeto se almacena en archivos con extensión `.class` porque la
  mayoría de los archivos `.java` contienen definiciones de _clases_ escritas
  en lenguaje Java.

!DOT(javac.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = <Código fuente<br/>(lenguaje Java)<br/><br/><font face="monospace" point-size="11">fuente.java</font>>, shape = note, fillcolor = aliceblue];
O [label = <Código objeto<br/>(<i>bytecode</i>)<br/><br/><font face="monospace" point-size="11">clase1.class<br/>clase2.class<br/>...</font>>, shape = note, fillcolor = aliceblue];
javac [fontname = "monospace"]
F -> javac -> O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- Un programa Java está formado por uno o varios archivos fuente `.java` que
  contienen, cada uno de ellos, una o varias definiciones de clases (salvo
  excepciones).

- En Java, prácticamente todas las instrucciones que forman un programa están
  contenidas en clases.

- Por tanto, la ejecución de un programa Java empezará siempre desde una clase
  concreta, llamada **clase _principal_**.

  Más adelante veremos que la clase principal no puede ser cualquier clase.
  Tiene que ser una que tenga definido un método, llamado **método
  _principal_**, que debe tener una determinada signatura que ya veremos.

- La compilación de un archivo fuente puede provocar la **compilación _en
  cascada_** de otros archivos fuente si el primero hace uso de elementos
  definidos en los otros.

---

- Por eso, para compilar un programa Java, lo más conveniente es compilar el
  archivo fuente que contiene la clase principal, ya que ello provocará la
  compilación en cascada de cualquier archivo fuente de la que dependa ésta.

- Para compilar un archivo fuente `.java`, debemos pasarle al compilador
  `javac` el nombre de dicho archivo.

- Por ejemplo, si tenemos un archivo fuente `Principal.java` que contiene la
  definición de la clase `Principal`, podemos compilarlo con `javac` y generar
  con ello el archivo `Principal.class` con el código objeto en _bytecode_.

- Para ello, pasamos a `javac` el nombre del archivo fuente a través de la
  línea de órdenes:

  ```console
  $ ls
  Principal.java
  $ javac Principal.java
  $ ls
  Principal.class  Principal.java
  ```

---

- Si el archivo objeto `.class` que va a generar el compilador ya existe
  (normalmente, como consecuencia de una compilación anterior), el nuevo
  archivo machacará al que ya existe con el mismo nombre:

  ```console
  $ ls
  Principal.class  Principal.java
  $ javac Principal.java
  $ ls
  Principal.class  Principal.java
  ```

- Si el archivo fuente `Principal.java` contiene varias definiciones de clases,
  se generará un `.class` por cada una de ellas.

- Lo más habitual es que cada definición de clase vaya en un archivo
  fuente separado, con el mismo nombre que el de la clase.

- Esta norma se convierte en obligatoria si alguna clase está marcada como
  !JAVA(public), como veremos luego.

### El intérprete interactivo `jshell`

- Desde la versión Java 9, el JDK incorpora un intérprete interactivo llamado
  `jshell` que funciona de forma similar al intérprete interactivo de Python.

- Al igual que el de Python, ese intérprete actúa siguiendo el esquema _REPL_
  (_Read, Print, Eval, Loop_).

- Nos permite hacer experimentos en tiempo real, comprobar el resultado de
  evaluar expresiones o de ejecutar sentencias.

- Se arranca con la orden `jshell` y se sale de él con `Ctrl+D`:

  ```console
  $ jshell
  |  Welcome to JShell -- Version 14.0.2
  |  For an introduction type: /help intro

  jshell> 2 + 3
  $1 ==> 5
  ```

## El entorno de ejecución de Java (JRE)

- El **entorno de ejecución de Java** (del inglés **_Java Runtime
  Environment_** o **JRE**) es el software necesario para ejecutar programas
  Java en un determinado sistema operativo y arquitectura hardware.

- Para cada dispositivo (ya sea un teléfono móvil, un PC con Linux o un
  microondas) debe haber un JRE.

- El JRE actúa como intermediario entre Java y el sistema operativo.

- Básicamente, consiste en una **implementación de la JVM y de la biblioteca
  estándar** (el API).

- Ambas (JVM y API) deben ser compatibles entre sí, de ahí que sean
  distribuidas conjuntamente en forma de JRE.

JRE = JVM + API

---

- El JRE actúa como un emulador de la JVM y un intérprete de _bytecode_.

- El JRE lee el código objeto (los archivos `.class`) y va ejecutando
  (interpretando) paso a paso las instrucciones compiladas en _bytecode_ que se
  va encontrando.

!DOT(jre.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = <Código fuente<br/>(lenguaje Java)<br/><br/><font face="monospace" point-size="11">fuente.java</font>>, shape = note, fillcolor = aliceblue];
O [label = <Código objeto<br/>(<i>bytecode</i>)<br/><br/><font face="monospace" point-size="11">clase1.class<br/>clase2.class<br/>...</font>>, shape = note, fillcolor = aliceblue];
javac [fontname = "monospace"]
F -> javac -> O -> JRE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Desde hace ya tiempo, el JRE lleva a cabo un proceso previo de **compilación
  _Just In Time_ (JIT)**, que convierte el _bytecode_ a código nativo de la
  arquitectura donde se está ejecutando el JRE. Esto permite una ejecución
  mucho más rápida a costa de perder algo de tiempo al arrancar el programa.

!DOT(jit.svg)()(width=90%)(width=100%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = <Código fuente<br/>(lenguaje Java)<br/><br/><font face="monospace" point-size="11">fuente.java</font>>, shape = note, fillcolor = aliceblue];
O [label = <Código objeto<br/>(<i>bytecode</i>)<br/><br/><font face="monospace" point-size="11">clase1.class<br/>clase2.class<br/>...</font>>, shape = note, fillcolor = aliceblue];
N [label = <Código objeto<br/>(lenguaje máquina nativo)>, shape = note, fillcolor = aliceblue];
subgraph cluster0 {
    bgcolor = grey95
    label = "JRE"
    JIT -> N
}
javac [fontname = "monospace"]
F -> javac -> O -> JIT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### El intérprete `java`

- El programa `java` es el **intérprete** que implementa la JVM en el JRE.

- Es el programa que usamos para cargar y ejecutar los programas compilados a
  _bytecode_ almacenados en archivos `.class`.

- Como su extensión indica, un archivo `.class` contiene generalmente la
  definición de una **clase Java** compilada en _bytecode_.

- En Java, las instrucciones que forman un programa están prácticamente todas
  contenidas en clases. Por tanto, la ejecución de un programa Java empezará
  siempre desde una clase concreta, llamada **clase _principal_**, el cual debe
  contener el **método _principal_**.

- Para ejecutar un programa Java, debemos pasarle al intérprete `java` el
  nombre de la clase principal.

- No es necesario disponer de los archivos fuente `.java` para ejecutar un
  programa Java; sólo el código objeto almacenado en los `.class`.

---

- Por ejemplo, si tenemos una clase `Principal` compilada en el archivo
  `Principal.class`, podemos indicar que queremos empezar desde ahí la
  ejecución de nuestro programa:

  ```console
  $ java Principal
  ```

  El intérprete `java` arrancaría la JVM, cargaría el archivo `.class` en
  memoria y comenzaría su ejecución desde el método principal.

  Si no encuentra al método principal en esa clase, dará un error.

- Es importante no confundir el nombre de la clase con el nombre del archivo
  que contiene el código compilado de la clase. En este caso, el nombre de la
  clase es `Principal`, no `Principal.class`:

  ```console
  $ java Principal.class
  Error: no se ha encontrado o cargado la clase principal Principal.class
  Causado por: java.lang.ClassNotFoundException: Principal.class
  ```

---

- El programa empezaría a ejecutarse a partir de dicha clase, suponiendo que es
  válida como clase principal (es decir, que contiene al método principal).

- Ya sabemos que «ejecutar un programa Java» consiste en hacer que el
  intérprete `java` vaya ejecutando las instrucciones que forman el programa,
  emulando el funcionamiento de la máquina virtual de Java.

- Si durante la ejecución del programa se necesita acceder a una clase cuyo
  código objeto se encuentra en otro archivo `.class`, el intérprete `java`
  buscará ese archivo `.class` y lo cargará en la JVM.

- Para localizar los archivos `.class`, el intérprete `java` mira en el
  directorio actual mientras no se diga lo contrario.

- Si los archivos `.class` se encuentran en otro sitio, debemos indicarlo
  usando el _classpath_.

---

- El **_classpath_** es una lista de directorios separados por «`:`» que
  representa las rutas en las que el intérprete debe buscar los archivos
  `.class`.

- En el _classpath_ se indican las rutas en el orden en el que se desea que
  busque el intérprete, ordenados por preferencia.

- Por ejemplo, el siguiente _classpath_:

  `/usr/lib/java:/usr/java:/tmp`

  está formado por tres rutas, que se consultarían en el siguiente orden:

  1. Primero se miraría si el archivo `.class` buscado se encuentra en
     `/usr/lib/java`.

  2. Si no está ahí, entonces se buscaría en `/usr/java`.

  3. Si ahí tampoco está, entonces se buscaría en `/tmp`.

  4. Si tampoco está ahí, el intérprete daría un error y finalizará la
     ejecución del programa.

---

- Para indicar al intérprete qué _classpath_ se desea usar, se pueden usar dos
  técnicas:

  - Usar la opción `-cp` del programa `java`:

    ```console
    $ java -cp /usr/lib/java:/usr/java:/tmp Principal
    ```

  - Crear y exportar la variable de entorno `CLASSPATH` del sistema operativo:

    ```console
    $ export CLASSPATH=/usr/lib/java:/usr/java:/tmp
    $ java Principal
    ```

# El primer programa Java

## El primer programa Java

```java
/*
 * ¡Hola, mundo!
 */
public class Principal {
    public static void main(String[] args) {
        System.out.println("Hola");          // Imprime "Hola"
    }
}
```

- Suponiendo que ese código se escribe en un archivo llamado `Principal.java`,
  para compilarlo desde un terminal del sistema operativo podemos hacer:

  ```console
  $ javac Principal.java
  ```

  lo que creará (o actualizará, si ya existía) un archivo `Principal.class` con
  el _bytecode_ de la clase `Principal`.

- Ahora ya podemos ejecutar el programa haciendo:

  ```console
  $ java Principal
  Hola
  ```

---

- Los comentarios que ocupan una sola línea van desde `//` hasta el final de la
  línea.

- Los comentarios que ocupan varias líneas se encierran entre `/*` y `*/`.

- En Java no existen funciones: todos son métodos.

- Las sentencias simples en Java deben acabar siempre en `;`.

- Las sentencias deben pertenecer a un método. Fuera de un método sólo puede
  haber declaraciones y directivas para el compilador.

- Por tanto, en cada programa debe existir, al menos, una clase.

- La estructura del programa se define mediante bloques delimitados por las
  llaves `{` y `}`, que son sentencias compuestas y no acaban en `;`.

- Para acceder a un miembro de un objeto o clase, se usa el operador punto
  (`.`).

## Tipado estático vs. dinámico

- Java es un lenguaje de **tipado estático**, a diferencia de Python donde el
  tipado es **dinámico**.

- Por tanto, en Java **hay que declarar el tipo de todos los valores** que se
  van a usar en el programa:

  - **Variables** (incluyendo los campos de las clases).

  - **Parámetros** de los métodos.

  - **Valores de retorno** de los métodos.

- En Python, las variables empiezan a existir en cuanto se les asigna un valor,
  pero en Java hay que declararlas antes de poder usarlas, por lo que
  **empiezan a existir desde su declaración**, aunque no se les haya asignado
  ningún valor.

- En las declaraciones de variables, parámetros o valores de retorno, **los
  tipos se indican _antes_ del identificador correspondiente**, no después.

## El método `main`

- Todo programa Java comienza su ejecución por un método (llamado **método
  principal**) que debe tener la siguiente signatura:

  ```java
  public static void main(String[] args)
  ```

- Por tanto, ese método:

  - Debe llamarse `main`.

  - Debe declararse como estático (usando la palabra clave !JAVA(static)).

  - Debe tener un único parámetro llamado `args` de tipo !JAVA{String[]} (que
    significa «_array_ de cadenas»).

  - No debe devolver ningún valor (su tipo de retorno es !JAVA(void)).

  - Debe definirse en la **clase principal** del programa.

  - Su visibilidad debe ser **pública**.

## La clase principal

- La **clase principal** del programa es aquella que contiene el método
  principal.

- Las clases se definen con la palabra clave !JAVA(class), seguida de su nombre
  y su definición (entre llaves `{` y `}`).

- Además, y aunque aquí no resulta estrictamente necesario, se recomienda
  marcar la clase principal como **pública** usando el modificador
  !JAVA{public} (en su momento veremos qué significa eso).

- En este caso, se debe cumplir que:

  - Esa clase sea la única clase pública que haya en el archivo fuente.

  - El nombre del archivo fuente debe coincidir exactamente con el de la clase
    (con la extensión `.java`).

- Siempre se recomienda que haya una única clase por cada archivo fuente y que
  el nombre de la clase y el de su archivo coincidan.

## La clase `System`

- La clase !JAVA(System) contiene varios atributos útiles y que se utilizan con
  frecuencia en muchos programas Java.

- Todos sus miembros (tanto variables como métodos) son **estáticos**.

- No se puede instanciar.

- Entre las facilidades que ofrece la clase !JAVA(System) se encuentran:

  - Los flujos de entrada estándar (`in`), salida estándar (`out`) y salida
    estándar de errores (`err`).

  - Acceso a propiedades definidas externamente y variables de entorno.

  - Un medio para cargar archivos y bibliotecas.

  - Un método para copiar rápidamente una parte de un _array_.

## El paquete `java.lang`

- Java agrupa las clases (y otros elementos que también veremos, como las
  _interfaces_) en unidades llamadas **paquetes**.

- Los paquetes de Java actúan de forma similar a los módulos de Python y, por
  tanto, ayudan a la modularización del código.

- Cuando una clase está definida dentro de un paquete, decimos que «_pertenece
  al paquete_» o que está «_contenida en el paquete_».

- En tal caso, el **nombre totalmente cualificado de la clase** está formado
  por el nombre del paquete al que pertenece y el nombre de la propia clase,
  separados por un punto (`.`), de la siguiente forma:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(paquete)!T(.)!NT(clase)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- A veces se denomina **nombre corto** al nombre de la clase sin la parte
  correspondiente al paquete al que pertenece (si pertenece a alguno).

---

- Una clase _A_ puede usar a otra clase _B_ en cualquier momento mediante el
  nombre totalmente cualificado de _B_, aunque _A_ y _B_ pertenezcan a paquetes
  diferentes.

- Si una clase _A_ desea usar a otra clase _B_ y ambas pertenecen al mismo
  paquete, podrá hacerlo sin tener que especificar
  el nombre totalmente cualificado de _B_, simplemente usando su nombre corto.

- En cambio, si _A_ y _B_ pertenecen a paquetes distintos, hay dos opciones:

  - _A_ debe indicar el nombre totalmente cualificado de _B_, o bien

  - _A_ debe **importar** a _B_ dentro del paquete de _A_ usando la sentencia:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~
    !T(import) !NT(paquete)!T(.)!NT(clase)!T(;)
    ~~~~~~~~~~~~~~~~~~~~~~

- Los paquetes de Java no se importan como tales, sino sólo sus miembros, de
  forma similar a lo que ocurre en Python cuando usamos la sentencia
  !PYTHON(from ... import).

---

- La clase !JAVA(System) pertenece a un paquete llamado `java.lang`.

- Por tanto, el nombre totalmente cualificado de la clase !JAVA(System) es
  !JAVA(java.lang.System).

- El paquete `java.lang` es especial por dos motivos:

  #. Proporciona **clases que son fundamentales** en el lenguaje Java, como por
     ejemplo:

     - !JAVA(Object): es la raíz de la jerarquía de clases.

     - !JAVA(Class): representa a las clases en tiempo de ejecución.

     - !JAVA(Math): proporciona funcionalidades matemáticas comunes.
     
     - !JAVA(String): representa las cadenas de caracteres.

  #. No es necesario importar explícitamente ninguno de sus miembros, ya que
     **todos sus miembros son importados automáticamente**.

## El objeto `out`

- El objeto `out` representa el flujo de salida estándar del programa.

- Ese flujo ya está abierto y listo para aceptar datos de salida.

- Normalmente, ese flujo está conectado a la pantalla.

- `out` es una instancia de la clase !JAVA(PrintStream), la cual define qué
  métodos se pueden invocar sobre ese objeto.

- `out` es un miembro **estático** de la clase !JAVA(System).

- Por tanto, para acceder a él tenemos que usar el operador punto (`.`) a
  partir del nombre de la clase:

  ```java
  System.out
  ```

## El método `println`

- El método `println` está definido en la clase !JAVA(PrintStream) y, por
  tanto, se puede invocar sobre el objeto `out`.

- Ese método sirve para imprimir un valor por la salida, seguido de un salto de
  línea:

  ```java
  System.out.println("Hola");
  ```

- Equivale aproximadamente a la función !PYTHON(print) de Python.

!BIBLIOGRAFIA
