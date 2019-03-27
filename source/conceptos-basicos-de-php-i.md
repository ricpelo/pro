---
title: Conceptos básicos de PHP (I)
author: Ricardo Pérez López
date: IES Doñana, curso 2018-19
---

# Introducción a PHP

## Página web de PHP

[http://php.net](http://php.net)

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

* Opción recomendada:

  ```console
  $ ~/.conf/scripts/php-install.sh
  ```

* Opción general:

  ```console
  $ sudo apt install php
  ```

---


```js
  // Useless comment.
  alert('hi');
```

::: {.fragment data-code-focus="1"}
When this fragment is shown, the first line of code (`span.line`) will have the `"focus"` class added to it.
:::

::: { .fragment data-code-focus="1-2"}
Another fragment. This time, both lines will now have the `"focus"` class.
:::

## Documentación y búsqueda de información

* Manual en [http://php.net/manual/es/](http://php.net/manual/es/)

* Formulario de búsqueda en [http://php.net](http://php.net)

# Sintaxis básica


## Datos e instrucciones

123

## Sentencias y comandos

123

### Comando `echo`

123

## Expresiones, operadores y funciones

Ejemplos: aritmética, `cos()`, `max()`.

# Funcionamiento del intérprete


## Ejecución


### Por lotes


### Interactiva


#### `php -a`


#### PsySH


## Etiquetas `<?php` y `?>`


## Modo dual de operación

Se llaman *modo HTML* y *modo PHP*.

# Variables


## Conceptos básicos


## Destrucción de variables


## Operadores de asignación por valor y por referencia
[link: En `$b =& $a;`, `$b` **NO** está apuntando a `$a` o viceversa. Ambos apuntan al mismo lugar.|http://php.net/manual/es/language.references.whatdo.php]

## Variables predefinidas
`$_ENV` no funciona en la instalación actual (ver `variables_order` en `php.ini`. Habría que usar `get_env()`.

# Tipos básicos de datos


## Lógicos (bool)
[link: Se escriben en minúscula: `false` y `true`.|https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md#51-types]

`boolean` es sinónimo de `bool`, pero debería usarse `bool`.

### Operadores lógicos
*Cuidado*:
-  `false and (true && print('hola'))` no imprime nada y devuelve `false`, por lo que **el código va en cortocircuito y se evalúa de izquierda a derecha** incluso aunque el `&&` y los paréntesis tengan más prioridad que el `and`.
- Otra forma de verlo es comprobar que `print('uno') and (1 + print('dos'))` escribe `unodos` (y devuelve `true`), por lo que la evaluación de los operandos del `and` se hace de izquierda a derecha aunque el `+` tenga más prioridad (y encima vaya entre paréntesis).
- En el [link: manual de PHP|http://php.net/manual/es/language.operators.precedence.php] se dice que: *"La precedencia y asociatividad de los operadores solamente determinan cómo se agrupan las expresiones, no especifican un orden de evaluación. PHP no especifica (en general) el orden en que se evalúa una expresión y se debería evitar el código que se asume un orden específico de evaluación, ya que el comportamiento puede cambiar entre versiones de PHP o dependiendo de código circundante."*
- [link: Pregunta que hice al respecto en StackOverflow|https://stackoverflow.com/questions/46861563/false-and-true-printhi].

## Numéricos


### Enteros (`int`)
`integer` es sinónimo de `int`, pero debería usarse `int`.

### Números en coma flotante (`float`)
`double` es sinónimo de `float`, pero debería usarse `float`.

### Operadores


#### Operadores aritméticos


#### Operadores de incremento/decremento


## Cadenas


### Operadores de cadenas


#### Concatenación


#### Acceso y modificación por caracteres

- `echo $a[3]`
- `$a[3] = 'x';`

#### Operador de incremento #opcional


### Funciones de manejo de cadenas


### Extensión *mbstring*


## Nulo (`null`)

[`is_null()` vs. `=== null`](https://phpbestpractices.org/#checking-for-null)

[link: El tipo `null` y el valor `null` se escriben en minúscula.|https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md#51-types]

# Manipulación de datos


## Precedencia de operadores


## Operadores de asignación compuesta

`$x <op>= $y`

## Comprobaciones


### De tipos


#### `gettype()`


#### `is_*()`

(poco útiles en formularios, ya que sólo se reciben `string`s)

### De valores


#### `is_numeric()`


#### `ctype_*()`


## Conversiones de tipos


### Conversión explícita (forzado o *casting*) vs. automática


### Conversión a `bool`


### Conversión a `int`


### Conversión a `float`


### Conversión de `string` a número

**¡Cuidado!**:

La documentación dice que `$x = 1 + "pepe"` o `$x = 1 + "10 pepe"` funciona, pero dependiendo del valor de `error_reporting` en `php.ini`, puede dar un **PHP Warning:  A non-numeric value encountered** o un **PHP Warning: A non well formed numeric value encountered**, respectivamente.
- Si `error_reporting = E_ALL`, dará el mensaje de advertencia.
  Además, en PsySH no funcionará, es decir, que `$x` no se asignará al valor. En `php -a` sí funcionará (aunque da el mismo mensaje de advertencia).
- Si `error_reporting = E_ALL & ~E_NOTICE`, no lo dará.
  Además, funcionará tanto en PsySH como en `php -a`.

### Conversión a `string`


### Funciones de obtención de valores

(Hacen más o menos lo mismo que los
  *casting* pero con funciones en lugar de con operadores. Puede ser
  interesante porque las funciones se pueden guardar, usar con *map*, *reduce*,
  etc.)

#### `intval()`


#### `floatval()`


#### `strval()`


#### `boolval()`


### Funciones de formateado numérico


#### `number_format()`


#### `money_format()`


##### `set_locale()`

`setlocale(LC_ALL, 'es_ES.UTF-8'); // Hay que poner el *locale* completo, con la codificación y todo (.UTF-8)`

## Comparaciones


### Operadores de comparación

`"250" < "27"` devuelve `false`
Si se compara un número con un string o la comparación implica strings numéricos, entonces cada string es convertido en un número y la comparación realizada numéricamente.

### `==` vs. `===`


### Operador ternario (`?:`)


### Operador de coalescencia o fusión de null (`??`)

Equivalente al `COALESCE()` de SQL.

### Reglas de comparación de tipos


# Constantes


## Constantes

Diferencias entre constantes y variables:
- Las constantes no llevan el signo dólar (`$`) como prefijo.
- Antes de PHP 5.3, las constantes solo podían ser definidas usando la función `define()` y no por simple asignación.
- Las constantes pueden ser definidas y accedidas desde cualquier sitio sin importar las reglas de acceso de variables.
- Las constantes no pueden ser redefinidas o eliminadas una vez se han definido.
- Las constantes podrían evaluarse como valores escalares. A partir de PHP 5.6 es posible definir una constante de array con la palabra reservada `const`, y, a partir de PHP 7, las constantes de array también se pueden definir con `define()`. Se pueden utilizar arrays en expresiones escalares constantes (por ejemplo, `const FOO = array(1,2,3)[0];`), aunque el resultado final debe ser un valor de un tipo permitido.

## `define()` y `const`


## Constantes predefinidas


## `defined()`


# Ejercicios


