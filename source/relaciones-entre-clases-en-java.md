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

- **No es posible crear subclases de _clases finales_**, que son las clases
  declaradas con el modificador !JAVA(final).

## Subtipado entre tipos referencia

- A partir de ese momento, se introduce en el sistema de tipos una regla que
  dice que:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(subclase) $<_1$ !NT(superclase) <!-- _1 -->
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Por tanto, se puede decir que el tipo definido por la subclase es un subtipo
  del tipo definido por la superclase.

- Esto va a permitir, entre otras cosas, el **polimorfismo** entre la subclase
  y la superclase.

## Herencia

- Mediante el mecanismo de la herencia, una subclase hereda ciertos miembros de
  sus superclases (directas o indirectas), dependiendo de la visibilidad de
  esos miembros.

- Los miembros con visibilidad **privada** no se heredan.

- Los miembros con visibilidad **pública** se heredan siempre.

- Los miembros con visibilidad **predeterminada** se heredan si la subclase y
  la superclase pertenecen al mismo paquete.

- Los miembros con visibilidad **protegida** se heredan siempre, aunque la
  subclase y la superclase pertenezcan a paquetes distintos.

## La clase `Object`

- La clase !JAVA(Object) es la raíz de la jerarquía de clases en Java.

- Toda clase en Java es subclase (directa o indirecta) de !JAVA(Object).

- Eso significa que todas las clases heredarán los métodos definidos en
  !JAVA(Object).

- Los más interesantes son !JAVA(equals), !JAVA(hashCode) y !JAVA(toString).

- Más información en:

  [https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/Object.html](https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/Object.html)

## Visibilidad protegida

- La visibilidad protegida está pensada para cuando queremos limitar la
  visibilidad de un miembro de una clase a sus posibles subclases.

- Pero no debemos olvidar que, en Java, un miembro con visibilidad protegida
  también puede ser accesible desde cualquier clase que pertenezca al mismo
  paquete que la clase donde está declarado el miembro.

- Las variables protegidas de una clase son visibles para sus subclases, pero
  sólo a través de objetos del tipo de la subclase o sus subtipos.

  En otras palabras, **una subclase puede ver una variable protegida de su
  superclase como una variable heredada, pero no puede acceder a esa misma
  variable a través de una referencia a la propia superclase**.

---

- Esto puede parecer un poco confuso al principio, ya que puede que no resulte
  obvio que los modificadores de visibilidad no restringen el acceso entre
  instancias de la misma clase de la misma manera que restringen el acceso
  entre instancias de diferentes clases.

- **Dos instancias de la misma clase pueden acceder a todos los miembros de la
  otra, incluidos los privados, siempre que se acceda a través de una
  referencia del tipo correcto**.

  Dicho de otra manera: dos instancias de `Gato` pueden acceder a todas las
  variables y métodos de cada uno (incluidos los privados), pero un `Gato` no
  puede acceder a un miembro protegido de una instancia de `Animal` a menos que
  el compilador pueda probar que el `Animal` es un `Gato`.

# Polimorfismo

## El principio de sustitución de Liskov

- Recordemos que, por el principio de sustitución de Liskov, se puede usar una
  instancia de una clase allí donde se espere una instancia de una superclase
  suya:

  ```java
  Base b = new Derivada();   // Si «Derivada» es subclase de «Base»
  ```

  Eso hace que el tipo estático y el tipo dinámico de `b` puedan no coincidir.

- ¿Qué ocurre si intentamos invocar un método sobre `b`?

  ```java
  b.metodo();
  ```

- En un lenguaje de tipado estático como Java, el compilador comprueba que el
  método que se quiere invocar sobre un objeto es compatible con el tipo
  declarado (el tipo _estático_) para ese objeto.

- Eso quiere decir que el compilador tiene que determinar, en tiempo de
  compilación, si un objeto de ese tipo puede responder a la invocación de ese
  método.

