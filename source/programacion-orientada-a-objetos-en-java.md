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

- El operador `==` aplicado a dos objetos (valores de tipo referencia) devuelve !JAVA(true) si ambos son **el mismo objeto**.

- Es decir: el operador `==` compara la **identidad** de los objetos para preguntarse si son **idénticos**.

- Para usar un mecanismo más sofisticado, hay que usar el método !JAVA(equals).

### `equals`

- El método !JAVA(equals) compara dos objetos para preguntar si son iguales.

- Debería usarse siempre en sustitución del operador `==`, que sólo comprueba
  si son idénticos.

  ```java
  jshell> String s = new String("hola");
  s ==> "hola"

  jshell> String w = new String("hola");
  w ==> "hola"

  jshell> s == w
  $3 ==> false

  jshell> s.equals(w)
  $4 ==> true
  ```

### `compareTo`

- Un método parecido es !JAVA(compareTo), que compara dos objetos de forma que
  la expresión !JAVA(a.compareTo(b)) devuelve un entero:

  - !JAVA(-1) si !JAVA(a < b).

  - !JAVA(0) si !JAVA(a == b).

  - !JAVA(1) si !JAVA(a > b).

### `hashCode`

## Destrucción de objetos

### Recolección de basura

# Clases y objetos básicos en Java

## Clases envolventes (*wrapper*)

### *Boxing* y *Unboxing*

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

#### `System.arraycopy()`)

#### `.clone()`

### Comparación de *arrays*

#### `Arrays.equals()`

### Arrays multidimensionales

#### Declaración

#### Creación

#### Inicialización

#### `Arrays.deepEquals()`

