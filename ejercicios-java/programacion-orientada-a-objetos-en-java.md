---
title:
- |
  Ejercicios de\
  Programación orientada a objetos en Java
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

@. Escribir un programa Java que sume los elementos de un _array_ de 5
   elementos (de tipo entero) ya inicializado.

@. Escribir un programa Java que solicite al usuario la introducción de 5
   números enteros y los almacene en un _array_ de tamaño suficiente.
   Posteriormente deberá mostrar por la salida cada uno de ellos en una línea
   separada y, a continuación, mostrar su suma.

@. Escribir un programa que salude al usuario cuyo nombre haya sido indicado
   como primera opción al ejecutar dicho programa desde la línea de órdenes.
   Por ejemplo, si el programa compilado es `Saluda.class` y se ejecuta como:

    ```console
    $ java Saluda Ricardo
    ```

    deberá responder «`¡Hola, Ricardo!`».

@. Usar el método `Arrays.copyOf` para crear una copia de un _array_ de forma
   que el nuevo _array_ tenga $long / 2$ elementos más, siendo $long$ la
   longitud del _array_ original.

@. Escribir un programa que solicite números al usuario y los vaya
   introduciendo en un _array_ con una longitud inicial de 5. Si se supera la
   capacidad del _array_, se deberá ampliar usando la solución del ejercicio
   anterior. Cuando el usuario introduzca un `0`, deberá mostrar todos los
   elementos almacenados en el `array` y finalizar el programa.

@. Escribir un programa que cree un _array_ de 5 elementos de tipo
   !JAVA(StringBuffer), luego lo copie creando un nuevo _array_ usando
   `Arrays.copyOf`, modifique una de las cadenas almacenadas a través del
   primer _array_ y finalmente compruebe si se ha modificado en el nuevo
   _array_. ¿Qué conclusión podemos sacar?

@. Escribir un programa que compare dos _arrays_ usando `Arrays.equals`.

@. Escribir un programa donde el método `main` pase un _array_ de enteros a un
   método llamado `cambiar` definido por el programador, el cual modificará uno
   de los elementos del _array_ (pero no devolverá nada, es decir, debe
   definirse de tipo !JAVA(void)). Finalmente, se deberá comprobar en el método
   `main` si el _array_ ha sido modificado tras la llamada a `cambiar`. ¿Cambia
   en algo el resultado si el _array_ se declara como !JAVA(final) en el método
   `main`? ¿Cambia en algo el resultado si el parámetro del método `cambiar` se
   declara como !JAVA(final)? ¿Por qué? (Pista: recordar el concepto de
   mutabilidad).

@. Escribir un programa que represente la matriz:
    $$\begin{pmatrix}
    1 & 2 & 3 \\
    4 & 5 & 6 \\
    7 & 8 & 9
    \end{pmatrix}$$
    usando un _array_ bidimensional inicializado a los valores adecuados. A
    continuación, debe mostrar la matriz por la salida recorriendo el _array_
    usando dos bucles anidados.

@. Crear un método `rellenaCuadrado` que reciba un entero $n$ y que devuelva
   una matriz cuadrada de $n\times{}n$ que sólo contenga al entero $n$.

    Ejemplos:

    ```java
    jshell> rellenaCuadrado(3)
    $1 ==> [
        [3, 3, 3],
        [3, 3, 3],
        [3, 3, 3]
    ]

    jshell> rellenaCuadrado(5)
    $2 ==> [
        [5, 5, 5, 5, 5],
        [5, 5, 5, 5, 5],
        [5, 5, 5, 5, 5],
        [5, 5, 5, 5, 5],
        [5, 5, 5, 5, 5]
    ]

    jshell> rellenaCuadrado(1)
    $3 ==> [
        [1]
    ]

    jshell> rellenaCuadrado(0)
    $4 ==> []
    ```

    Notas:

    - $n >= 0$.

    - Si $n = 0$, devuelve un _array_ vacío.

@. Crear un programa que cree un _array_ de cinco elementos, donde el primero
   sea un entero, el segundo una cadena, el tercero un booleano, el cuarto un
   valor !JAVA(null) y el quinto un !JAVA(StringBuilder). Luego debe enviar ese
   _array_ a un método estático que recorrerá el _array_ desde el primer
   elemento hasta el último y los mostrará por la salida.