### Ligadura temprana (*early binding*!ifdef(HTML)(&nbsp;)())

- Para ello (es decir, para comprobar si el método es compatible con el tipo
  del objeto), el compilador hace un análisis estático de la expresión en la
  que se invoca al método para determinar cuál es el tipo estático del objeto
  sobre el que se está invocando.

- Eso significa que, en la invocación:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !NT(expr)`.m()`
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  el compilador determina el tipo de !NT(expr) en tiempo de compilación, y
  comprueba si el método `m` es compatible con ese tipo.

  Por ejemplo, si ese tipo es una clase, comprueba si el método está definido
  en esa clase.

- Como esa comprobación se hace en tiempo de compilación y buscando el tipo
  estático, al mecanismo de comprobación de la existencia del método se le
  denomina **ligadura temprana (_early binding_)**.

---

- Ejemplos:

  - Si se está invocando el método sobre una variable, el tipo será el tipo
    estático de la variable:

    ```java
    Trabajador t; // Declara la variable de tipo «Trabajador» (tipo estático)
    t = new Docente(); // «t» contiene una referencia a un objeto
    t.despedir(); // El método «despedir» debe ser compatible con «Trabajador»
    ```

  - Si se está invocando el método sobre una expresión más complicada, el tipo
    será el tipo de esa expresión calculado por el compilador en tiempo de
    compilación:

    ```java
    // El método «despedir» debe ser compatible con «Docente», porque un
    // docente es un trabajador:
    (new Docente()).despedir(); 
    ```

    Aquí, la expresión !JAVA{(new Docente())} tiene el tipo `Docente`, cosa que
    el compilador puede calcular perfectamente.

## Sobreescritura de métodos

- Los métodos heredados desde una superclase (siempre que no se hayan marcado
  como !JAVA(final)) se pueden sobreescribir.

- **_Sobreescribir_ o _redefinir_ un método heredado** consiste en definir, en
  la subclase, un método (el método que _sobreescribe_ o que _redefine_) con el
  mismo nombre y la misma lista de parámetros que el método heredado de la
  superclase (el método _sobreescrito_ o _redefinido_).

- El tipo de retorno del método que redefine tiene que ser _compatible_ con
  el tipo de retorno del método redefinido, cosa que estudiaremos luego con más
  profundidad.

  Por ahora sólo diremos que si dos tipos de retorno son iguales, entonces son
  compatibles.

- En Java, se recomienda (pero no es obligatorio) que el método que redefine
  (el de la subclase) se defina usando el decorador !JAVA(@Override).

---

- Ejemplo:

  ```java
  class Base {
      public String hola(String s) {
          return "Hola, " + s + ", soy la clase Base";
      }
  }

  class Derivada extends Base {
      @Override
      public String hola(String s) {
          return "Hola, " + s + ", soy la clase Derivada";
      }
  }
  ```

### Despacho dinámico (*dynamic dispatch*!ifdef(HTML)(&nbsp;)())

- Al invocar un método sobre un objeto, **el método concreto que se ejecutará
  dependerá del _tipo dinámico_ del objeto sobre el que se invoca el método**.

- Por tanto, el método que acabará ejecutándose se elige en tiempo de ejecución
  dependiendo del objeto que recibe el mensaje, es decir, dependiendo del
  objeto sobre el que se está intentando invocar el método.

- A este mecanismo se le denomina **despacho dinámico (_dynamic dispatch_)**.

!CAJA
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
**Java implementa el despacho dinámico** en todos los métodos excepto en los
!JAVA(private), !JAVA(final) o !JAVA(static).
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

!EJEMPLO

