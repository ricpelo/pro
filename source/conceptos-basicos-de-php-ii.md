---
title: Conceptos básicos de PHP II
author: Ricardo Pérez López
date: IES Doñana, curso 2018-19
---


# Flujo de control

## [Estructuras de control](http://php.net/manual/es/language.control-structures.php)

### [Sintaxis alternativa](http://php.net/manual/es/control-structures.alternative-syntax.php)

ricpelo's note: El `do { ... } while (...);` **no** tiene sintaxis alternativa.  

## Inclusión de scripts

### [`include`](http://php.net/manual/es/function.include.php), `require`

ricpelo's note: - El nombre del archivo debe aparecer con su extensión. No vale hacer `require 'pepe';`.  
- Cuando un archivo es incluido, el intérprete abandona el modo PHP e ingresa al modo HTML al comienzo del archivo objetivo y se reanuda de nuevo al final.  
- Si el archivo incluido tiene un `return ...;`, el `include` o el `require` que lo incluya devolverá el valor devuelto por el `return`.  
- Si no se usa una ruta, se busca primero en el `include_path` **antes** que en el directorio del propio script que hace el `include`. Por eso es mejor usar `require './pepe.php'` que `require 'pepe.php'`.  
- Puede ser útil usar la constante `__DIR__`.  

### [`include_once`](http://php.net/manual/es/function.include-once.php), `require_once`

# Funciones predefinidas destacadas

## [`isset()`](http://php.net/manual/es/function.isset.php)

ricpelo's note: Cuidado si la variable contiene `null`.  
ricpelo's note: No da error ni advertencia si la variable no existe.  

## [`empty()`](http://php.net/manual/es/function.empty.php)

ricpelo's note: Para evitar el problema de `empty("0") === true`:  
```php  
function is_blank($value) {  
    return empty($value) && !is_numeric($value);  
}  
```  
ricpelo's note: No da error ni advertencia si la variable no existe.  

## [`var_dump()`](http://php.net/manual/es/function.var-dump.php)

# [Arrays](http://php.net/manual/es/language.types.array.php)

ricpelo's note: Las claves pueden ser enteros o cadenas.  

## [Operadores para arrays](http://php.net/manual/es/language.operators.array.php)

ricpelo's note: **Comparaciones**: Un `array` con menos elementos es menor. De otra forma, compara valor por valor.  

### [Acceso, modificación y agregación](http://php.net/manual/es/language.types.array.php#language.types.array.syntax.modifying)

## [[Funciones de manejo de arrays](http://php.net/manual/es/book.array.php)](http://php.net/manual/es/ref.array.php)

### [Ordenación de arrays](http://php.net/manual/es/array.sorting.php)

### `print_r()`

### `'+'` vs. `array_merge()`

### [`isset()` vs. `array_key_exists()`](http://php.net/manual/es/function.array-key-exists.php#107786)

## [`foreach`](http://php.net/manual/es/control-structures.foreach.php)

## [Conversión a `array`](http://php.net/manual/es/language.types.array.php#language.types.array.casting)

## [*Ejemplo*: `$argv` en CLI](http://php.net/manual/es/reserved.variables.argv.php)

# [Funciones definidas por el usuario](http://php.net/manual/es/language.functions.php)

## [Argumentos](http://php.net/manual/es/functions.arguments.php)

### [Paso de argumentos por valor y por referencia](http://php.net/manual/es/functions.arguments.php#functions.arguments.by-reference)

### [Argumentos por defecto](http://php.net/manual/es/functions.arguments.php#functions.arguments.default)

ricpelo's note: ```php  
function prueba($opciones = []) {  
    extract($opciones);  
    // ...  
}  
```  

## [Ámbito de variables](http://php.net/language.variables.scope)

### Ámbito simple al archivo

### Variables locales

### Uso de `global`

ricpelo's note: Usar `global $x;` cuando `$x` no existe hace que `$x` empiece a existir y valga `null`.  

### [Variables superglobales](http://php.net/manual/es/language.variables.superglobals.php)

## Declaraciones de tipos

ricpelo's note: **NO** se hacen conversiones implícitas a `array`, ni en argumentos ni en devolución.  

### [Declaraciones de tipo de argumento](http://php.net/manual/es/functions.arguments.php#functions.arguments.type-declaration)

### [Declaraciones de tipo de devolución](http://php.net/manual/es/functions.returning-values.php#functions.returning-values.type-declaration)

### [Tipos *nullable* (`?`) y `void`](http://php.net/manual/es/migration71.new-features.php)

ricpelo's note: Una función de tipo `void` realmente devuelve `null`.  

### [Tipificación estricta](http://php.net/manual/es/functions.arguments.php#functions.arguments.type-declaration.strict)

ricpelo's note: El `declare(strict_types=1);` se pone en el archivo que hace la llamada, no en el que define la función.  

# Comentarios y documentación del código

ricpelo's note: ```coffeescript  
# ~/.atom/snippets.cson  
'.text.html.php':  
    'Comentario de archivo':  
      'prefix': 'com'  
      'body': """  
        /**  
         * @author Ricardo Pérez López  
         * @copyright Copyright (c) 2017 Ricardo Pérez López  
         * @license https://www.gnu.org/licenses/gpl.txt  
         */  
  
        """  
```  

# Ejercicios

## [¡Hola, mundo!](https://github.com/iesdonana/hola-mundo)

## [Hamming](https://github.com/iesdonana/hamming)

## [Isograma](https://github.com/iesdonana/isograma)