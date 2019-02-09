---
title: Conceptos básicos de PHP (I)
author: Ricardo Pérez López
date: IES Doñana, curso 2018-19
---

# Introducción a PHP

## Página web de PHP

---

<script data-quiz>
    quiz = {
            "info": {
                    "name":    "Página web de PHP",
                    "main":    "Think you're smart enough to be on Jeopardy? Find out with this super crazy knowledge quiz!",
                    "level1":  "Jeopardy Ready",
                    "level2":  "Jeopardy Contender",
                    "level3":  "Jeopardy Amateur",
                    "level4":  "Jeopardy Newb",
                    "level5":  "Stay in school, kid..." // no comma here
            },
            "questions": [
                    { // Question 1 - Multiple Choice, Single True Answer
                            "q": "What number is the letter A in the English alphabet?",
                            "a": [
                                    {"option": "8",      "correct": false},
                                    {"option": "14",     "correct": false},
                                    {"option": "1",      "correct": true},
                                    {"option": "23",     "correct": false} // no comma here
                            ],
                            "correct": "<p><span>That's right!</span> The letter A is the first letter in the alphabet!</p>",
                            "incorrect": "<p><span>Uhh no.</span> It's the first letter of the alphabet. Did you actually <em>go</em> to kindergarden?</p>" // no comma here
                    },
                    // more questions here
            ]
    }
</script>

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

