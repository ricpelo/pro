---
title: Interoperabilidad
author: Ricardo Pérez López
!DATE
---

# [Versionado semántico](https://semver.org/lang/es/)


# [Composer](https://getcomposer.org/)


## Paquetes


## [Packagist](https://packagist.org/)


## [Dependencias](https://getcomposer.org/doc/01-basic-usage.md#composer-json-project-setup)


### `composer.json` y `composer.lock`


## [Versiones y restricciones](https://getcomposer.org/doc/articles/versions.md)


### Versión exacta

ricpelo's note: - `x.y.z` es exactamente esa versión  
- `x.y` equivale a `x.y.0`  
- `x` equivale a `x.0.0`  
- Se usa en los siguientes tipos de restricciones

### Rango (`>`, `>=`, `<`, `<=`, `!=`, ` `, `,`, `||`)


### Guión (`-`)


### Asterisco (`*`)

ricpelo's note: - `x.y.*` equivale a `>=x.y <x.(y+1)`  
- `x.*` equivale a `>=x <(x+1)`  
- `*` equivale a cualquiera

### Tilde (`~`)

ricpelo's note: Especifica una versión mínima y permite que avance el último dígito indicado pero no el primero.  
ricpelo's note: - `~x.y.z` equivale a `>=x.y.z <x.(y+1)`  
- `~x.y` equivale a `>=x.y <(x+1)`  
- `~x` equivale a `>=x <(x+1)`

### Gorrito (`^`)

ricpelo's note: También permite especificar una versión mínima, pero impide actualizaciones que rompen la compatibilidad hacia atrás (es decir, permite que aumenten todos los números excepto el *mayor*).  
ricpelo's note: - `^x.y.z` equivale a `>=x.y.z <(x+1)`  
- `^x.y` equivale a `>=x.y <(x+1)`  
- `^x` equivale a `>=x <(x+1)`

### Nombres de rama


#### `dev-master`

ricpelo's note: Equivale al último commit de la rama `master`.

#### `5.1.x-dev`

ricpelo's note: Equivale al último commit de la rama `5.1`.

### [Estabilidad mínima](https://getcomposer.org/doc/articles/versions.md#minimum-stability)


### [Comprobador online de restricciones](https://semver.mwl.be)

ricpelo's note: Probar con `laravel/laravel`.

## Comandos básicos


### [`require`](https://getcomposer.org/doc/03-cli.md#require)


### [`install`](https://getcomposer.org/doc/03-cli.md#install)


### [`update`](https://getcomposer.org/doc/03-cli.md#update)


## Entornos de desarrollo y producción


# [Autocarga de clases](http://php.net/manual/es/language.oop5.autoload.php)


## [`spl_autoload_register()`](http://php.net/manual/es/function.spl-autoload-register.php)

ricpelo's note: - Cuando se llama sin argumentos, registra el manejador predeterminado ([`spl_autoload()`](http://php.net/manual/es/function.spl-autoload.php)), el cual autocarga el archivo `.php` a partir del nombre de la clase **en minúsculas** (la clase `A` la busca en `a.php`).  
- `spl_autoload_register(function ($c) { include "$c.php"; });`  
- `spl_autoload_register(function ($c) { include strtolower(str_replace('\\', '/', $c) . '.php'; });`

## [PSR-4](http://www.php-fig.org/psr/psr-4/)


## [Autoloader de Composer](https://getcomposer.org/doc/01-basic-usage.md#autoloading)


# Ejemplos


## `mpdf/mpdf`

ricpelo's note:
```php
<?php

// composer require mpdf/mpdf

require 'vendor/autoload.php';

$mpdf = new Mpdf\Mpdf();
$mpdf->WriteHTML('<h1>¡Hola, mundo!</h1>');
$mpdf->Output('salida.pdf');
```

## `ramsey/uuid`


## `doctrine/inflector`


# Recomendaciones PSR del [PHP-FIG](http://www.php-fig.org/) (Framework Interop Group)

ricpelo's note: PHP Standard Recommendation

## [PSR-1: Basic Coding Standard](http://www.php-fig.org/psr/psr-1/)


## [PSR-2: Coding Style Guide](http://www.php-fig.org/psr/psr-2/)


## [PSR-4: Autoloading Standard](http://www.php-fig.org/psr/psr-4/)


## [PSR-5: PHPDoc Standard (borrador)](https://github.com/phpDocumentor/fig-standards/blob/master/proposed/phpdoc.md)


## [PSR-11: Extended Coding Style Guide (borrador)](https://github.com/php-fig/fig-standards/blob/master/proposed/extended-coding-style-guide.md)


## [PSR-19: PHPDoc tags (borrador)](https://github.com/php-fig/fig-standards/blob/master/proposed/phpdoc-tags.md)


# Paquetes de Atom y herramientas externas #opcional

ricpelo's note:

```  
$ composer global require --prefer-dist friendsofphp/php-cs-fixer "squizlabs/php_codesniffer:^2.7" yiisoft/yii2-coding-standards  
$ sudo ln -sf /opt/composer ~/.config/composer  
$ apm install linter-phpcs php-cs-fixer  
$ phpcs --config-set default_standard /opt/composer/vendor/yiisoft/yii2-coding-standards/Yii2  
```  

ricpelo's note: https://github.com/ricpelo/conf

## PHP_CodeSniffer


## PHP-CS-Fixer


## Yii2-Shell


# Ejercicios


## De versionado semántico


## De versiones y restricciones


## De uso básico de Composer


## De buscar paquetes en Packagist que tengan una funcionalidad concreta y usarlos en un ejemplo


