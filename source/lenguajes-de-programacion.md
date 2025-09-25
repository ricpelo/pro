---
title: Lenguajes de programación
author: Ricardo Pérez López
!DATE
nocite: |
  @pareja_flores_desarrollo_1997, @aguilar_fundamentos_2008, @van-roy_concepts_2004
---

# Definición

## Definición

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Lenguaje de programación:**

Un lenguaje de programación es un **lenguaje formal** que proporciona una serie
de instrucciones que permiten a un programador escribir programas destinados a
controlar el comportamiento físico y lógico de un ordenador.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Un **programa** es la **codificación de un algoritmo** en un lenguaje de
  programación.

- Por tanto: cuando escribimos un algoritmo en un lenguaje de programación,
  obtenemos un programa.

- Estos lenguajes están determinados por un conjunto de símbolos (llamado
  *alfabeto*), reglas gramaticales (léxico/morfológicas y sintácticas) y reglas
  semánticas, que en conjunto definen las estructuras válidas en el lenguaje y
  su significado.

---

- Un lenguaje de programación viene definido por:

  - **Sintaxis**: la forma visible del lenguaje.

  - **Semántica estática**: las restricciones que tiene que cumplir un programa
    para que sea correcto aunque sea sintácticamente válido. 

  - **Semántica dinámica**: el significado de cada construcción del lenguaje.

  - **Biblioteca estándar**: el conjunto de utilidades básicas que acompañan al
    lenguaje.

### Sintaxis

- A la forma visible de un lenguaje de programación se la conoce como
  **sintaxis**.

- La sintaxis de un lenguaje de programación describe las combinaciones
  posibles de los símbolos que forman un programa sintácticamente correcto.

- La sintaxis define dos elementos principales:

  - Los **componentes léxicos**, es decir, los elementos mínimos que forman un
    programa (palabras clave, números, identificadores, caracteres de
    puntuación como paréntesis o comas, etc...) y que representa el _alfabeto_
    de dicho lenguaje.

  - La **estructura gramatical**, es decir, cómo se pueden combinar los
    componentes léxicos para formar «frases» correctas según la sintaxis del
    lenguaje.

#### Notación EBNF

- La sintaxis de los lenguajes de programación es definida generalmente
  utilizando:

  - **Expresiones regulares** (para los componentes léxicos)

  - **Notación de Backus-Naur extendida** (para la estructura gramatical)

- Cada una de esas notaciones son formalismos usados para describir estructuras
  sintácticas en gramáticas formales.

- Las expresiones regulares las estudiaremos a lo largo del curso, ya que
  resultan muy útiles para procesar cadenas.

- Conocer la notación de Backus-Naur resulta de gran interés porque la mayoría
  de los lenguajes de programación la utilizan para documentar su sintaxis.

---

:::: columns

::: {.column width=51%}

- Ejemplo:

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(frases) ::= !NT{frase} (!T{y} !NT{frase})\* !T{.}
!NT(frase) ::= !NT(sujeto) !NT(predicado)
!NT(sujeto) ::= !NT(articulo) !NT(sustantivo) !NT(adjetivo)!MAS
!NT(predicado) ::= !NT(verbo) [!NT(adverbio)]
!NT(artículo) ::= !T(el) | !T(la)
!NT(sustantivo) ::= !T(niño) | !T(vaca)
!NT(adjetivo) ::= !T(grande) | !T(azul)
!NT(verbo) ::= !T(come) | !T(salta) | !T(corre)
!NT(adverbio) ::= !T(mucho) | !T(poco)
~~~~~~~~~~~~~~~~~~~~~~~~~

- Cada regla sintáctica (llamada **producción**) está formada por dos partes
  separadas por !COLOR(teal)(::=), donde a la izquierda hay un símbolo no
  terminal y a la derecha puede haber una lista de símbolos terminales y no
  terminales.

:::

::: {.column width=3%}

:::

::: {.column width=46%}

\begingroup
\setlist[itemize,1]{label=--}

- Los nombres entre ángulos (como !NT(predicado)) se llaman **símbolos no
  terminales**.
- Los símbolos en negrita y azul (como !T(la)) se llaman **símbolos
  terminales**.
- La barra vertical !COLOR(teal)(|) indica poder elegir entre dos **opciones**.
- El !COLOR(teal)(!POR) indica 0, 1 ó más **repeticiones** de lo que
  acompaña.
- El !COLOR(teal)(!MAS) indica 1 ó más **repeticiones** de lo que acompaña.
- Los corchetes !COLOR{teal}{!ifdef(HTML)(\[)([)} y
  !COLOR{teal}{!ifdef(HTML)(\])(])} indican **optatividad**.
- Los paréntesis !COLOR{teal}{(} y !COLOR{teal}{)} **agrupan** varios
  elementos juntos.

\endgroup

:::

::::

---

- Las gramáticas sirven para _reconocer_ o _producir_ frases correctas en un
  determinado lenguaje.

- Por ejemplo, podemos preguntarnos si la frase «`el niño grande come mucho.`»
  es sintácticamente correcta según la gramática anterior.

