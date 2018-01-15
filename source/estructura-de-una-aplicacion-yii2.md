---
title: Estructura de una aplicación Yii 2
author: Ricardo Pérez López
date: IES Doñana, curso 2017-18
---

# Introducción

## Introducción

![Estructura a gran escala de una aplicación
Yii2](http://www.yiiframework.com/doc-2.0/images/application-structure.png){.plain}

# Scripts de entrada

## Scripts de entrada

- Los **scripts de entrada** son el primer paso en el proceso de arranque de
  una aplicación.

- Una aplicación (ya sea web o de consola) tiene siempre un único script de
  etrnada.

- Los usuarios finales realizan peticiones a los scripts de entrada, los cuales
  instanciarán un objeto aplicación y le redirigirá las peticiones a él.

## Script de entrada de una aplicación web

- El script de entrada de una aplicación web se debe almacenar en un directorio
  accesible públicamente desde el exterior a través del servidor web, de forma
  que los usuarios finales pueda alcanzarlo.

- Normalmente se llama `index.php`, pero no es imprescindible.

- En la plantilla básica se encuentra en `web/index.php`.

## Script de entrada de una aplicación de consola

- El script de entrada de una aplicación de consola se guarda normalmente en la
  ruta base de la aplicación y con el nombre `yii` (así ocurre en la plantilla
  básica).

- Debe tener permiso de ejecución para que los usuarios puedan ejecutar la
  aplicación de consola mediante el comando:
  
  ```shell
  ./yii <ruta> [argumentos] [opciones]
  ```

# Aplicaciones

## Aplicaciones

...

# Componentes de aplicación

## Componentes de aplicación

...

# Controladores

## Controladores

...

# Modelos

## Modelos

...

