---
title: Manejo de fechas, horas, instantes e intervalos en PHP, Yii 2, PostgreSQL y Heroku
author: Ricardo Pérez López
!DATE
---

# Aspectos esenciales

## Aspectos esenciales

- Hay que trabajar siempre en UTC.

- Hay que trabajar siempre en formato ISO 8601.

- Sólo se convierte al formato español (y a la zona horaria que toque) justo cuando se muestre al usuario.

# Configuración inicial

## PostgreSQL

# Manejo en PHP

## Manejo en PHP

sdflkjsdlkfjsdf.

## Representación de fechas, horas e instantes en PHP

- Como marcas de tiempo UNIX (UNIX timestamps): número de segundos transcurridos desde el 1/1/1970 a las 00:00:00.
  - Usado por funciones date(), time(), localtime(), mktime(), cookie()
  - Sólo interesante para ciertas situaciones cuando no importa el idioma. En tal caso pueden resultar bastante prácticas.
  - También es lo que devuelve IntlDateFormatter::parse().

- Como instancias de la clase DateTime, DateTimeImmutable.
  - Más interesante en general.

## Patrones de formatos

- ICU
- PHP
- jQuery UI
- to_char() de PostgreSQL

http://www.yiiframework.com/doc-2.0/yii-helpers-formatconverter.html

## Convertir cadena en fecha/hora/instante

- DateTime::createFromFormat() no interesa, porque no entiende el español.
- strtotime() tampoco interesa, porque tampoco entiende el español.
- Lo mejor es usar la extensión Intl:

    ```php
    $fmt = new IntlDateFormatter(
        'es-ES',
        IntlDateFormatter::LONG,
        IntlDateFormatter::LONG,
        'Europe/Madrid',
        null,
        'dd-MMMM-yyyy HH:mm:ss'
    );
    $fmt->parse('25-enero-2018 17:01:43'); // => 1516896103
    ```

## Convertir fecha/hora/instante en cadena

- date() no interesa, porque lo saca en inglés.
- A DateTime::format() le pasa lo mismo.
- strftime() junto con setlocale(LC_ALL, 'es_ES.UTF8') funciona bien, pero:
  - hay que hacer primero el setlocale().
  - usa un formato raro distinto al de las demás funciones, con %:
    strftime('%d-%B-%Y %H:%M:%S'), aunque eso tampoco es que sea muy grave.
  - tiene en cuenta la zona horaria definida con date_default_timezone_set(). Para que se vea en nuestra zona horaria, primero hay que hacer date_default_timezone_set('Europe/Madrid'), luego hacer el strftime() y luego volver a hacer date_default_timezone_set('UTC').

## Manejo de intervalos en PHP

- La clase DateInterval.

# Manejo en Yii 2

## Manejo en Yii 2

# Manejo en PostgreSQL

## Manejo en PostgreSQL


