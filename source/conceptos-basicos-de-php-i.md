---
title: Conceptos básicos de PHP (I)
author: Ricardo Pérez López
!DATE
---

# Introducción a PHP

## [Página web de PHP](http://php.net)

!FLOWCHART(prueba.svg)(Prueba de diagrama de flujo)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
st=>start: Start
e=>end
op1=>operation: My Operation
sub1=>subroutine: My Subroutine
cond=>condition: Yes
or No?:>http://www.google.com
io=>inputoutput: catch something
st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Instalación de PHP

```{.php .scrollable}
<?php

$j = json_decode($argv[1], true);
// print_r($j);

echo '```{=latex}' . PHP_EOL;
foreach ($j['questions'] as $question) {
    echo '\begin{Exercise}[label={\the\value{Exercise}}]' . PHP_EOL;
    echo $question['q'] . PHP_EOL;
    echo PHP_EOL;
    echo '(Para ver la respuesta pulsa aquí:~\ref{\ExerciseLabel-Answer})' . PHP_EOL;
    echo '\end{Exercise}' . PHP_EOL;
    echo '\begin{Answer}[ref=\ExerciseLabel]' . PHP_EOL;
    echo '\begin{itemize}' . PHP_EOL;
    foreach ($question['a'] as $ans) {
        if ($ans['correct']) {
            echo '\item ' . $ans['option'] . PHP_EOL;
        }
    }
    echo '\end{itemize}';
    echo PHP_EOL;
    echo $question['correct'] . PHP_EOL;
    echo '\end{Answer}' . PHP_EOL;
}
echo '```' . PHP_EOL;
<?php

//$f = file_get_contents('juan');