```java
class Base {
    public String hola(String s) {
        return "Hola, " + s + ", soy la clase Base";
    }
}

class Derivada extends Base {
    @Override
    public String hola(String s) {
        return "Hola, " + s + ", soy la clase Derivada";
    }
}

class Principal {
    public static void main(String[] args) {
        Base a = new Base();
        Derivada b = new Derivada();
        Base c = new Derivada();
        a.hola("Pepe");           // Invoca el «hola» de «Base»
        b.hola("Pepe");           // Invoca el «hola» de «Derivada»
        c.hola("Pepe");           // Invoca el «hola» de «Derivada»
    }
}
```

:::: columns

::: column

- Imprime:

:::

::: column

```
Hola, Pepe, soy la clase Base
Hola, Pepe, soy la clase Derivada
Hola, Pepe, soy la clase Derivada
```

:::

::::

---

- La **ligadura temprana (_early binding_)** garantiza, _en tiempo de
  compilación_, que es seguro ejecutar el método `hola` sobre los objetos que
  hay en las variables `a`, `b` y `c`, ya que todas ellas tienen un tipo
  estático compatible con la existencia de un método `hola` (las clases `Base`
  y `Derivada` disponen del método `hola`).

- El **despacho dinámico (_dynamic dispatch_)** selecciona, _en tiempo de
  ejecución_, el método concreto que se ejecutará al invocar al método `hola`
  sobre los objetos que hay en las variables `a`, `b` y `c`, según el tipo
  dinámico del objeto que recibe el mensaje.

  Por ejemplo:

  - El objeto que hay en la variable `a` es una instancia de `Base`, por lo que
    el método `hola` que se ejecutará será el de `Base`.

  - El objeto que hay en la variable `c` es una instancia de `Derivada`, por lo
    que el método `hola` que se ejecutará será el de `Derivada`.

  Esto es así aunque ambas variables (`a` y `c`) estén declaradas de tipo
  `Base`, porque lo que importa aquí es el tipo dinámico, no el estático.

---

- En el siguiente ejemplo, un método llama a otro. El método que se ejecute
  dependerá del tipo dinámico del objeto sobre el que se invoque:

  ```{.java .number-lines}
  class Base {
      public void hola() {
          System.out.println(nombre());
      }

      public String nombre() {
          return "Base";
      }
  }

  class Derivada extends Base {
      public String nombre() {
          return "Derivada";
      }
  }

  public class Principal {
      public static void main(String[] args) {
          Base b = new Derivada();
          b.hola();
      }
  }
  ```

- Imprime:

  ```
  Derivada
  ```

---

- El motivo por el que el método `hola` imprime `Derivada` y no `Base` es el
  siguiente:

  - El método es invocado sobre un objeto de la clase `Derivada`.

  - El método no está redefinido; tan sólo existe un método `hola` y está en la
    clase `Base`.

  - Por tanto, dentro de ese método, la referencia !JAVA(this) tiene el tipo
    estático `Base`.

  - En cambio, en esa invocación concreta del método, !JAVA(this) tiene el tipo
    dinámico `Derivada`.

  - La sentencia de la línea 3 equivale a la siguiente (con el !JAVA(this)):

    ```java
    System.out.println(this.nombre());
    ```

    en la que se invoca a `nombre` sobre un objeto cuyo tipo dinámico es
    `Derivada`.

  - Por tanto, se acaba invocando al método `nombre` de `Derivada`, que
    devuelve `Derivada`.

### Sobreescritura y visibilidad

- **La subclase no puede reducir la visibilidad del método redefinido**. Por
  tanto, el método que redefine debe tener, al menos, la misma visibilidad que
  el método redefinido, pero nunca menos.

  ```java
  class Base {
      protected String hola(String s) {
          return "Hola, " + s + ", soy la clase Base";
      }
  }

  class Derivada extends Base {
      @Override
      private String hola(String s) {    // Error: reduce la visibilidad
          return "Hola, " + s + ", soy la clase Derivada";
      }
  }
  ```

- Sí que se puede ampliar la visibilidad:

  ```java
  class Derivada extends Base {
      @Override
      private String hola(String s) {    // Esto sí se permite
          return "Hola, " + s + ", soy la clase Derivada";
      }
  }
  ```

