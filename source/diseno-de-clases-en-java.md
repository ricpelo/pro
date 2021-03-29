---
title: Diseño de clases en Java
author: Ricardo Pérez López
!DATE
---

# Encapsulación

## Visibilidad

- La visibilidad de los miembros de una clase se puede establecer usando los
  llamados **modificadores de acceso**.

- Los miembros de una clase pueden tener uno de estos cuatro tipos de
  visibilidades:

  - **Visibilidad _predeterminada_** (**_por defecto_** o **_default_**): el
    miembro es accesible desde el interior de la clase en la que se ha definido
    y también desde otras clases que pertenezcan al mismo _paquete_.

  - **Visibilidad _pública_**: el miembro es accesible desde el interior de la
    clase en la que se ha definido y también desde fuera de la misma (siempre
    que la clase en sí también sea accesible).

  - **Visibilidad _privada_**: el miembro sólo es accesible desde el interior
    de la clase en la que se ha definido.

  - **Visibilidad _protegida_**: el miembro es accesible desde el interior de
    la clase en la que se ha definido y también desde sus subclases (aunque se
    hayan definido en paquetes distintos).

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

### Por defecto

# Miembros no estáticos

## Atributos

### Acceso y modificación

### Atributos finales

## Métodos

### Referencia `this`

### Constructores y destructores

### Accesores y mutadores

### Sobrecarga

### Ámbito de un identificador

### Resolución de identificadores

# Miembros estáticos

## Métodos estáticos

## Atributos estáticos

## Atributos estáticos finales

