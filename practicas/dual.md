---
title:
- |
  Prácticas para FP dual
author:
- |
  Ricardo Pérez López\
  IES Doñana
---

# **[PRO1]** Escribe un programa que lea y escriba información almacenada en una base de datos relacional {.unnumbered}

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

La instalación de la librería _Psycopg_ se puede hacer fácilmente en Debian
GNU/Linux o Ubuntu tecleando la siguiente orden en una terminal:

```console
$ sudo apt install python3-psycopg
```

Más información:

- [`https://www.psycopg.org`](https://www.psycopg.org/)

- [`https://www.psycopg.org/psycopg3/docs`](https://www.psycopg.org/psycopg3/docs/)