---

- Esta restricción tiene sentido si recordamos que un dato de un subtipo debe
  poder usarse en cualquier sitio donde se espere un dato de un supertipo.

- Por ejemplo, un `Mamífero` es una subclase de `Animal` y, por tanto, debe
  poderse usar allí donde se espere un `Animal`.

  Es decir: un `Mamífero` es un `Animal`.

- Si pudiéramos sobreescribir un método con otro método menos visible, entonces
  podríamos tener el problema de que el `Mamífero` no podría ser capaz de hacer
  todo lo que puede hacer un `Animal`.

### Sobreescritura de variables

- Las variables (de instancia o estáticas) de una clase se pueden redefinir sin
  restricción alguna, simplemente declarando en la subclase una variable con el
  mismo nombre que la variable heredada de una superclase, sin importar el
  tipo.

- Por tanto, las dos variables (la definida en la subclase y la definida en la
  superclase) pueden tener el mismo nombre pero distinto tipo.

- Asimismo, las dos variables pueden tener cualquier visibilidad; es decir, la
  visibilidad de ambas variables es independiente una de la otra.

- A todos los efectos, **son variables completamente diferentes**.

- Es como si la variable de la subclase **hiciese sombra** a la de la
  superclase.

---

- Aquí, las dos variables de instancia `x` son distintas e independientes:

  ```java
  class Base {
      public int x;                       // Esta es una variable...
  }

  class Derivada extends Base {
      protected String x;                 // ... y esta es otra distinta

      public String getX() {
          return x;                       // Accede a la «x» de Derivada
      }
  }

  public class Prueba {
      public static void main(String[] args) {
          Base b = new Base();
          Derivada d = new Derivada();
          Base bd = new Derivada();
          b.x = 4;                        // Accede a la «x» de Base
          d.x = "Hola";                   // Accede a la «x» de Derivada
          bd.x = 5;                       // Accede a la «x» de Base
          System.out.println(d.getX());   // Imprime «Hola»
          System.out.println(bd.getX());  // Imprime «Hola»
      }
  }
  ```

:::: columns

::: column

- Imprime:

:::

::: column

  ```
  Hola
  Hola
  ```

:::

::::

---

- Con las variables no se hace _despacho dinámico_, sino _ligadura temprana_.
  Por tanto, **las variables se resuelven en tiempo de compilación**, lo que
  puede dar lugar a resultados sorprendentes.

:::: columns

::: column

- Por ejemplo:

  ```java
  class Base {
      public String nombre = "Base";

      public String getNombre() {
          return nombre;
      }
  }

  class Derivada extends Base {
      protected String nombre = "Derivada";
  }

  public class Prueba {
      public static void main(String[] args) {
          Base b = new Base();
          Derivada d = new Derivada();
          Base bd = new Derivada();
          System.out.println(b.getNombre());
          System.out.println(d.getNombre());
          System.out.println(bd.getNombre());
      }
  }
  ```

:::

::: column

- Imprime:

  ```
  Base
  Base
  Base
  ```

:::

::::

---

:::: columns

::: column

- En cambio, si se redefine el método `getNombre`, el resultado es distinto:

  ```java
  class Base {
      public String nombre = "Base";

      public String getNombre() {
          return nombre;
      }
  }

  class Derivada extends Base {
      protected String nombre = "Derivada";

      public String getNombre() {
          return nombre;
      }
  }

  public class Prueba {
      public static void main(String[] args) {
          Base b = new Base();
          Derivada d = new Derivada();
          Base bd = new Derivada();
          System.out.println(b.getNombre());
          System.out.println(d.getNombre());
          System.out.println(bd.getNombre());
      }
  }
  ```

:::

::: column

- Imprime:

  ```
  Base
  Derivada
  Derivada
  ```

:::

::::

---

- El motivo es que la ligadura temprana tiene en cuenta el **tipo estático** de
  un objeto (no el dinámico) al resolver una variable de instancia del objeto.