- Para ello, comprobamos si es posible _derivar_ esa frase a partir de las
  producciones de la gramática, partiendo del **símbolo inicial**, que siempre
  es el primer símbolo no terminal que aparece en la gramática (en este caso,
  !NT(frases)).

- Cada paso del procedimiento se llama _derivación_, y consiste en ir
  sustituyendo, de izquierda a derecha, los símbolos no terminales que vayamos
  encontrando por su correspondiente definición (lo que hay a la derecha del
  !COLOR{teal}{::=}).

- Iremos avanzando mientras encontremos símbolos terminales que coincidan con
  los de la frase.

- El procedimiento finalizará con éxito cuando se acabe la frase, o con fracaso
  si algún símbolo terminal no coincide con el esperado.

---

- En este caso:

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(frases)
  $\Rightarrow$ !NT(frase) !T(.)
  $\Rightarrow$ !NT(sujeto) !NT(predicado) !T(.)
  $\Rightarrow$ !NT(artículo) !NT(sustantivo) !NT(adjetivo)!MAS !NT(predicado) !T(.)
  $\Rightarrow$ !T(el) !NT(sustantivo) !NT(adjetivo)!MAS !NT(predicado) !T(.)
  $\Rightarrow$ !T(el) !T(niño) !NT(adjetivo)!MAS !NT(predicado) !T(.)
  $\Rightarrow$ !T(el) !T(niño) !T(grande) !NT(predicado) !T(.)
  $\Rightarrow$ !T(el) !T(niño) !T(grande) !NT(verbo) [!NT(adverbio)] !T(.)
  $\Rightarrow$ !T(el) !T(niño) !T(grande) !T(come) [!NT(adverbio)] !T(.)
  $\Rightarrow$ !T(el) !T(niño) !T(grande) !T(come) !T(mucho) !T(.)
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- El procedimiento ha tenido éxito, por lo que podemos afirmar que la gramática
  ha _reconocido_ la frase, o que la frase _satisface_ la gramática o que
  _cumple_ con la gramática.

- Eso se expresa diciendo que:

!NT(frases) $\stackrel{\ast}{\Rightarrow}$ !T(el) !T(niño) !T(grande) !T(come) !T(mucho) !T(.)

---

- Otra forma de representarlo es mediante un diagrama llamado **árbol de
  análisis sintáctico**.

!DOT(arbol-analisis.svg)(Árbol de análisis sintáctico para «`el niño grande come mucho.`»)(width=70%)()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rankdir = TB
node [shape = plaintext, fillcolor = transparent]
frases [label = <<font color="teal"><i>&lt;frases&gt;</i></font>>]
frase [label = <<font color="teal"><i>&lt;frase&gt;</i></font>>]
sujeto [label = <<font color="teal"><i>&lt;sujeto&gt;</i></font>>]
predicado [label = <<font color="teal"><i>&lt;predicado&gt;</i></font>>]
articulo [label = <<font color="teal"><i>&lt;artículo&gt;</i></font>>]
sustantivo [label = <<font color="teal"><i>&lt;sustantivo&gt;</i></font>>]
adjetivo [label = <<font color="teal"><i>&lt;adjetivo&gt;</i></font>>]
verbo [label = <<font color="teal"><i>&lt;verbo&gt;</i></font>>]
adverbio [label = <<font color="teal"><i>&lt;adverbio&gt;</i></font>>]
punto [label = <<font face="monospace" color="#268bd2"><b>.</b></font>>]
el [label = <<font face="monospace" color="#268bd2"><b>el</b></font>>]
nino [label = <<font face="monospace" color="#268bd2"><b>niño</b></font>>]
grande [label = <<font face="monospace" color="#268bd2"><b>grande</b></font>>]
come [label = <<font face="monospace" color="#268bd2"><b>come</b></font>>]
mucho [label = <<font face="monospace" color="#268bd2"><b>mucho</b></font>>]
frases -> frase
frases -> punto
frase -> sujeto
frase -> predicado
sujeto -> articulo
sujeto -> sustantivo
sujeto -> adjetivo
articulo -> el
sustantivo -> nino
adjetivo -> grande
predicado -> verbo
predicado -> adverbio
verbo -> come
adverbio -> mucho
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJERCICIOS

@. Comprobar si son sintácticamente correctas las siguientes frases según la
   gramática anterior:

     a. `la vaca corre.`
     b. `la vaca grande salta.`
     c. `la vaca grande azul salta.`
     d. `el niño come.`
     e. `niño come.`
     f. `la niño grande salta poco.`
     g. `la vaca azul come`
     h. `el niño grande salta poco y la vaca azul corre mucho.`

---

