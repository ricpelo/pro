---
title:
- |
  Ejercicios de\
  Elementos básicos del lenguaje Java
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

@. Para las siguientes sentencias, determinar:

    - Si es correcta o no, y por qué.

    - Qué tipo de sentencia es: de _declaración_ o de _declaración e
      inicialización_.

    - El tipo estático de la variable declarada.

    - El tipo dinámico de la variable, si procede.

    #. !JAVA(int x;)

    #. !JAVA(int x = 5;)

    #. !JAVA(int x = 5L;)

    #. !JAVA(int x = (short) 5;)

    #. !JAVA(short x = 5;)

    #. !JAVA(short x = 50000;)

    #. !JAVA(String s = "Hola";)

    #. !JAVA(Object o = "Hola";)

    #. !JAVA(String s = null;)

@. Si `x` es una variable numérica:

    #. ¿Cuál es la diferencia entre las expresiones !JAVA(x++) y !JAVA(++x)?

    #. Suponiendo que `x` vale 5, ¿cuál es el resultado de evaluar las
       siguientes expresiones por separado, incluyendo sus posibles efectos
       laterales?

        #. !JAVA(x++)

        #. !JAVA(++x)

@. Suponiendo que `A`, `B`, `C` son tipos, y se cumple que `A` $<_1$ `B` y `B`
   $<_1$ `C`, se pide:

    #. Calcular todos los subtipos de `C`. Expresarlo usando relaciones con la
       notación adecuada. ¿Cuáles de ellos son subtipos directos? ¿Cuáles son
       subtipos propios?

    #. Calcular todos los supertipos de `A`. Expresarlo usando relaciones con
       la notación adecuada.

    #. ¿Se cumple que `A <: C`?

    #. ¿Se cumple que `A <: A`?

    #. ¿Se cumple que `B <: C`?

    #. Partiendo de las siguientes declaraciones:

        ```java
        A a;
        B b;
        C c;
        ```

       y suponiendo que cada variable contiene un valor cuyo tipo coincide
       exactamente con el tipo de la variable, ¿son válidas las siguientes
       sentencias? ¿Por qué?

       #. !JAVA(b = a;)

       #. !JAVA(a = b;)

       #. !JAVA(c = a;)

@. Suponiendo que partimos de la siguiente situación:

    ```java
    int i = 4;
    short s = 3;
    long l = 9L;
    ```

    ¿Son correctas las siguientes sentencias? ¿Por qué?

      #. !JAVA(s = i);

      #. !JAVA(s = 4);

      #. !JAVA(s = 400);

      #. !JAVA(l = i);

      #. !JAVA(l = 9);

@. ¿Qué resultado producen los códigos siguientes por la salida estándar? ¿Por
   qué?

    #.

      ```java
      int j = 0;
      for (int i = 0; i < 4; i++) {
          j += i;
      }
      System.out.println(i);
      System.out.println(j);
      ```

    #.

      ```java
      int i, j = 0;
      for (i = 0; i < 4; i++) {
          j += i;
      }
      System.out.println(i);
      System.out.println(j);
      ```

    #.

      ```java
      switch (2) {
          case 0:  System.out.println("Vale 0");
          case 1:  System.out.println("Vale 1");
          case 2:  System.out.println("Vale 2");
          case 3:  System.out.println("Vale 3");
          default: System.out.println("Ninguno de los anteriores");
      }
      ```