- Recordemos que:

  ```java
  public String getNombre() {
      return nombre; 
  }
  ```

  equivale a:

  ```java
  public String getNombre() {
      return this.nombre; 
  }
  ```

- En el método `getNombre` de `Base`, la referencia !JAVA(this) tiene el tipo
  estático `Base`. Por eso, el `getNombre` de `Base` accede siempre al `nombre`
  de `Base`.

- En cambio, en el mismo método redefinido en `Derivada`, la referencia
  !JAVA(this) tiene el tipo estático `Derivada`. Por eso, el `getNombre` de
  `Derivada` accede siempre al `nombre` de `Derivada`.

---

- Por tanto, en el siguiente código:

  ```java
  Base b = new Base();
  Derivada d = new Derivada();
  Base bd = new Derivada();
  System.out.println(b.getNombre());  // Imprime «Base»
  System.out.println(d.getNombre());  // Imprime «Derivada»
  System.out.println(bd.getNombre()); // Imprime «Derivada»
  ```

  tenemos que:

  - !JAVA(b.getNombre()) llama al método de `Base`, el cual accede al `nombre`
    de `Base`.

  - !JAVA(d.getNombre()) llama al método de `Derivada`, el cual accede al
    `nombre` de `Derivada`.

  - !JAVA(bd.getNombre()) llama al método de `Derivada`, el cual accede al
    `nombre` de `Derivada`.

### `super`

- En Java, la palabra reservada !JAVA(super) es una variable especial que se
  puede usar dentro de una clase y que hace referencia a un objeto de la
  superclase directa de la clase actual.

- Cuando se crea una instancia de una clase, automáticamente se crea de forma
  implícita una instancia de su superclase directa, a la que se tiene acceso a
  través de la variable !JAVA(super).

- A través de esa variable, se puede invocar métodos de la superclase directa o
  acceder a variables de instancia de la superclase directa.

---

- Acceder a una variable de instancia de la superclase directa:

  ```java
  class Animal {
      String color = "blanco";
  }

  class Perro extends Animal {
      String color = "negro";

      void imprimirColor() {
          System.out.println(color);       // imprime el color de Perro
          System.out.println(super.color); // imprime el color de Animal
      }
  }

  public class Prueba {
      public static void main(String args[]) {
          Perro p = new Perro();
          d.imprimirColor();
      }
  }
  ```

- Imprime:

  ```
  negro
  blanco
  ```

---

:::: columns

::: {.column width=70%}

- Ejecutar un método de instancia de la superclase directa:

  ```java
  class Animal {
      void comer () {
          System.out.println("Comiendo...");
      }
  }

  class Dog extends Animal {
      void comer() {
          System.out.println("Comiendo pan...");
      }
      void ladrar() {
          System.out.println("Ladrando...");
      }
      void hacer() {
          super.comer();
          ladrar();
      }
  }

  public class Prueba {
      public static void main(String args[]) {
          Perro p = new Perro();
          p.hacer();
      }
  }
  ```

:::

::: {.column width=30%}

- Imprime:

  ```
  Comiendo...
  Ladrando...
  ```

:::

::::

---

- Invocar al constructor de la superclase directa:

  ```java
  class Animal {
      Animal() {
          System.out.println("Se ha creado un animal");
      }
  }

  class Perro extends Animal {
      Perro() {
          super();
          System.out.println("Se ha creado un perro");
      }
  }

  public class Prueba {
      public static void main(String args[]) {
          Perro p = new Perro();
      }
  }
  ```

- Imprime:

  ```
  Se ha creado un animal
  Se ha creado un perro
  ```

---

- El compilador introduce automáticamente una llamada a !JAVA(super()) como
  primera sentencia del constructor de la subclase si éste no incluye ninguna
  llamada a !JAVA(super()) o !JAVA(this()):

:::: columns