$j = json_decode($argv[1], true);
// print_r($j);
!BREAK
echo '```{=html}' . PHP_EOL;
echo '<script data-quiz>' . PHP_EOL;
foreach ($j['questions'] as &$question) {
    $question['correct'] = '<p><span>¡Eso es!</span>' . $question['correct'] . '</p>';
    $question['incorrect'] = '<p><span>Mmmm... no.</span>' . $question['incorrect'] . '</p>';
}
echo 'quiz = ' . json_encode($j, JSON_UNESCAPED_SLASHES);
echo '</script>' . PHP_EOL;
echo '```' . PHP_EOL;
```

## Documentación y búsqueda de información

# [Sintaxis básica](http://php.net/manual/es/language.basic-syntax.php)

## Datos e instrucciones

!QUIZ
~~~~~~~~~~~~~~~~~~~~~~~
{
        "info": {
                "name":    "",
                "main":    ""
        },
        "questions": [
                {
                        "q": "What number is the letter A in the English alphabet?",
                        "a": [
                                {"option": "8",      "correct": false},
                                {"option": "14",     "correct": false},
                                {"option": "1",      "correct": true},
                                {"option": "23",     "correct": false}
                        ],
                        "correct": "The letter A is the first letter in the alphabet!",
                        "incorrect": "It's the first letter of the alphabet. Did you actually <em>go</em> to kindergarden?"
                }
        ]
}
~~~~~~~~~~~~~~~~~~~~~~~

## Sentencias y comandos

### [Comando `echo`](http://php.net/manual/es/function.echo.php)

## Expresiones, operadores y funciones

ricpelo's note: *Ejemplos*: aritmética, `cos()`, `max()`  
ricpelo's note: [`print()` *no* es una función. Cuidado.](http://php.net/manual/es/function.print.php#85310)  

# [Funcionamiento del intérprete](http://php.net/manual/es/language.basic-syntax.phpmode.php)

## Ejecución

### Por lotes

### Interactiva

#### `php -a`

#### [PsySH](http://psysh.org/)

## Etiquetas `<?php` y `?>`

## Modo dual de operación

ricpelo's note: Se llaman *modo HTML* y *modo PHP*.  

# [Variables](http://php.net/manual/es/language.variables.php)

## [Conceptos básicos](http://php.net/manual/es/language.variables.basics.php)

## [Destrucción de variables](http://php.net/manual/es/function.unset.php)

## [Operadores de asignación por valor y por referencia](http://php.net/manual/es/language.operators.assignment.php)

ricpelo's note: [En `$b =& $a;`, `$b` **NO** está apuntando a `$a` o viceversa. Ambos apuntan al mismo lugar.](http://php.net/manual/es/language.references.whatdo.php)  

## [Variables predefinidas](http://php.net/manual/es/reserved.variables.php)

ricpelo's note: `$_ENV` no funciona en la instalación actual (ver `variables_order` en `php.ini`. Habría que usar `get_env()`.  

# [Tipos básicos de datos](http://php.net/manual/es/language.types.intro.php)

## [Lógicos (`bool`)](http://php.net/manual/es/language.types.boolean.php)

ricpelo's note: [Se escriben en minúscula: `false` y `true`.](https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md#51-types)  
ricpelo's note: `boolean` es sinónimo de `bool`, pero debería usarse `bool`.  

### [Operadores lógicos](http://php.net/manual/es/language.operators.logical.php)

ricpelo's note: *Cuidado*:  
-  `false and (true && print('hola'))` no imprime nada y devuelve `false`, por lo que **el código va en cortocircuito y se evalúa de izquierda a derecha** incluso aunque el `&&` y los paréntesis tengan más prioridad que el `and`.  
- Otra forma de verlo es comprobar que `print('uno') and (1 + print('dos'))` escribe `unodos` (y devuelve `true`), por lo que la evaluación de los operandos del `and` se hace de izquierda a derecha aunque el `+` tenga más prioridad (y encima vaya entre paréntesis).  
- En el [manual de PHP](http://php.net/manual/es/language.operators.precedence.php) se dice que: *"La precedencia y asociatividad de los operadores solamente determinan cómo se agrupan las expresiones, no especifican un orden de evaluación. PHP no especifica (en general) el orden en que se evalúa una expresión y se debería evitar el código que se asume un orden específico de evaluación, ya que el comportamiento puede cambiar entre versiones de PHP o dependiendo de código circundante."*  
- [Pregunta que hice al respecto en StackOverflow](https://stackoverflow.com/questions/46861563/false-and-true-printhi).  

## Numéricos

### [Enteros (`int`)](http://php.net/manual/es/language.types.integer.php)

ricpelo's note: `integer` es sinónimo de `int`, pero debería usarse `int`.  

### [Números en coma flotante (`float`)](http://php.net/manual/es/language.types.float.php)

ricpelo's note: `double` es sinónimo de `float`, pero debería usarse `float`.  

### Operadores

#### [Operadores aritméticos](http://php.net/manual/es/language.operators.arithmetic.php)

#### [Operadores de incremento/decremento](http://php.net/manual/es/language.operators.increment.php)

## [Cadenas (`string`)](http://php.net/manual/es/language.types.string.php)

ricpelo's note: [Se usa `{$var}` y no `${var}`](https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md#variable-substitution)  

### [Operadores de cadenas](http://php.net/manual/es/language.operators.string.php)

#### Concatenación

#### [Acceso y modificación por caracteres](http://php.net/manual/es/language.types.string.php#language.types.string.substr)

ricpelo's note: - `echo $a[3]`  
- `$a[3] = 'x';`  

#### [Operador de incremento](http://php.net/manual/es/language.operators.increment.php) #opcional

### [Funciones de manejo de cadenas](http://php.net/ref.strings)

### [Extensión *mbstring*](http://php.net/manual/en/book.mbstring.php)

ricpelo's note: - `$a[3]` equivale a `mb_substr($a, 3, 1)`  
- `$a[3] = 'x';` no tiene equivalencia directa. Se podría hacer:  
    `$a = mb_substr($a, 2, 1) . 'x' . mb_substr($a, 4);`  

## [Nulo (`null`)](http://php.net/manual/es/language.types.null.php)

ricpelo's note: [`is_null()` vs. `=== null`](https://phpbestpractices.org/#checking-for-null)  
ricpelo's note: [El tipo `null` y el valor `null` se escriben en minúscula.](https://github.com/yiisoft/yii2/blob/master/docs/internals/core-code-style.md#51-types)  

# Manipulación de datos

## [Precedencia de operadores](http://php.net/manual/es/language.operators.precedence.php)

## Operadores de asignación compuesta

ricpelo's note: `$x `&nbsp;*\<op\>*`= $y`  

## Comprobaciones

### De tipos

#### [`gettype()`](http://php.net/manual/en/function.gettype.php)

#### [`is_*()`](http://php.net/manual/es/ref.var.php)

ricpelo's note: Poco útiles en formularios, ya que sólo se reciben `string`s.  

### De valores

#### [`is_numeric()`](http://php.net/manual/es/function.is-numeric.php)

#### [`ctype_*()`](http://php.net/manual/es/book.ctype.php)

## [Conversiones de tipos](http://php.net/manual/es/language.types.type-juggling.php)

### [Conversión explícita (forzado o *casting*) vs. automática](http://php.net/manual/es/language.types.type-juggling.php#language.types.typecasting)

ricpelo's note: Conversión de cadena a número  

### [Conversión a `bool`](http://php.net/manual/es/language.types.boolean.php#language.types.boolean.casting)

### [Conversión a `int`](http://php.net/manual/es/language.types.integer.php#language.types.integer.casting)

### [Conversión a `float`](http://php.net/manual/es/language.types.float.php#language.types.float.casting)

### [Conversión de `string` a número](http://php.net/manual/es/language.types.string.php#language.types.string.conversion)

ricpelo's note: **¡Cuidado!**:  
  
La documentación dice que `$x = 1 + "pepe"` o `$x = 1 + "10 pepe"` funciona, pero dependiendo del valor de `error_reporting` en `php.ini`, puede dar un **PHP Warning:  A non-numeric value encountered** o un **PHP Warning: A non well formed numeric value encountered**, respectivamente.  
- Si `error_reporting = E_ALL`, dará el mensaje de advertencia.  
  Además, en PsySH no funcionará, es decir, que `$x` no se asignará al valor. En `php -a` sí funcionará (aunque da el mismo mensaje de advertencia).  
- Si `error_reporting = E_ALL & ~E_NOTICE`, no lo dará.  
  Además, funcionará tanto en PsySH como en `php -a`.  

### [Conversión a `string`](http://php.net/manual/es/language.types.string.php#language.types.string.casting)

### Funciones de obtención de valores

ricpelo's note: Hacen más o menos lo mismo que los *casting* pero con funciones en lugar de con operadores. Puede ser interesante porque las funciones se pueden guardar, usar con *map*, *reduce*, etc.  

#### [`intval()`](http://php.net/manual/es/function.intval.php)

#### [`floatval()`](http://php.net/manual/es/function.floatval.php)

#### [`strval()`](http://php.net/manual/es/function.strval.php)

#### [`boolval()`](http://php.net/manual/es/function.boolval.php)

### Funciones de formateado numérico

#### [`number_format()`](http://php.net/manual/es/function.number-format.php)

#### [`money_format()`](http://php.net/manual/es/function.money-format.php)

[`setlocale()`](http://php.net/manual/es/function.setlocale.php)

ricpelo's note: `setlocale(LC_ALL, 'es_ES.UTF-8'); // Hay que poner el *locale* completo, con la codificación y todo (.UTF-8)`  

