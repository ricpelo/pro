---
title: Conceptos básicos de PHP (I)
author: Ricardo Pérez López
date: IES Doñana, curso 2017-18
---

# Introducción a PHP

## Página web de PHP

## Instalación de PHP

## Documentación y búsqueda de información

# Sintaxis básica

## Datos e instrucciones

## Sentencias y comandos

Comando `echo`.

## Expresiones, operadores y funciones

Ejemplos: aritmética, `cos()`, `max()`.

# Funcionamiento del intérprete

## Modo dual de operación

Se llaman *modo HTML* y *modo PHP*.

## Etiquetas `<?php` y `?>`

# Intérprete interactivo

## `php -a`

## PsySH

# Variables

## Conceptos básicos

## Destrucción de variables

## Operadores de asignación

- Por valor
- Por referencia

## Variables predefinidas

# Tipos básicos de datos

## Lógicos

- Operadores lógicos

## Numéricos

- Enteros (`int`)
- Números en coma flotante (`float`)
- Operadores
  - Aritméticos
  - De incremento/decremento

## Cadenas

- Operadores de cadenas
  - Concatenación
  - Acceso y modificación por caracteres
  - De incremento/decremento
- Funciones de manejo de cadenas
- Extensión *mbstring*

## Nulo

# Manipulación de datos

## Precedencia de operadores

## Operadores de asignación compuesta

## Comprobaciones

- De tipos
  - `gettype()`
  - `is_*()` (poco útiles en formularios, ya que sólo se reciben `string`s)
- De valores
  - `is_numeric()`
  - `ctype_*()`

## Conversiones de tipos

- Conversión explícita (forzado o *casting*) vs. automática
  - A `bool`
  - A `int`
  - A `float`
  - De `string` a número
  - A `string`
- Funciones de obtención de valores (Hacen más o menos lo mismo que los
  *casting* pero con funciones en lugar de con operadores. Puede ser
  interesante porque las funciones se pueden guardar, usar con *map*, *reduce*,
  etc.)
  - `intval()`
  - `floatval()`
  - `strval()`
  - `boolval()`
- Funciones de formateado numérico
  - `number_format()`
  - `money_format()`
    - `set_locale()`

## Comparaciones

- Operadores de comparación
- `==` vs. `===`
- Operador ternario (`?:`)
- Operador de coalescencia o fusión de null (`??`)
- Reglas de comparación de tipos

# Constantes

## Constantes

## `define()` y `const`

## Constantes predefinidas

## `defined()`

# Flujo de control

## Estructuras de control

## Inclusión de scripts

# Funciones predefinidas destacadas

## `isset()`

## `empty()`

## `var_dump()`

# Arrays

## Arrays

## Operadores para arrays

## Funciones de manejo de arrays

## `foreach`

## Conversión a array

## Ejemplo: `$argv` en CLI

# Funciones definidas por el usuario

## Funciones definidas por el usuario

## Argumentos

- Paso de argumentos por valor y por referencia
- Argumentos por defecto

## Ámbito de variables

- Ámbito simple al archivo
- Variables locales
- Uso de `global`
- Variables superglobales

## Declaraciones de tipos

- Declaraciones de tipos de argumento
- Declaraciones de tipo de devolución
- Tipos *nullable* y `void`
- Tipificación estricta

# Comentarios y documentación del código

# Ejercicios