::: {.column width=33%}

```java
class Bicicleta {
    Bicicleta() {
        // sentencias
    }
}
```

:::

::: {.column width=33%}

→ compilador → 

:::

::: {.column width=33%}

```java
class Bicicleta {
    Bicicleta() {
        super();
        // sentencias
    }
}
```

:::

::::

- Sabemos que, si una clase no tiene constructores, el compilador introduce un
  constructor por defecto. En ese caso, ese constructor por defecto también
  llamará a !JAVA(super()) como primera sentencia:

:::: columns

::: {.column width=33%}

```java
class Bicicleta {
}
```

:::

::: {.column width=33%}

→ compilador → 

:::

::: {.column width=33%}

```java
class Bicicleta {
    Bicicleta() {
        super();
    }
}
```

:::

::::

---

- Por ejemplo:

  ```java
  class Animal {
      Animal(){
          System.out.println("Se ha creado un animal");
      }
  }

  class Perro extends Animal {
      Perro() {
          System.out.println("Se ha creado un perro");
      }
  }

  public class Prueba {
      public static void main(String args[]) {
          Perro p = new Perro();
      }
  }
  ```

- Imprime:

  ```
  Se ha creado un animal
  Se ha creado un perro
  ```

### Covarianza en el tipo de retorno

- El tipo de retorno del método redefinido y del método que lo redefine deben
  ser **compatibles**.

- El objetivo a alcanzar es que sea seguro (desde el punto de vista del sistema
  de tipos) usar un método con un determinado tipo de retorno donde se espera
  usar un método con un tipo de retorno diferente.

- La teoría de tipos afirma que es seguro sustituir un método `f` por otro
  método `g` si `f` devuelve un valor de un tipo más general que `g`.

- Por ejemplo, si tenemos que `Gato <: Animal`, y hay un método que devuelve un
  valor de tipo `Animal`, es seguro sustituir ese método por otro que devuelva
  un valor de tipo `Gato`.

- Precisamente, lo que hace la sobreescritura de métodos es sustituir un método
  por otro. Por tanto, es importante que esa sustitución se haga de forma que
  resulte segura.

---

- La compatibilidad entre el tipo de retorno de un método redefinido y el de un
  método que lo redefine, se establece en Java por medio de estas dos reglas:

  - Si el tipo de retorno es un **tipo primitivo**, los dos tipos de retorno
    deben ser **el mismo**.

    Por ejemplo: si el tipo de retorno del método redefinido es !JAVA(int), el
    del método que lo redefine también deberá ser !JAVA(int).

  - Si el tipo de retorno es un **tipo referencia**, el tipo de retorno del
    método que redefine debe ser un **subtipo** del tipo de retorno del método
    redefinido.

    Por ejemplo: si el tipo de retorno del método redefinido es !JAVA(Number),
    el tipo de retorno del método que lo redefine deberá ser un subtipo de
    !JAVA{Number} (lo que incluye al propio !JAVA(Number)).

---

- Esto se puede resumir diciendo:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  En Java, las clases son **covariantes** en el tipo de retorno de sus métodos.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Es decir, que el tipo de retorno de los métodos puede cambiar en la misma
  dirección que la subclase:

  !IMGP(herencia-retorno-covariante.svg)()(width=18%)

- En consecuencia, el tipo de un método redefinido puede sustituirse en el
  método que lo redefine por otro tipo «más estrecho», es decir, por un subtipo
  del tipo original.

---

- Es importante recordar que la covarianza sólo está permitida entre tipos
  referencia, no entre tipos primitivos.

- Más formalmente, supongamos que `S` y `T` son dos clases que cumplen que `S`
  `<:` `T` y, además, ambas clases definen un método `m` (definido en `T` y
  redefinido en `S`) de forma que:

  - el tipo de retorno de `m` en `S` es $R1$

  - el tipo de retorno de `m` en `T` es $R2$

