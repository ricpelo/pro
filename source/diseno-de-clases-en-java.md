---
title: Diseño de clases en Java
author: Ricardo Pérez López
!DATE
---

# Definición de clases

## Sintaxis básica

!ALGO
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!NT(clase) ::= [!NT(modif_acceso_clase)] !T(class) !NT(nombre) !T({)
    !NT(miembro)*
!T(})

!NT(nombre) ::= !T(identificador)
!NT(miembro) ::= !NT(variable) | !NT(método)
!NT(variable) ::= [!NT(modif_acceso_miembro)] [!T(static)] !NT(decl_variable)
!NT(método) ::= [!NT(modif_acceso_miembro)] [!T(static)] !NT(decl_método)
!NT(modif_acceso_clase) ::= !T(public)
!NT(modif_acceso_miembro) ::= !T(public) | !T(private) | !T(protected)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- La definición de una clase es una construcción sintática que define su propio
  ámbito y que está formada por un bloque de **declaraciones de miembros**,
  cuada una de las cuales puede declarar una **variable** (también llamada
  **campo**) o un **método**.

- A su vez, cada miembro puede ser **de instancia** o puede ser **estático**.

!EJEMPLO

```java
public class Hola {
    public int x = 4;
    private String nombre;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nom) {
        nombre = nom;
    }
}
```

## Visibilidad de una clase

- Una clase siempre pertenece siempre a un paquete, que es el paquete en el que
  se ha definido.

- El uso y definición de paquetes en Java lo estudiaremos con más profundidad
  posteriormente.

- En relación a los paquetes en las que se definen, las clases pueden tener dos
  tipos de visibilidades:

  - **Visibilidad _predeterminada_** (**_por defecto_** o **_default_**): la
    clase sólo es accesible desde el interior del paquete en el que se ha
    definido.

  - **Visibilidad _pública_**: la clase es accesible desde cualquier paquete.

- Para indicar la visibilidad que debe tener una clase, se puede usar un
  **modificador de acceso**.

### Visibilidad predeterminada

- Cuando no se utiliza ningún _modificador de acceso_ al definir la clase, ésta
  se define con visibilidad predeterminada.

- En un archivo fuente pueden definirse tantas clases con visibilidad
  predeterminada como se desee.

- Además, en ese caso el archivo fuente puede tener cualquier nombre (por
  supuesto, siempre con extensión `.java`).

### Visibilidad pública

- Para definir una clase con visibilidad pública, se usa el _modificador de
  acceso_ !JAVA(public) en la definición de la clase.

- En un archivo fuente pueden definirse muchas clases, pero sólo una de ellas
  puede ser pública.

- Además, el archivo fuente debe llamarse igual que la (única) clase pública
  que contiene.

## Visibilidad de un miembro de una clase

- Cada miembro de una clase puede tener uno de estos cuatro tipos de
  visibilidades:

  - **Visibilidad _privada_**: el miembro sólo es accesible desde el interior
    de la clase en la que se ha definido.

  - **Visibilidad _predeterminada_** (**_por defecto_** o **_default_**): el
    miembro es accesible desde el interior de la clase en la que se ha definido
    y también desde otras clases que pertenezcan al mismo _paquete_.

  - **Visibilidad _protegida_**: el miembro es accesible desde el interior de
    la clase en la que se ha definido, también desde otras clases que
    pertenezcan al mismo paquete y también desde sus subclases (aunque se hayan
    definido en paquetes distintos).

  - **Visibilidad _pública_**: el miembro es accesible desde el interior de la
    clase en la que se ha definido y también desde cualquier otra clase
    (siempre que la clase en sí también sea accesible).

---

- La visibilidad es un mecanismo de **encapsulación** que impide que ciertos
  miembros puedan ser accedidos (o incluso conocidos) fuera de la clase en la
  que se han definido, o fuera del paquete que contiene la clase en la que se
  ha definido.

- El siguiente cuadro resume las cuatro visibilidades y desde dónde se puede
  acceder a un miembro definido con una determinada visibilidad en una
  determinada clase:

  -------------------------------------------------------------------------------------
  Visibilidad          La propia     Otras clases del  Subclases de  Otras clases de 
                       clase         mismo paquete     la clase      cualquier paquete
  -------------------- ------------- ----------------- ------------- ------------------
  **Privada**               Sí            No              No                 No

  **Predeterminada**        Sí            Sí              No                 No

  **Protegida**             Sí            Sí              Sí                 No

  **Pública**               Sí            Sí              Sí                 Sí
  -------------------------------------------------------------------------------------

---

- La visibilidad que queremos que tenga un determinado miembro se indica
  mediante los llamados **modificadores de acceso**.

- Los **modificadores de acceso** son palabras clave que acompañan a la
  declaración de un miembro y que sirven para indicar la visibilidad deseada
  para ese miembro.

- La forma de indicar que se desea que un miembro tenga visibilidad
  predeterminada es no usar ningún modificador de acceso en su declaración.

- Para el resto de visibilidades existe un **modificador de acceso** que puede
  ir acompañando a la **declaración de cada miembro**:

  -----------------------------------------------------------
  Visibilidad       Modificador de acceso
  ----------------- -----------------------------------------
  Pública           !JAVA(public)

  Privada           !JAVA(private)

  Protegida         !JAVA(protected)

  Predeterminada    _(ninguno)_
  -----------------------------------------------------------

---

!IMGP(visibilidades-java.png)(Visibilidades en Java)(width=90%)

### Pública

### Privada

### Predeterminada

# Miembros de instancia

## Campos

### Acceso y modificación

### Campos finales

## Métodos

### Referencia `this`

### Constructores y destructores

### Accesores y mutadores

### Sobrecarga

### Ámbito de un identificador

### Resolución de identificadores

# Miembros estáticos

## Métodos estáticos

## Campos estáticos

## Campos estáticos finales