@. ¿Qué frases genera (o reconoce) la siguiente gramática? Poner ejemplos:

    !ALGO
    ~~~~~~~~~~~~~~~~~~~~~~~~~
    !NT(expresión) ::= !NT(átomo) | !NT(lista)
    !NT(átomo) ::= !NT(número) | !NT(símbolo)
    !NT(lista) ::= !T{(} !NT(expresión)\* !T{)}
    !NT(número) ::= \[!T(+) | !T(-)\] !NT(dígito)!MAS
    !NT(símbolo) ::= !NT(letra) (!NT(letra) | !NT(dígito))!MAS
    !NT(dígito) ::= !T(0) | !T(1) | !T(2) | !T(3) | !T(4) | !T(5) | !T(6) | !T(7) | !T(8) | !T(9)
    !NT(letra) ::= !T(a) | !T(b) | ... | !T(z)
    ~~~~~~~~~~~~~~~~~~~~~~~~~

### Semántica estática

- La semántica estática define las **restricciones** sobre la estructura de los
  textos válidos que resulta imposible o muy difícil expresar mediante
  formalismos sintácticos estándar como los que acabamos de ver.

- Es decir: hay programas sintácticamente correctos que, sin embargo, no
  resultan ser programas válidos según las reglas de la semántica estática del
  lenguaje.

- La semántica estática de un lenguaje está fuertemente relacionada con su
  **sistema de tipos**.

---

- Por ejemplo:

  - Comprobar que los tipos de los datos a operar son los correctos:

    Si intentamos hacer `4 + 'hola'`, sintácticamente puede ser correcto pero
    no tiene sentido sumar una cadena a un número.

  - Comprobar que un nombre está ligado a un valor antes de usarlo en una
    expresión.

    Sintácticamente puede ser correcto hacer `4 + x`, pero si no se sabe qué es
    `x`, el programa no puede realizar la operación.

  - Comprobar que el número y tipo de argumentos en la llamada a una función
    coincide con el número y tipo de parámetros de la función.

    Si se quiere calcular el coseno de 24 se puede hacer `cos(24)`, pero no
    tiene sentido hacer `cos(24, 35)` (se llama a la función con dos argumentos
    en vez de uno) o `cos('hola')` (se la llama con una cadena en lugar de un
    número).

---

- En el ejemplo que vimos de los niños y las vacas, hemos encontrado frases
  sintácticamente correctas según la gramática pero que no son completamente
  correctas o lógicas.

- Por ejemplo, la frase «`la niño grande salta poco.`» es sintácticamente
  correcta (podemos derivarla a partir del símbolo inicial de la gramática),
  pero sabemos que no es _completamente_ correcta porque no hay concordancia de
  género entre el artículo `la` y el sustantivo `niño`.

- Ese error de concordancia es un error de semántica estática.

### Semántica dinámica

- La semántica dinámica (o simplemente **semántica**) de un lenguaje de
  programación expresa el **significado** de cada construcción del lenguaje.

- Es un concepto muy complicado de formalizar y por ello se suele definir de
  manera informal en la documentación del lenguaje en función de los
  **efectos** que produce cada construcción del lenguaje dentro de un programa.

# Evolución histórica

## Evolución histórica

- **1804: El telar de Jacquard (_Joseph Marie Jacquard_)**

  - Tarjetas perforadas para controlar los diseños en los tejidos.

- **1837 -- 1871: La máquina analítica (_Charles Babbage_)**

  - En 1842, el matemático italiano Luigi Menabrea escribió una descripción de
    la máquina en frances.

  - En 1843, **Ada Lovelace** la traduce al inglés e incorpora unas anotaciones
    propias en las que especifica con detalle un método para calcular los
    números de Bernoulli con esa máquina. Por ello, se la considera **la
    primera programadora de la historia**.

---

- **1890: Máquinas tabuladoras electromecánicas (_Herman Hollerith, Tabulating
  Machine Company_)**

  - Hollerith está considerado **el primer informático de la historia**, por
    crear las primeras máquinas de procesamiento automático de la información.
  - Con ellas se creó el censo de los EE.UU.
  - Su empresa acabó llamándose **IBM**.

- **1936: El gran año de los modelos formales computacionales:**

  - **Cálculo lambda (_Alonzo Church_)**

    - Un modelo universal de computación basado en la abstracción y aplicación
      de funciones.

  - **Máquinas de Turing (_Alan Turing_)**

    - Un modelo universal de computación basado en máquinas abstractas que
      manipulan símbolos escritos en una cinta de acuerdo a una serie de reglas
      definidas.

  - **Sorpresa**: ambos modelos son **equivalentes**.

---

- **El trabajo de _Konrad Zuse_:**

  - **1941: Ordenador Z3**

    - El primer ordenador digital programable que realmente llegó a funcionar.

    - Por ello, Zuse es considerado **el inventor del ordenador moderno**.

  - **1945: Ordenador Z4**

    - El primer ordenador digital comercial del mundo.

    - Se vendió a varias universidades.

  - **1948: Plankalkül**

    - Considerado **el primer lenguaje de programación**.

    - Diseñado, pero no implantado en su época.

---

- **(*Hasta aquí*):** Todo se programa en **lenguaje máquina**

- **1949: Lenguaje ensamblador (_EDSAC_)**

- **Primeros Autocódigos:**

  - **1952: Autocódigo de Glennie (_Alick Glennie, Universidad de
    Manchester_)**

  - **1955: Autocódigo del Mark 1 (_Ralph Anthony Brooker, Universidad de
    Manchester_)**

