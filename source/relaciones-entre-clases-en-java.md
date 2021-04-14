---
title: Relaciones entre clases en Java
author: Ricardo Pérez López
!DATE
---

# Asociaciones básicas

## Agregación

- La **agregación** se consigue haciendo que el objeto agregador contenga,
  entre sus variables de instancia, una referencia al objeto agregado.

- Para que sea agregación, la vida del objeto agregado **no** debe depender
  necesariamente del objeto agregador; es decir, que al destruirse el objeto
  agregador, eso no signifique que se tenga que destruir también al objeto
  agregado.

- Eso implica que puede haber en el programa varias referencias al objeto
  agregado, no sólo la que almacena el agregador.

- Lo habitual en la agregación es que la variable de instancia que almacene la
  referencia al objeto agregado se asigne, o bien directamente (si la variable
  tiene la suficiente visibilidad) o bien a través de un método que reciba la
  referencia y se la asigne a la variable de instancia.

- Ese método puede ser (y suele ser) un constructor de la clase.

---

- Ejemplo:

  ```java
  class Agregador {
      private Agregado ag;

      public Agregador(Agregado ag) {
          setAg(ag);
      }

      public Agregado getAg() {
          return ag;
      }

      public void setAg(Agregado ag) {
          this.ag = ag;
      }
  }
  ```

- En la agregación, es frecuente encontrarnos con métodos _getter_ y _setter_
  para la variable de instancia que hace referencia al agregado.

## Composición

- La **composición** se consigue haciendo que el objeto compuesto contenga,
  entre sus variables de instancia, una referencia al objeto componente.

- Para que sea composición, la vida del objeto componente **debe depender**
  necesariamente del objeto compuesto; es decir, que al destruirse el objeto
  compuesto, se debe destruir también al objeto componente.

- Eso implica que sólo puede haber en el programa una sola referencia al objeto
  componente, que es la que almacena el objeto compuesto.

- Por eso, lo habitual en la composición es que el objeto compuesto sea el
  responsable de crear al objeto componente.

- Normalmente, no hay _setters_ para el componente y, en caso de haber
  _getters_, deberían devolver una copia del objeto componente, y no el objeto
  componente original.

# Generalización

## Declaración

- Java es un lenguaje con generalización simple, por lo que una clase sólo
  puede ser subclase directa de una única clase.

- La relación de generalización directa entre dos clases se declara en la
  propia definición de la subclase usando la cláusula !JAVA(extends):

  !ALGO
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(clase) ::= [!T(public)] [!T(abstract) | !T(final)] !T(class) !NT(subclase) !T(extends) !NT(superclase) !T({)
          !NT(miembro)*
  !T(})
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  donde !NT(subclase) y !NT(superclase) son los nombres de la subclase directa
  y la superclase directa, respectivamente.

- Cuando no se especifica la superclase directa a la hora de definir una clase,
  el compilador sobreentiende que esa clase es subclase directa de la clase
  !JAVA(Object).

## Subtipado entre tipos referencia

- A partir de ese momento, se introduce en el sistema de tipos una regla que
  dice que:

  !NT(subclase) $<_1$ !NT(superclase) <!-- _1 -->

- Por tanto, se puede decir que la subclase es un subtipo de la superclase.

## Herencia

## La clase `Object`

## Visibilidad protegida

# Polimorfismo

## El principio de sustitución de Liskov

## Conversiones entre tipos referencia

### *Widening*

### *Narrowing*

## Sobreescritura de métodos

### Sobreescritura y visibilidad

### `super`

### Covarianza en el tipo de retorno

### Invarianza en el tipo de los argumentos

### Sobreescritura de constructores

### Sobreescritura de `equals()`

### Sobreescritura de `hashCode()`

# Restricciones

## Clases y métodos abstractos

## Clases y métodos finales

