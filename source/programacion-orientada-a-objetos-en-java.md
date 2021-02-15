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


### `getClass()`

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

- Actualmente, se recomienda que usar uno de los métodos !JAVA(valueOf) para
  obtener un objeto _wrapper_.

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

## Cadenas

### Inmutables

#### `String`

### Mutables

#### `StringBuffer`

#### `StringBuilder`

#### `StringTokenizer`

### Conversión a `String`

### Concatenación de cadenas

### Comparación de cadenas

### Diferencias entre literales cadena y objetos `String`

## *Arrays*

### De tipos primitivos

#### Declaración

#### Creación

#### Inicialización

### `.length`

### De objetos

#### Declaración

#### Creación

#### Inicialización

### Subtipado entre _arrays_

### `java.util.Arrays`

### Copia y redimensionado de arrays

#### `Arrays.copyOf()`

#### `System.arraycopy()`

#### `.clone()`

### Comparación de *arrays*

#### `Arrays.equals()`

### Arrays multidimensionales

#### Declaración

#### Creación

#### Inicialización

#### `Arrays.deepEquals()`