---

- **1957: Fortran (_John Backus, IBM_)**

  - El primer lenguaje de alto nivel de propósito general de uso masivo en
    tener una implementación funcional.

- **1958: LISP (_John McCarthy, Instituto de Tecnología de Massachusetts_)**

  - Basado en el cálculo lambda.

  - Destinado al procesamiento simbólico y a la investigación en Inteligencia
    Artificial.

- **1958 -- 1960: Familia de lenguajes ALGOL (_Backus, Naur, Wijngaarden,
  Bauer, Perlis, McCarthy y otros_):**

  - **1958: ALGOL 58**

    - Introdujo el concepto de bloque de código (sentencia compuesta).

  - **1960: ALGOL 60**

    - Influyó mucho en lenguajes posteriores.

    - Introdujo las funciones anidadas y el ámbito léxico.

---

- **1959: FLOW-MATIC (_Grace Hopper, Remington Rand_)**

  - El primer lenguaje de alto nivel orientado a las aplicaciones de gestión.

  - El primero en usar sentencias y palabras en inglés.

- **1960: COBOL (_Grace Hopper, Comisión CODASYL y Departamento de Defensa de
  los EE.UU._)**

  - Inspirado en FLOW-MATIC.

- **1962: Simula (_Ole-Johan Dahl y Kristen Nygaard, Norwegian Computer
  Center_)**

  - Considerado el primer lenguaje **orientado a objetos**.

- **1970: Pascal (_Niklaus Wirth_)**

  - Lenguaje imperativo, procedimental, estructurado, pequeño, eficiente,
    heredero del ALGOL 60.

  - Muy usado en la enseñanza de la programación.

---

- **1972: Prolog (_Alain Colmerauer, Universidad de Marsella_)**

  - El primer lenguaje de **programación lógica**.

- **1972: C (_Dennis Ritchie, Laboratorios Bell_)**

  - Lenguaje de **nivel medio** (de alto nivel pero con acceso directo a la
    máquina y al sistema operativo).

  - Lenguaje **de sistemas**

- **1975: Scheme (_Gerald Jay Sussman, Guy L. Steele, Jr., MIT_)**

  - Lenguaje funcional basado en LISP con ámbito léxico.

- **1978: ML (_Robin Milner, Universidad de Edimburgo_)**

  - Lenguaje de **programación funcional** con sistema de tipos estático y
    polimórfico.

  - En realidad es una familia de lenguajes, entre los que se encuentran
    Standard ML, OCaml o F#.

---

- **1980: Smalltalk (_Alan Kay, Adele Goldberg, Xerox PARC_)**

  - Lenguaje orientado a objetos puro, reflexivo, con tipado dinámico, con un
    entorno propio de desarrollo y ejecución.

- **1985: C++ (_Bjarne Stroustrup, Laboratorios Bell_)**

  - Extensión orientada a objetos del lenguaje C.

- **1990: Haskell (_Simon Peyton Jones, Paul Hudak, Philip Wadler y otros_)**

  - Lenguaje funcional puro con evaluación no estricta y sistema de tipos
    polimórfico y fuertemente tipado.

- **1991: Python (_Guido Van Rossum, CWI de Holanda_)**

  - Lenguaje multiparadigma interpretado, dinámico y multiplataforma.

---

- **1995: Un año especialmente destacable:**

  - **Java (_James Gosling, Sun Microsystems_)**

    - Lenguaje orientado a objetos, el más usado en la actualidad.

    - Genera código para una máquina virtual presente en millones de
      dispositivos en todo el mundo.

  - **JavaScript (_Brendan Eich, Netscape Communications_)**

    - Lenguaje multiparadigma, basado en prototipos e interpretado.

    - Usado como lenguaje cliente en los navegadores web.

  - **PHP (_Rasmus Lerdorf_)**

    - Lenguaje multiparadigma e interpretado.

    - Usado principalmente como lenguaje de servidor en aplicaciones web.

  - **Ruby (_Yukihiro Matsumoto_)**

    - Lenguaje interpretado orientado a objetos puro.

---

- **2000: C# (_Anders Hejlsberg, Microsoft_)**

  - Lenguaje orientado a objetos para la plataforma .NET.

- **2003: Scala (_Martin Odersky, Escuela Politécnica Federal de Lausana,
  Suiza_)**

  - Lenguaje multiparadigma (funcional y orientado a objetos) para la máquina
    virtual de Java.

- Swift, Kotlin, TypeScript, Julia, Go, Rust, Perl 6, Clojure...

!EJERCICIO

@. Busca en Internet información sobre un lenguaje de programación que no se
haya comentado aquí y que se haya creado no antes del año 2000. Anota el
paradigma (o paradigmas) que soporta y los lenguajes que influyeron en su
diseño.

# Clasificación

## Por nivel

- Dependiendo del **nivel** del lenguaje de programación tenemos:

  - Lenguajes de bajo nivel

  - Lenguajes de alto nivel

### Lenguajes de bajo nivel

