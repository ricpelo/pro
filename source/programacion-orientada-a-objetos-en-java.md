---
title: Programación orientada a objetos en Java
author: Ricardo Pérez López
!DATE
nocite: |
  @gosling_java_2014
---

# Uso básico de objetos

## Instanciación

### `new`

- La operación !JAVA(new) permite instanciar un objeto a partir de una clase.

- Hay que indicar el nombre de la clase y pasarle al constructor los argumentos
  que necesite, entre paréntesis y separados por comas. Los paréntesis son
  obligatorios aunque no haya argumentos.

- Por ejemplo, si tenemos una clase Triángulo cuyo constructor espera dos
  argumentos (ancho y alto), podemos crear una instancia de esa clase de la
  siguiente forma:

  ```java
  jshell> new Triangulo(20, 30);
  $1 ==> Triangulo@ee7d9f1

  jshell> Triangulo t = new Triangulo(4, 2);
  t ==> Triangulo@726f3b58
  ```

### `getClass`

- El método !JAVA(getClass()) devuelve la clase de la que es instancia el
  objeto sobre el que se ejecuta.

- Lo que devuelve es una instancia de la clase !JAVA(java.class.Class).

- Para obtener una cadena con el nombre de la clase, se puede usar el método
  !JAVA(getSimpleName()) definido en la clase !JAVA(Class):

  ```java
  jshell> String s = "Hola";
  s ==> "Hola"

  jshell> s.getClass()
  $2 ==> class java.lang.String

  jshell> s.getClass().getSimpleName()
  $3 ==> "String"
  ```

### `instanceof`

- El operador !JAVA(instanceof) permite comprobar si un objeto es instancia de
  una determinada clase.

- Por ejemplo:

  ```java
  jshell> "Hola" instanceof String
  $1 ==> true
  ```

- Sólo se puede aplicar a referencias, no a valores primitivos:

  ```java
  jshell> 4 instanceof String
  |  Error:
  |  unexpected type
  |    required: reference
  |    found:    int
  |  4 instanceof String
  |  ^
  ```

## Referencias

- Los objetos son accesibles a través de **referencias**.

- Las referencias se pueden almacenar en variables de **tipo referencia**.

- Por ejemplo, !JAVA(String) es una clase, y por tanto es un tipo referencia.
  Al hacer la siguiente declaración:

  ```java
  String s;
  ```

  estamos declarando `s` como una variable que puede contener una referencia a
  un valor de tipo !JAVA(String).

### `null`

- El tipo !JAVA(null) sólo tiene un valor: la referencia nula, representada por
  el literal !JAVA(null).

- El tipo !JAVA(null) es compatible con cualquier tipo referencia.

- Por tanto, una variable de tipo referencia siempre puede contener la
  referencia nula.

- En la declaración anterior:

  ```java
  String s;
  ```

  la variable `s` puede contener una referencia a un objeto de la clase
  !JAVA(String), o bien puede contener la referencia nula !JAVA(null).

- La referencia nula sirve para indicar que la variable no apunta a ningún
  objeto.

---

- Al intentar invocar a un método desde una referencia nula, se lanza una
  excepción !JAVA(NullPointerException):

  ```java
  jshell> String s;
  s ==> null

  jshell> s.concat("hola")
  |  Exception java.lang.NullPointerException
  |        at (#2:1)
  ```

## Comparación de objetos

- El operador `==` aplicado a dos objetos (valores de tipo referencia) devuelve
  !JAVA(true) si ambos son **el mismo objeto**.

- Es decir: el operador `==` compara la **identidad** de los objetos para
  preguntarse si son **idénticos**.

- Equivale al operador !PYTHON(is) de Python.

- Para usar un mecanismo más sofisticado que realmente pregunte si dos objetos
  son **iguales**, hay que usar el método !JAVA(equals).

### `equals`

- El método !JAVA(equals) compara dos objetos para comprobar si son iguales.