## Comparaciones

### [Operadores de comparación](http://php.net/manual/es/language.operators.comparison.php)

ricpelo's note: `"250" < "27"` devuelve `false`  
ricpelo's note: Si se compara un número con un string o la comparación implica strings numéricos, entonces cada string es convertido en un número y la comparación realizada numéricamente.  

### `==` vs. `===`

### [Ternario (`?:`)](http://php.net/manual/es/language.operators.comparison.php#language.operators.comparison.ternary)

### [Fusión de `null` (`??`)](https://wiki.php.net/rfc/isset_ternary)

ricpelo's note: Equivalente al `COALESCE()` de SQL.  

### [Reglas de comparación de tipos](http://php.net/manual/es/types.comparisons.php)

# [Constantes](http://php.net/manual/es/language.constants.syntax.php)

ricpelo's note: Diferencias entre constantes y variables:  
- Las constantes no llevan el signo dólar (`$`) como prefijo.  
- Antes de PHP 5.3, las constantes solo podían ser definidas usando la función `define()` y no por simple asignación.  
- Las constantes pueden ser definidas y accedidas desde cualquier sitio sin importar las reglas de acceso de variables.  
- Las constantes no pueden ser redefinidas o eliminadas una vez se han definido.  
- Las constantes podrían evaluarse como valores escalares. A partir de PHP 5.6 es posible definir una constante de array con la palabra reservada `const`, y, a partir de PHP 7, las constantes de array también se pueden definir con `define()`. Se pueden utilizar arrays en expresiones escalares constantes (por ejemplo, `const FOO = array(1,2,3)[0];`), aunque el resultado final debe ser un valor de un tipo permitido.  

## `define()` y `const`

## [Constantes predefinidas](http://php.net/manual/es/language.constants.predefined.php)

## [`defined()`](http://php.net/manual/es/function.defined.php)

# Ejercicios

## Actividades

@. Busca información sobre la función `time()` usando, al menos, tres formas
   distintas.

@. Explica, con tus propias palabras, la diferencia entre:
    #. Un dato y una instrucción.
    #. Una expresión y una sentencia.
    #. Una sentencia y un comando.
    #. Una función y un operador.

@. ¿Es `echo` una función? ¿A dónde acudes para saberlo?

@. ¿Es lo mismo *modo de ejecución* que *modo de operación*? Explica cuáles son
   y en qué consisten los diferentes modos de ejecución y de operación en PHP.

@. ¿Qué ventajas e inconvenientes tiene usar PsySH frente al intérprete
   integrado?

---

@. ¿Qué tipos de asignación de variables existen en PHP? Explica sus
   diferencias y pon ejemplos de uso.

@. ¿Qué son las variables predefinidas? Enumera las más importantes.

@. Calcula el valor de las siguientes expresiones y razona por qué tienen ese
   valor:

    #. `false and true or 1`
    #. `1 == 1.0`
    #. `1 == 0.99999999999999999`
    #. `floor((0.1 + 0.7) * 10)`
    #. `'1' == 1`
    #. `empty('0')`

@. ¿`$a[3]` equivale a `mb_substr($a, 3, 1)`? Razona la respuesta.

@. Define con tus propias palabras el significado de *asociatividad* y
   de *prioridad*. ¿Por qué la expresión `1 == 1 == 1` es incorrecta pero
   `1 <= 1 == 1` es correcta (y cuál es su valor, por cierto)?

## Problemas

#. Escribir un programa en PHP que...

!RESPUESTAS