- Características:

  - Lenguajes basados en el paradigma imperativo.

  - Más cercanos a la máquina.

  - Con poca o nula capacidad de abstracción.

  - Se trabaja directamente con elementos propios del *hardware* del ordenador.

  - Atados a la arquitectura interna de la máquina para la que se programa.

  - Programas difíciles de escribir, depurar, mantener y portar.

  - Se consigue el máximo control del ordenador.

- Principales ejemplos:

  - Código máquina

  - Ensamblador

### Lenguajes de alto nivel

- Características:

  - Lenguajes que pueden estar basados en cualquier paradigma, aunque la
    tendencia es que sean cada vez más _declarativos_.

  - Más cercanos al ser humano.

  - Mayor capacidad de abstracción.

  - Independiente de la arquitectura y los detalles internos del ordenador o el
    sistema operativo.

  - Programas más fáciles de escribir, depurar, mantener y portar.

  - Menor control de los recursos de la máquina.

---

- Ejemplos de lenguajes de alto nivel:

  :::: columns

  ::: column

  - Fortran
  - LISP
  - COBOL
  - BASIC
  - Pascal
  - C
  - Java

  :::

  ::: column

  - Ruby
  - C++
  - Python
  - JavaScript
  - C#
  - PHP
  - Haskell

  :::

  ::::

!EJERCICIO

@. Ordena cronológicamente la lista anterior por el año de creación de cada
lenguaje.

## Por generación

1. **Primera generación**: Se programa directamente en *código máquina*.

2. **Segunda generación**: Aparece el *lenguaje ensamblador* como un lenguaje
   simbólico que se traduce a lenguaje máquina usando un *programa
   ensamblador*.

3. **Tercera generación**: Aparecen los *lenguajes de alto nivel* con los que
   se puede programar con códigos independientes de la máquina. El código
   fuente se traduce a código máquina usando programas específicos llamados
   **traductores**.

4. **Cuarta generación**: Herramientas que combinan un lenguaje de programación
   de alto nivel con un *software* de generación de pantallas, listados,
   informes, etc. orientado al desarrollo rápido de aplicaciones. Ejemplos
   característicos son los lenguajes de **programación visual**.

5. **Quinta generación**: Es una denominación que se usó durante un tiempo para
   los lenguajes de programación de muy alto nivel (funcional y lógicos)
   destinados principalmente a resolver problemas de **Inteligencia
   Artificial**, pero como término ya ha caído en desuso.

## Por propósito

- Dependiendo del tipo de programa que podemos escribir con el lenguaje, tenemos:

  - **Lenguajes de propósito general**: Con ellos se pueden escribir programas
    muy diversos. No están atados a un tipo concreto de problema a resolver.
    Ejemplos:

    - LISP, Pascal, C, Java, Ruby, C++, Python, C#, Haskell...

  - **Lenguajes de propósito específico**: Son lenguajes mucho más
    especializados y destinados principalmente a resolver un tipo determinado
    de problema. No sirven para escribir cualquier tipo de programa pero,
    dentro de su ámbito de actuación, suelen funcionar mejor que los lenguajes
    de propósito general. Ejemplos:

    - Lenguajes de consulta a bases de datos (SQL)

    - Lenguajes de descripción de hardware (VHDL)

    - Lenguajes para desarrollo de aplicaciones de gestión (COBOL)

## Por paradigma

- Dependiendo del paradigma de programación que soporta el lenguaje, podemos
  encontrar:

  - Lenguajes imperativos

  - Lenguajes funcionales

  - Lenguajes orientados a objetos

  - Lenguajes lógicos

  - Lenguajes dirigidos por eventos

  - Lenguajes multiparadigma

# Traductores e intérpretes

## Traductores

- El único lenguaje que entiende la máquina directamente es el **lenguaje
  máquina** o **código máquina**, que es un lenguaje de **bajo nivel**.

- Para poder programar con un lenguaje de **alto nivel**, necesitamos usar
  herramientas *software* que traduzcan nuestro programa al lenguaje máquina
  que entiende el ordenador.

- Estas herramientas *software* son los **traductores**.

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Traductor:**

  Es un *software* que traduce un programa escrito en un lenguaje a otro
  lenguaje, conservando su significado.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- El traductor transforma el programa fuente (o **código fuente**) en el
  programa objeto (o **código objeto**).

- El código fuente está escrito en el **lenguaje fuente** (que generalmente
  será un lenguaje de alto nivel).

- El código objeto está escrito en el **lenguaje objeto** (que generalmente
  será código máquina).

- Durante el proceso de traducción, el traductor también informa al programador
  de posibles **errores** en el código fuente.

!DOT(traduccion.svg)(El proceso de traducción)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = "Código fuente\n(lenguaje fuente)", shape = note, fillcolor = aliceblue];
O [label = "Código objeto\n(lenguaje objeto)", shape = note, fillcolor = aliceblue];
E [label = "Errores", shape = plaintext, fillcolor = transparent];
F -> Traductor -> O
Traductor -> E
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Compiladores

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Compilador**:

  Es un traductor que convierte un programa escrito en un lenguaje de **más
  alto nivel** a un lenguaje de **más bajo nivel**.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Generalmente, el lenguaje objeto suele ser **código máquina** y el resultado
  de la compilación es un **objeto ejecutable** directamente por la máquina.