- Debería usarse siempre en sustitución del operador `==`, que sólo comprueba
  si son idénticos.

- Equivale al !PYTHON(__eq__) de Python, pero en Java hay que llamarlo
  explícitamente (no se llama implícitamente al usar `==`).

  ```java
  jshell> String s = new String("Hola");
  s ==> "Hola"

  jshell> String w = new String("Hola");
  w ==> "Hola"

  jshell> s == w
  $3 ==> false

  jshell> s.equals(w)
  $4 ==> true
  ```

---

- La implementación predeterminada del método !JAVA(equals) se hereda de la
  clase !JAVA{Object} (que ya sabemos que es la clase raíz de la jerarquía de
  clases en Java, por lo que toda clase acaba siendo subclase, directa o
  indirecta, de !JAVA{Object}).

- En dicha implementación predeterminada, !JAVA(equals) equivale a `==`:

  ```java
  public boolean equals(Object otro) {
      return this == otro;
  }
  ```

- Por ello, es importante sobreescribir dicho método al crear nuevas clases, ya
  que, de lo contrario, se comportaría igual que `==`.

### `compareTo`

- Un método parecido es !JAVA(compareTo), que compara dos objetos de forma que
  la expresión !JAVA(a.compareTo(b)) devuelve un entero:

  - !JAVA(-1) si !JAVA(a < b).

  - !JAVA(0) si !JAVA(a == b).

  - !JAVA(1) si !JAVA(a > b).

### `hashCode`

- El método !JAVA(hashCode) equivale al !PYTHON(__hash__) de Python.

- Como en Python, devuelve un número entero (en este caso, de 32 bits) asociado
  a cada objeto, de forma que si dos objetos son iguales, deben tener el mismo
  valor de !JAVA(hashCode).

- Por eso (al igual que ocurre en Python), el método !JAVA(hashCode) debe
  coordinarse con el método !JAVA(equals).

- A diferencia de lo que ocurre en Python, en Java **todos los objetos son
  _hashables_**. De hecho, no existe el concepto de _hashable_ en Java, ya que
  no tiene sentido.

- Este método se usa para acelerar la velocidad de almacenamiento y
  recuperación de objetos en determinadas colecciones como !JAVA(HashMap),
  !JAVA(HashSet) o !JAVA(Hashtable).

---

- La implementación predeterminada de !JAVA(hashCode) se hereda de la clase
  !JAVA(Object), y devuelve un valor que depende de la posición de memoria
  donde está almacenado el objeto.

- Al crear nuevas clases, es importante sobreescribir dicho método para que
  esté en consonancia con el método !JAVA(equals) y garantizar que siempre se
  cumple que:

  !CAJACENTRADA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $x$`.equals(`$y$`)`, entonces $x$`.hashCode()` `==` $y$`.hashCode()`.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  ```java
  jshell> "Hola".hashCode()
  $1 ==> 2255068
  ```

## Destrucción de objetos y recolección de basura

- Los objetos en Java no se destruyen explícitamente, sino que se marcan para
  ser eliminados cuando no hay ninguna referencia apuntándole:

  ```java
  jshell> String s = "Hola";  // Se crea el objeto y una referencia se guarda en «s»
  s ==> "Hola"

  jshell> s = null;           // Ya no hay más referencias al objeto, así que se marca
  s ==> null
  ```

- La próxima vez que se active el recolector de basura, el objeto se eliminará
  de la memoria.

# Clases y objetos básicos en Java

## Cadenas

- En Java, las cadenas son objetos.

- Por tanto, son valores referencia, instancias de una determinada clase.

- Existen dos tipos de cadenas:

  - Inmutables: instancias de la clase !JAVA(String).

  - Mutables: instancias de las clases !JAVA(StringBuffer) o
    !JAVA(StringBuilder).

### Inmutables

- Las cadenas inmutables son objetos de la clase !JAVA(String).