- En tal caso, decimos que el sistema de tipos de un lenguaje de programación
  orientado a objetos admite **covarianza en el tipo de retorno** si se tiene
  que cumplir que $R1$ `<:` $R2$.

- Esta regla garantiza seguridad en el tipo del método cuando se invoca el
  método redefindo sobre instancias de la subclase.

---

- En general, la covarianza es una propiedad que puede tener un tipo compuesto
  a partir de otros.

- Sean $A$ y $B$ dos tipos en un sistema de tipos, y sean
  $T\!{\langle}A{\rangle}$ y $T\!{\langle}B{\rangle}$ dos tipos construidos
  sobre $A$ y $B$, respectivamente. Si $A$ `<:` $B$, se dice que:

  - $T$ es **covariante** si $T\!{\langle}A{\rangle}$ `<:`
    $T\!{\langle}B{\rangle}$.

  - $T$ es **contravariante** si $T\!{\langle}B{\rangle}$ `<:`
    $T\!{\langle}B{\rangle}$.

  - $T$ es **invariante** si no es covariante ni contravariante.

- $T$ se denomina en este contexto un constructor de tipos.

- Nótese que si $T$ se construye con más de un parámetro, puede ser covariante
  o contravariante de forma indistinta en cada uno de ellos.

---

- El tipo que representa la signatura de un método se puede escribir como
  $S{\langle}\overline{P},R{\rangle}$, donde:

  - $\overline{P}$ representa la tupla de todos los tipos que aparecen en la
    lista de parámetros, en el orden en el que aparecen.

  - $R$ representa el tipo del resultado del método.

- Podemos decir que si un método `f` tiene la signatura
  $S{\langle}\overline{P},R_1{\rangle}$ y otro método `g` tiene la signatura
  $S{\langle}\overline{P},R_2{\rangle}$, siempre se debe cumplir que:

  !CENTRAR
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Si $R_1$ `<:` $R_2$, entonces $S{\langle}\overline{P},R_1{\rangle}$ `<:`
  $S{\langle}\overline{P},R_2{\rangle}$.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- O, dicho de otra forma: es seguro (desde el punto de vista del sistema de
  tipos) sustituir el método `g` por el método `f` ya que el tipo de retorno de
  `f` es un subtipo de el de `g`.

  Este es un resultado de la teoría de tipos.

---

- El tipo de una clase `T` (que indicaremos como $T$) puede interpretarse
  como un tipo compuesto por los tipos de retorno de sus métodos.

  Por ejemplo, si la clase `T` tiene un método `m` con tipo de retorno $R$,
  el tipo de la clase lo podemos representar como $T\!{\langle}R{\rangle}$.

- En ese caso, decimos que $T\!{\langle}R_1{\rangle}$ `<:`
  $T\!{\langle}R_2{\rangle}$ si $R_1$ `<:` $R_2$.

- Es decir: una clase `A` es subtipo de otra clase `B` si ambas tienen el
  mismo método pero el tipo de retorno del método en `A` es subtipo del tipo
  de retorno del mismo método en `B`.

- Esa es precisamente la definición de **covarianza**: un tipo compuesto es
  covariante cuando cumple la condición anterior.

### Invarianza en el tipo de los argumentos

- Los tipos de los parámetros del método redefinido deben coincidir exactamente
  con los tipos de los parámetros del método que lo redefine, lo que se puede
  resumir diciendo:

  !CAJA
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  En Java, las clases son **invariantes** en los tipos de los parámetros de sus
  métodos.
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Si los tipos de los parámetros no son idénticos, entonces lo que se está
  haciendo es una sobrecarga en lugar de una redefinición.

- Por eso siempre es conveniente usar el decorador !JAVA(@Override) para
  asegurarse de que no está ocurriendo ésto accidentalmente.

### Sobreescritura de `equals`

### Sobreescritura de `hashCode`

# Restricciones

## Clases y métodos abstractos

## Clases y métodos finales