!DOT(compilacion.svg)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = "Código fuente\n(lenguaje fuente)", shape = note, fillcolor = aliceblue];
O [label = "Objeto ejecutable\n(código máquina)", shape = note, fillcolor = aliceblue];
F -> Compilador -> O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Ensambladores

- Un caso particular de compilador es el **ensamblador**:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  **Ensamblador**:

  Es un compilador que traduce un programa escrito en **lenguaje ensamblador**
  a código máquina.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Muchas veces, los compiladores se construyen *en cadena*: en lugar de generar
  código máquina directamente, generan código ensamblador que sirve de entrada
  a un programa ensamblador que generará el código objeto final.

!DOT(ensamblado.svg)()(width=100%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = "Código fuente\n(lenguaje fuente)", shape = note, fillcolor = aliceblue];
E [label = "Código ensamblador\n(lenguaje ensamblador)", shape = note, fillcolor = aliceblue];
O [label = "Objeto ejecutable\n(código máquina)", shape = note, fillcolor = aliceblue];
F -> Compilador -> E -> Ensamblador -> O
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Intérpretes

- Un **intérprete** es un caso muy especial de traductor.

- En lugar de generar código objeto, el intérprete **lee el código fuente y lo
  ejecuta directamente**, reconociendo y ejecutando sus instrucciones una por
  una hasta que se acaba el programa.

- El intérprete funciona, por tanto, como un **emulador** de una máquina que
  entendiera directamente el lenguaje de alto nivel en el que está escrito el
  programa fuente. Esa máquina no existe físicamente, y por eso decimos que es
  una _máquina abstracta_, para distinguirla de la real.

!DOT(interpretes.svg)()(width=60%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = "Código fuente\n(lenguaje fuente)", shape = note, fillcolor = aliceblue];
I [label = "Intérprete\n(ejecuta el programa directamente)"];
F -> I
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- En rigor, como los intérpretes no generan código objeto, no podríamos
  considerarlos traductores, sino que más bien entran dentro de la categoría
  más general de **procesadores de lenguajes**.

---

- Un intérprete está formado por un **analizador** y un **emulador**:

  - El **analizador** traduce todo el código fuente a una representación
    interna llamada **árbol sintáctico** (que no hay que confundir con el
    _árbol de análisis sintáctico_).

    Ese árbol sintáctico no se vuelca directamente a la salida, sino que es
    consumida directamente por el _emulador_.

  - El **emulador** se encarga de recorrer el árbol sintáctico y de ir
    ejecutando las instrucciones que éste representa, llevando a cabo las
    acciones que correspondan dependiendo de la instrucción que sea.

    Para ello, tiene que ir traduciendo sobre la marcha, instrucción por
    instrucción, las acciones a realizar sobre la máquina abstracta en acciones
    a realizar sobre la máquina real.

!DOT(analizador-emulador.svg)()(width=70%)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
F [label = "Código fuente\n(lenguaje fuente)", shape = note, fillcolor = aliceblue];
subgraph cluster0 {
    label = "Intérprete"
    I [label = "Árbol sintáctico", shape = note, fillcolor = aliceblue];
    Analizador -> I -> Emulador
}
F -> Analizador
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

---

- **Programar** con un intérprete es una tarea **más rápida** de realizar que
  con un compilador, ya que, para poder ejecutar el programa, no hace falta
  compilar ni generar el código objeto, por lo que se evita dar un paso
  que en muchos casos puede llegar a consumir mucho tiempo.

- Por la misma razón, a muchos programadores les resulta **más cómodo** y
  fluido programar usando un intérprete (aunque con los modernos _entornos de
  desarrollo_ esto ya no supone tanta diferencia como antes).

- Sin embargo, si el programa fuente tiene _errores sintácticos_ (o ciertos
  errores de _semántica estática_), el intérprete no informará de ellos hasta
  el momento en el que intente ejecutar la instrucción errónea.

  Es decir: **esos errores se detectarán y se mostrarán en _tiempo de
  ejecución_**, no en _tiempo de compilación_.

- Por tanto, muchos errores que pueden ser detectados por un compilador sólo se
  podrán detectar cuando ya se esté ejecutando el programa, lo que hace que el
  coste (en tiempo y dinero) de corregir el error sea mucho mayor.

---

- Además, los programas interpretados suelen ser **varias veces más lentos**
  que los compilados, ya que:

  - hay que ir recorriendo continuamente el árbol sintáctico para encontrarse
    con las instrucciones que allí aparecen, lo que consume tiempo y memoria;

  - hay que traducir las instrucciones de la máquina abstracta a instrucciones
    de la máquina real, cosa que no se hace de una vez y para siempre, sino que
    **se va haciendo poco a poco a medida que se va encontrando con una nueva
    instrucción** al recorrer el árbol sintáctico.

