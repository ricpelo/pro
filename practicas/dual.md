---
title:
- |
  Prácticas de Programación\
  para FP dual
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

@. **PRO1:** Escribe un programa que lea y escriba información almacenada en
   archivos de texto plano.

    Escribir en Python un programa que lea un archivo de texto llamado
    `factura.txt` con un texto como el siguiente (no tiene por qué ser
    exactamente igual, pero sí de la misma forma):

    ```
    Ud Denominación    Precio
    -- --------------- ------
     2 Tuercas           3.70
     6 Tornillos         2.20
    ```

    El archivo almacena las líneas de detalle de una factura. Cada línea
    contiene un artículo, donde se detalla el número de unidades, la
    denominación y el precio unitario, en ese orden. En cada línea, el máximo
    de unidades es 99 y el precio unitario máximo es 99.99. Además, la
    denominación tiene un máximo de 15 caracteres.

    La función deberá crear un archivo `resultado.txt` que contenga el mismo
    contenido que el archivo original pero añadiendo el importe parcial por
    cada línea y una línea más que indique el total de la factura, de la
    siguiente forma:

     ```
     Ud Denominación    Precio Importe
     -- --------------- ------ -------
      2 Tuercas           3.70    7.40
      6 Tornillos         2.20   13.20
     ---------------------------------
     TOTAL:                      20.60
     ```

    Indicación: se pueden usar campos de sustitución en una f-string con los
    siguientes formatos:

    - `{`_cadena_`:`_ancho_**`f`**`}` para alinear una cadena a la izquierda.
    - `{`_numero_`:`_ancho_`.`_decimales_**`f`**`}` para alinear un número a la derecha.

    Por ejemplo:

    ```python
    >>> f'{"Hola":15}'
    'Hola           '
    >>> f'{6 * 2.20:9.2f}'
    '    13.20'
    ```

    Más información:

    \footnotesize
    - [`https://pro.iesdonana.org/slides/programacion-imperativa.html#/entrada-y-salida`](https://pro.iesdonana.org/slides/programacion-imperativa.html#/entrada-y-salida)
    - [`https://pro.iesdonana.org/slides/programacion-imperativa.html#/entrada-y-salida-por-archivos`](https://pro.iesdonana.org/slides/programacion-imperativa.html#/entrada-y-salida-por-archivos)
    \normalsize

<!-- -->

@. **PRO2:** Escribe un programa que lea y escriba información almacenada en
   una base de datos relacional.

    Escribir un programa que haga altas, bajas, consultas y modificaciones en
    una base de datos de una biblioteca.

    La base de datos debe contar con dos tablas:

    - `lectores (numero, nombre, apellidos, telefono)`
    - `libros (codigo, titulo, num_paginas, lector)`

    Descripción:

    - La columna `numero` es la clave primera de la tabla `lectores`.
    - La columna `codigo` es la clave primaria de la tabla `libros`.
    - La columna `lector` es una clave ajena que apunta a la columna `numero` de
      la tabla `lectores`. Indica qué lector tiene prestado el libro, o `NULL`
      si el libro no está prestado.

    El programa debe mostrar un menú principal desde el que el usuario podrá:

    - Hacer altas, bajas, consultas y modificaciones de lectores.
    - Hacer altas, bajas, consultas y modificaciones de libros.
    - Poder prestar un libro a un lector.
    - Poder gestionar la devolución de un libro.

    La instalación de la librería Psycopg se puede hacer fácilmente en Debian o
    Ubuntu tecleando la siguiente orden:

    ```
    sudo apt install python3-psycopg
    ```

    Más información:

    - [`https://www.psycopg.org`](https://www.psycopg.org/)
    - [`https://www.psycopg.org/psycopg3/docs`](https://www.psycopg.org/psycopg3/docs/)