- Las cadenas literales (secuencias de caracteres encerradas entre dobles
  comillas !JAVA(")) son instancias de la clase !JAVA(String):

  ```java
  jshell> String s = "Hola";
  ```

- Otra forma de crear un objeto de la clase !JAVA(String) es instanciando dicha
  clase y pasándole otra cadena al constructor. De esta forma, se creará un
  nuevo objeto cadena con los mismos caracteres que la otra cadena:

  ```java
  jshell> String s = new String("Hola");
  ```

---

- Si se usa varias veces el mismo literal cadena, el JRE intenta aprovechar el
  objeto ya creado y no crea uno nuevo:

  ```java
  jshell> String s = "Hola";
  s ==> "Hola"

  jshell> String w = "Hola";
  w ==> "Hola"

  jshell> s == w
  $3 ==> true
  ```

- Las cadenas creadas mediante instanciación, siempre son objetos distintos:

  ```java
  jshell> String s = new String("Hola");
  s ==> "Hola"

  jshell> String w = new String("Hola");
  w ==> "Hola"

  jshell> s == w
  $3 ==> false
  ```

- Pregunta: ¿cuántos objetos cadena se crean en cada caso?

---

- Los objetos de la clase !JAVA(String) disponen de métodos que permiten
  realizar operaciones con cadenas.

- Muchos de ellos devuelven una nueva cadena a partir de la original tras una
  determinada transformación.

- Algunos métodos interesantes son:

  :::: columns

  ::: column

  - !JAVA(length)

  - !JAVA(indexOf)

  - !JAVA(lastIndexOf)

  - !JAVA(charAt)

  - !JAVA(repeat)

  - !JAVA(replace)

  :::

  ::: column

  - !JAVA(startsWith)

  - !JAVA(endsWith)

  - !JAVA(substring)

  - !JAVA(toUpperCase)

  - !JAVA(toLowerCase)

  :::

  ::::

---

- La clase !JAVA(String) también dispone de **métodos estáticos**.

- El más interesante es !JAVA(valueOf), que devuelve la representación en forma
  de cadena de su argumento:

  ```java
  jshell> String.valueOf(4)
  $1 ==> "4"

  jshell> String.valueOf(2.3)
  $2 ==> "2.3"

  jshell> String.valueOf('a')
  $3 ==> "a"
  ```

- No olvidemos que, en Java, los caracteres y las cadenas son tipos distintos:

  - Un carácter es un valor primitivo de tipo !JAVA(char) y sus literales se
    representan entre comillas simples (!JAVA('a')).

  - Una cadena es un valor referencia de tipo !JAVA(String) y sus literales se
    representan entre comillas dobles (!JAVA("a")).

### Mutables

- Un objeto de la clase !JAVA(String) no puede modificarse una vez creado.

- Es exactamente lo que ocurre con las cadenas en Python.

- En Java existen **cadenas mutables** que sí permiten su modificación después
  de haberse creado.

- Para ello, proporciona dos clases llamadas !JAVA(StringBuffer) y
  !JAVA(StringBuilder), cuyas instancias son cadenas mutables.

- Las dos funcionan prácticamente de la misma forma, con la única diferencia de
  que los objetos !JAVA(StringBuffer) permiten sincronización entre hilos
  mientras que los !JAVA(StringBuilder) no.

- Cuando se está ejecutando un único hilo, es preferible usar objetos
  !JAVA(StringBuilder) ya que son más eficientes.

---

- Se puede crear un objeto !JAVA(StringBuilder) vacío o a partir de una cadena:

  ```java
  jshell> StringBuilder sb = new StringBuilder();       // Crea uno vacío
  sb ==>

  jshell> StringBuilder sb = new StringBuilder("Hola"); // O a partir de una cadena
  sb ==> "Hola"
  ```

#### `StringTokenizer`

- La clase !JAVA(StringTokenizer) permite romper una cadena en _tokens_.

- El método de _tokenización_ consiste en buscar los elementos separados por
  delimitadores, que son los caracteres que separan los _tokens_.

- Esos delimitadores pueden especificarse en el momento de crear el
  _tokenizador_ o bien _token_ a _token_.

- Por ejemplo:

  ```java
  StringTokenizer st = new StringTokenizer("esto es una prueba");
  while (st.hasMoreTokens()) {
      System.out.println(st.nextToken());
  }
  ```

  produce la siguiente salida:

  ```
  esto
  es
  una
  prueba
  ```

---

- La clase !JAVA(StringTokenizer) se mantiene por compatibilidad pero su uso no
  se recomienda en código nuevo.

- En su lugar, se recomienda usar el método !JAVA(split) de la clase
  !JAVA(String) o el paquete !JAVA(java.util.regex).

- Por ejemplo:

  ```java
  String[] result = "esto es una prueba".split("\\s");
  for (int x = 0; x < result.length; x++)
      System.out.println(result[x]);
  ```

- Los métodos definidos en la clase `String` se pueden consultar en la API de
  Java:

[https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/String.html](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/String.html)

### Conversión a `String`

- La conversión de un objeto a !JAVA(String) se realiza llamando al método
  !JAVA(toString) del objeto.

- Todo objeto, sea de la clase que sea, tiene un método !JAVA(toString)
  heredado de la clase !JAVA(Object) y posiblemente sobreescribiéndo éste.

- Si es un valor primitivo, primero se convierte a instancia de su clase
  _wrapper_ correspondiente.

### Concatenación de cadenas

- La operación de concatenación de cadenas se realiza con el operador `+`:

  ```java
  jshell> "hola " + "mundo"
  $1 ==> "hola mundo"
  ```

- También existe el método !JAVA(concat), que hace lo mismo:

  ```java
  jshell> "hola ".concat("mundo")
  $1 ==> "hola mundo"
  ```

### Comparación de cadenas

- En las cadenas, las comparaciones se pueden realizar:

  - Con el operador `==`:

    ```java
    jshell> "hola" == "hola"
    true
    ```

    No es conveniente, ya que comprueba si los dos objetos son el mismo.

  - Con el método !JAVA(equals):

    ```java
    jshell> "hola".equals("hola")
    true
    ```

    Comprueba si las dos cadenas tienen los mismos caracteres.

  - Con el método !JAVA(compareTo):

    ```java
    jshell> "hola".compareTo("adiós")
    7
    ```

### Diferencias entre literales cadena y objetos `String`

- Los literales cadena se almacenan en un _pool_ de cadenas y se reutilizan
  siempre que se puede.

- Los objetos !JAVA(String) van asociados a un literal cadena almacenado en el
  _pool_.

- Se puede acceder a ese literal del objeto cadena usando el método
  !JAVA(intern):

  ```java
  jshell> String s = new String("hola");
  s ==> "hola"

  jshell> String w = new String("hola");
  w ==> "hola"

  jshell> s == w
  $3 ==> false

  jshell> s.intern() == w.intern()
  $4 ==> true
  ```

## Clases envolventes (*wrapper*!if(HTML)(&nbsp;)())

- Las **clases envolventes** (también llamadas **clases _wrapper_**) son clases
  cuyas instancias representan valores primitivos almacenados dentro de valores
  referencia.

- Esos valores referencia _envuelven_ al valor primitivo dentro de un objeto.

- Se utilizan en contextos en los que se necesita manipular un dato primitivo
  como si fuera un objeto, de una forma sencilla y transparente.

---

- Existe una clase _wrapper_ para cada tipo primitivo:

  -----------------------------------------------------
  Clase _wrapper_               Tipo primitivo
  ----------------------------- -----------------------
  !JAVA(java.lang.Boolean)      !JAVA(bool)

  !JAVA(java.lang.Byte)         !JAVA(byte)

  !JAVA(java.lang.Short)        !JAVA(short)

  !JAVA(java.lang.Character)    !JAVA(char)

  !JAVA(java.lang.Integer)      !JAVA(int)

  !JAVA(java.lang.Long)         !JAVA(long)

  !JAVA(java.lang.Float)        !JAVA(float)

  !JAVA(java.lang.Double)       !JAVA(double)
  -----------------------------------------------------

- Los objetos de estas clases disponen de métodos para acceder a los valores
  envueltos dentro del objeto.

---

- Por ejemplo:

  ```java
  jshell> Integer x = new Integer(4);
  x ==> 4

  jshell> x.floatValue()
  $2 ==> 4.0

  jshell> Boolean y = new Boolean(true);
  y ==> true

  jshell> y.shortValue()
  |  Error:
  |  cannot find symbol
  |    symbol:   method shortValue()
  |  y.shortValue()
  |  ^----------^
  ```

---

- A partir de JDK 9, los constructores _wrapper_ de tipo han quedado obsoletos.

- Actualmente, se recomienda que usar uno de los métodos estáticos
  !JAVA(valueOf) para obtener un objeto _wrapper_.

- El método es un miembro estático de todas las clases _wrappers_ y todas las
  clases numéricas admiten formas que convierten un valor numérico o una cadena
  en un objeto.

- Por ejemplo:

  ```java
  jshell> Integer i = Integer.valueOf(100);
  i ==> 100
  ```

### *Boxing*!if(HTML)(&nbsp;)() y *unboxing*

- El **_boxing_** es el proceso de _envolver_ un valor primitivo en una
  referencia a una instancia de su correspondiente clase _wrapper_. Por
  ejemplo:

  ```java
  jshell> Integer x = new Integer(4);
  x ==> 4

  jshell> x.getClass()
  $2 ==> class java.lang.Integer
  ```

- El **_unboxing_** es el proceso de extraer un valor primitivo a partir de una
  instancia de su correspondiente clase _wrapper_. Por ejemplo:

  ```java
  jshell> Integer i = Integer.valueOf(100);
  i ==> 100

  jshell> int j = i.intValue();
  j ==> 100
  ```

- A partir de JDK 5, este proceso se puede llevar a cabo automáticamente
  mediante el **_autoboxing_** y el **_autounboxing_**.

### *Autoboxing*!if(HTML)(&nbsp;)() y *autounboxing*

- El **_autoboxing_** es el mecanismo que convierte automáticamente un valor
  primitivo en una referencia a una instancia de su correspondiente clase
  _wrapper_. Por ejemplo:

  ```java
  jshell> Integer x = 4;
  x ==> 4

  jshell> x.getClass()
  $2 ==> class java.lang.Integer
  ```

- El **_autounboxing_** es el mecanismo que convierte automáticamente una
  instancia de una clase _wrapper_ en su valor primitivo equivalente. Por
  ejemplo:

  ```java
  public class Prueba {
      public static void main(String[] args) {
          Integer i = new Integer(4);
          int res = cuadrado(i);       // Se envía un Integer
          System.out.println(res);
      }
      public static cuadrado(int x) {  // Se recibe un int
          return x ** x;
      }
  }
  ```

# *Arrays*

## Definición

- En Java, un **_array_** es un dato mutable compuesto por elementos (también
  llamados **componentes**) a los que se accede mediante **_indexación_**, es
  decir, indicando la posición donde se encuentra almacenado el elemento
  deseado dentro del _array_.

- Se parece a las **listas** de Python, con las siguientes diferencias:

  - Cada _array_ tiene una **longitud fija** (no puede crecer o encogerse de
    tamaño dinámicamente).

  - Todos los elementos de un _array_ deben ser del **mismo tipo**, el cual
    debe indicarse en la declaración del _array_.

- Los _arrays_ en Java pueden contener valores primitivos o referencias a
  objetos.

- Los _arrays_ de Java son **objetos** y, por tanto, son valores referencia.

## Declaración

- Los _arrays_ se declaran indicando el tipo del elemento que contienen,
  seguido de `[]`.

- Por ejemplo, para declarar un _array_ de enteros, se puede hacer:

  ```java
  int[] x;
  ```

  Ahora mismo, `x` es una referencia a un objeto _array_ que puede contener
  elementos de tipo `int`. Como la variable `x` aún no ha sido inicializada, el
  valor que contiene es la referencia nula (`null`):

  ```java
  jshell> int[] x;
  x ==> null
  ```

- Por tanto, `x` puede hacer referencia a un _array_ de enteros, pero
  actualmente no hace referencia a ninguno.

## Creación

- A esa variable le podemos asignar una referencia a un objeto _array_ del tipo
  adecuado.

- Para ello, se puede crear un objeto _array_ usando el operador !JAVA(new) e
  indicando el tipo de los elementos y la longitud del _array_ (entre
  corchetes):

  ```java
  jshell> x = new int[5];
  x ==> int[5] { 0, 0, 0, 0, 0 }
  ```

  A partir de este momento, la variable `x` contiene una referencia a un objeto
  _array_ de cinco elementos de tipo !JAVA(int) que, ahora mismo, tienen todos
  el valor !JAVA(0).

- Como se puede observar, los elementos de un _array_ siempre se inicializan a
  un **valor por defecto** cuando se crea el _array_ (!JAVA(0) en enteros,
  !JAVA(0.0) en reales, !JAVA(false) en _booleanos_, !JAVA('\000') en
  caracteres y !JAVA(null) en valores referencia).

## Inicialización

- También se pueden inicializar los elementos de un _array_ en el momento en
  que se crea con !JAVA(new).

- En ese caso:

  - Se indican los valores de los elementos del _array_ entre llaves.

  - No se indica la longitud del array, ya que se deduce a partir de la lista
    de valores iniciales.

- Por ejemplo:

  ```java
  jshell> int[] x = new int[] {6, 5, 27, 81};
  x ==> int[4] { 6, 5, 27, 81 }
  ```

## Acceso a elementos

- Para **acceder** a un elemento del _array_ se usa el operador de _indexación_
  (los corchetes):

  ```java
  jshell> int[] x = new int[] {6, 5, 27, 81};
  x ==> int[4] { 6, 5, 27, 81 }

  jshell> x[3]
  $2 ==> 81
  ```

- Los elementos se indexan de 0 a $n - 1$, siendo $n$ la longitud del _array_.

- Si se intenta acceder a un elemento fuera de esos límites, se levanta una
  excepción !JAVA(java.lang.ArrayIndexOutOfBoundsException):

  ```java
  jshell> x[4]
  |  Exception java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
  |        at (#3:1)
  ```

## Longitud de un _array_

- Para conocer la longitud de un _array_, se puede consultar el atributo
  !JAVA(length):

  ```java
  jshell> x.length
  4
  ```

- Ese valor es constante y no se puede cambiar:

  ```java
  jshell> x.length = 44
  |  Error:
  |  cannot assign a value to final variable length
  |  x.length = 43
  |  ^------^
  ```

## Modificación de elementos

- Para cambiar un elemento del _array_ por otro, se puede usar la _indexación_
  combinada con la _asignación_:

  ```java
  jshell> x[2] = 99;
  $5 ==> 99

  jshell> x
  x ==> int[4] { 6, 5, 99, 81 }
  ```

- El compilador comprueba que el valor a asignar es del tipo correcto, e impide
  la operación si se ve obligado a hacer un _narrowing_ para hacer que el tipo
  del valor sea compatible con el tipo del elemento:

  ```java
  shell> x[2] = 99.9;
  |  Error:
  |  incompatible types: possible lossy conversion from double to int
  |  x[2] = 99.9;
  |         ^--^
  ```

## _Arrays_!if(HTML)(&nbsp;)() de tipos referencia

- Los elementos de un _array_ también pueden ser valores referencia.

- En ese caso, sus elementos serán objetos de una determinada clase.

- Inicialmente, los elementos referencia del _array_ toman el valor
  !JAVA(null).

- Por ejemplo:

  ```java
  jshell> String[] cadenas = new String[5];
  cadenas ==> String[5] { null, null, null, null, null }
  ```

- En cada elemento de `cadenas` podremos meter una instancia de la clase
  !JAVA(String):

  ```java
  jshell> cadenas[2] = "hola";
  $2 ==> "hola"

  jshell> cadenas
  cadenas ==> String[5] { null, null, "hola", null, null }
  ```

---

- También podemos inicializar el _array_ con objetos:

  ```python
  jshell> String[] cadenas = new String[] { "hola", "adiós", "prueba" };
  cadenas ==> String[3] { "hola", "adiós", "prueba" }

  jshell> cadenas[1]
  $2 ==> "adiós"

  jshell> cadenas.length
  $3 ==> 3
  ```

---

- Hemos dicho que los elementos de un _array_ de tipos referencia deben ser
  objetos de una determinada clase, que es la clase indicada al declarar el
  _array_.

- Pero por el principio de sustitución, esos elementos también pueden ser
  instancias de una subclase de esa clase.

- Por ejemplo, si tenemos la clase `Figura` y una subclase suya llamada
  `Triangulo`:

  ```java
  jshell> Figura[] figuras = new Figura[5];
  figuras ==> Figura[5] { null, null, null, null, null }
  ```

- En cada elemento de `figuras` podremos meter una instancia de la clase
  `Figura` o de cualquier subclase suya:

  ```java
  jshell> figuras[2] = new Triangulo(20, 30);  // alto y ancho
  $8 ==> Triangulo@1b701da1

  jshell> figuras
  figuras ==> Figura[5] { null, null, Triangulo@1b701da1, null, null }
  ```

---

- Si declaramos un _array_ de tipo !JAVA(Object[]), estamos diciendo que sus
  elementos pueden ser de cualquier tipo referencia, lo que tiene ventajas e
  inconvenientes:

  - Ventaja: los elementos del _array_ podrán ser de cualquier tipo, incluyendo
    tipos primitivos (recordemos el _boxing_/_unboxing_).

  - Inconveniente: no podremos aprovechar el comprobador de tipos del
    compilador para determinar si los tipos son los adecuados, por lo que
    tendremos que hacerlo a mano en tiempo de ejecución.

## Subtipado entre _arrays_

- Entre los tipos de _arrays_ se define una relación de subtipado «$<_1$»
  similar a la que hemos visto hasta ahora.

- Resumiendo, las reglas que definen esa relación son las siguientes:

  - Si $S$ y $T$ son tipos referencia, entonces $S$`[]` $<_1$ $T$`[]` si y sólo
    si $S <_1 T$.

  - `Object[]` $<_1$ `Object`.

  - Si $P$ es un tipo primitivo, entonces $P$`[]` $<_1$ `Object`.

## `java.util.Arrays`

- La clase !JAVA(java.util.Arrays) contiene varios métodos estáticos para
  manipular _arrays_, incluyendo ordenación y búsqueda.

- También contiene una fábrica estática que permite ver a los _arrays_ como
  listas, lo que será de interés cuando veamos las listas en Java.

- Los métodos de esta clase lanzan todos una excepción
  !JAVA(NullPointerException) cuando el _array_ especificado es una referencia
  nula.

- Su documentación se encuentra en el API de Java:

[https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/util/Arrays.html](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/util/Arrays.html)

## Copia y redimensionado de arrays

- Para hacer una copia de un _array_
### `Arrays.copyOf()`

### `System.arraycopy()`

### `.clone()`

## Comparación de *arrays*

### `Arrays.equals()`

## Arrays multidimensionales

### Declaración

### Creación

### Inicialización

### `Arrays.deepEquals()`

!BIBLIOGRAFIA