- En cambio, **un compilador traduce todas las instrucciones de una vez y sólo
  una vez**, de forma que, al ejecutarlas, ya están todas traducidas al
  lenguaje objeto, formando el código objeto.

- Hay lenguajes *compilados* y lenguajes *interpretados*, e incluso lenguajes
  que son ambas cosas (tienen compiladores e intérpretes).

### Interactivos (*REPL*!ifdef(HTML)(&nbsp;)())

- A los intérpretes que hemos visto hasta ahora se les denomina **intérpretes
  por lotes**, ya que tratan al programa fuente como un lote de instrucciones
  conjuntas.

- A diferencia de los anteriores, los **intérpretes interactivos** son
  programas que solicitan al programador que introduzca por teclado, una a una,
  las instrucciones que se desean ejecutar, y el intérprete las va ejecutando a
  medida que el programador las va introduciendo.

- Su comportamiento se resume en el siguiente bucle:

  1. Leer la siguiente instrucción por teclado (_**R**ead_).

  2. Ejecutar o evaluar la instrucción (_**E**val_).

  3. Imprimir por la pantalla el resultado (_**P**rint_).

  4. Repetir el bucle (_**L**oop_).

---

- **Los _compiladores_ son ideales para:**

  - Desarrollar aplicaciones que demanden altas prestaciones y que necesiten
    sacar el máximo rendimiento de la máquina.

  - Acceder a los recursos de la máquina al más bajo nivel.

- **Los _intérpretes por lotes_ son ideales para:**

  - Desarrollo rápido de aplicaciones.

  - Escribir programas que requieran _portabilidad_, es decir, que el programa
    se pueda ejecutar en varias plataformas diferentes.

  - Escribir programas sencillos y rápidos que resuelvan tareas concretas.

- **Los _intérpretes interactivos_ son ideales para:**

  - Aprender conceptos de programación.

  - Experimentar con el lenguaje.

  - Probar rápidamente el efecto de una instrucción.

# Entornos integrados de desarrollo

## Definición

- Definición:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Un **entorno integrado de desarrollo** o **IDE** (del inglés, *Integrated
  Development Environment*), es una herramienta *software* que proporciona
  servicios que facilitan el desarrollo de software al programador.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Está formado por un **editor de textos** donde el programador puede codificar
  el programa en el lenguaje de programación correspondiente, alrededor del
  cual pueden orbitar una serie de herramientas satélite, como:

  - Herramientas visuales para la creación de *interfaces gráficas de usuario*
  - Sistemas de control de versiones
  - Visor de documentación
  - Intérpretes interactivos

---

- Asimismo, el editor de textos del IDE suele incorporar facilidades que ayudan
  a escribir código con más comodidad:

  - Resaltado de sintaxis

  - Autocompletado de código

  - Ayudas a la refactorización

- Los IDE suelen ir asociados a un lenguaje o grupo de lenguajes de
  programación concreto y, por lo tanto, son herramientas especializadas
  utilizadas para programar en el lenguaje o lenguajes para los que han sido
  diseñadas. Por ejemplo:

  - PyCharm es un IDE para programar en el lenguaje Python.

  - IntelliJ IDEA es un IDE para programar en el lenguaje Java.

## Editores de textos

- Un editor de textos, por contra, es una herramienta *software* que, en
  principio, sólo cuenta con la posibilidad de editar texto «plano» cuyo
  contenido puede ser de cualquier tipo (no necesariamente un código fuente).

- Al ser una herramienta general, no dispone de características específicas
  para escribir programas.

- Los principales editores de textos que podemos encontrar en el mercado son:

  - Vim
  - Emacs
  - Atom
  - Sublime Text
  - Visual Studio Code

### Editores vs. IDE

- Los mejores editores de textos son **extensibles**, es decir, es posible
  ampliar su funcionalidad por medio de *extensiones*.

- Esto hace que podamos personalizar su aspecto y funcionalidad hasta crear con
  ellos un IDE completo y ajustado a nuestras necesidades.

- Gracias a ello, podemos usar el mismo editor de textos tanto para crear
  documentos de texto genéricos como para escribir programas. Por tanto, sólo
  tenemos que aprender el manejo de una única herramienta.

- No obstante, los IDE suelen incorporar modos de funcionamiento que *imitan* a
  los de los editores de textos más conocidos (como Vim o Emacs).

### Thonny

- Es el IDE que vamos a usar en clase.

- Es *software* libre, y por tanto podemos usarlo sin ningún tipo de
  restricción.

- Además, está pensado para el principiante y proporciona una serie de ayudas
  pedagógicas muy interesantes para el que está aprendiendo Programación.

- Una vez estemos familiarizados con su entorno, podremos pasar a otras
  herramientas más usadas en la industria y más flexibles como Visual Studio
  Code, Spyder o PyCharm.

# El lenguaje de programación Python

## Historia

:::: columns

::: {.column width=60%}

- Python fue creado a finales de los ochenta por **Guido van Rossum** en el
  Centro para las Matemáticas y la Informática (CWI, Centrum Wiskunde &
  Informatica), en los Países Bajos, como un sucesor del lenguaje de
  programación ABC.

- El nombre del lenguaje proviene de la afición de su creador por los
  humoristas británicos **Monty Python**.

:::

::: {.column width=40%}

!IMGP(python.svg)(Logo de Python)(width=50%)(width=20%)

:::

::::

- Python alcanzó la versión 1.0 en enero de 1994.

- Python 2.0 se publicó en octubre de 2000 con muchas grandes mejoras.
  Actualmente, Python 2 está obsoleto.

- Python 3.0 se publicó en septiembre de 2008 y es una gran revisión del
  lenguaje que no es totalmente retrocompatible con Python 2.

## Características principales

- Python es un lenguaje **interpretado**, de **tipado dinámico** y
  **multiplataforma**, cuya filosofía hace hincapié en una sintaxis que
  favorezca un **código legible**.

- Es un lenguaje de programación **multiparadigma**. Esto significa que más que
  forzar a los programadores a adoptar un estilo particular de programación,
  permite varios estilos: **programación orientada a objetos**, **programación
  estructurada** y **programación funcional**.

- Es administrado por la **Python Software Foundation** y posee una licencia de
  **software libre**.

- La estructura de un programa se define por su anidamiento.

---

- Tiene una **gran biblioteca estándar**, usada para una diversidad de tareas.
  Esto viene de la filosofía «pilas incluidas» (*batteries included*) en
  referencia a los módulos de Python.

- La biblioteca estándar de Python es el conjunto de módulos y paquetes que
  vienen incluidos por defecto con la instalación de Python, sin necesidad de
  instalar nada adicional.

- Estos módulos proporcionan herramientas ya hechas para realizar tareas
  comunes, de forma que no tengas que reescribirlas desde cero.

---

- Por ejemplo, en la biblioteca estándar podemos encontrar:

  - Manipulación del sistema y del intérprete.

  - Estructuras de datos y utilidades.

  - Fechas, horas y calendarios.

  - Archivos y directorios.

  - Internet y protocolos.

  - Compresión y formatos.

  - Manejo de datos estructurados.

  - Matemáticas y estadística.

  - Seguridad y cifrado.

- En resumen, la biblioteca estándar de Python es como una «caja de
  herramientas oficial» que cubre la mayoría de las necesidades básicas y
  medias de un programa. Gracias a ella, muchas veces podemos resolver
  problemas sin instalar bibliotecas externas ni crear el código nosotros.

## Instalación

- **Instalación en Debian GNU/Linux:**

  1. Python 3 ya viene instalado en Debian, pero es conveniente ejecutar los
     siguientes comandos desde un terminal del sistema operativo:

     ```console
     $ sudo apt update
     $ sudo apt install python-is-python3 python3-pip
     $ mkdir -p ~/.local/bin
     ```

     Al acabar, cerrar la sesión con el sistema operativo y abrir una nueva
     antes de continuar.

  2. Asimismo, es conveniente instalar algunos paquetes adicionales, aunque no
     son obligatorios:

     ```console
     $ sudo apt install pylint mypy
     ```

---

- **Instalación en Windows:**

  1. Visitar
     [https://www.python.org/downloads/windows](https://www.python.org/downloads/windows)
     y descargar desde ahí la última versión estable.

  2. Durante la instalación, marcar la casilla que activa la opción de añadir
     comandos al _PATH_.

## Funcionamiento del intérprete

- El intérprete de Python tiene dos **modos de funcionamiento**:

  1. **Modo interactivo (_REPL_):** se abre una **sesión interactiva** con el
     intérprete donde éste nos solicita que introduzcamos una instrucción
     (sentencia o expresión) y, a continuación, la ejecuta inmediatamente, para
     luego volver a solicitar una nueva instrucción, repitiendo este ciclo
     indefinidamente en un **diálogo continuo entre el programador y el
     intérprete**.

     Es el modo más apropiado para aprender el lenguaje o hacer pruebas
     rápidas, y el que empezaremos a usar nosotros.

  2. **Modo por lotes:** el intérprete ejecuta un programa previamente escrito
     por el programador y almacenado en archivos fuente (llamados _scripts_)
     que contienen instrucciones que el intérprete va ejecutando una tras otra.

     Es el modo que utilizan los usuarios para ejecutar los programas
     previamente confeccionados por los programadores.

### Entrar y salir del intérprete interactivo

- Para entrar en el intérprete interactivo, se usa el comando `python` desde la
  línea de órdenes del sistema operativo:

  ```console
  $ python
  Python 3.13.3 (main, Apr 10 2025, 21:38:51) [GCC 14.2.0] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  >>>
  ```

  El mensaje que obtengamos puede que no sea exactamente igual, pero es
  importante comprobar que estamos usando Python 3 y no 2.

- Para salir, se pulsa `Ctrl+D` en Ubuntu o `Ctrl+Z` en Windows.

- El `>>>` es el *prompt* del intérprete de Python, desde el que se ejecutan
  las expresiones y sentencias que tecleemos:

  ```python
  >>> 4 + 3
  7
  >>>
  ```

!BIBLIOGRAFIA
