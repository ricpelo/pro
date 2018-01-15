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
  entrada.

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

## ¿Qué hacen los scripts de entrada?

Principalmente, hacen lo siguiente:

- Define constantes globales.
- Registran el autoloader de Composer.
- Incluye el archivo de la clase Yii.
- Carga la configuración de la aplicación.
- Crea y configura una instancia de la aplicación.
- Llama a `yii\base\Application::run()` para procesar la petición entrante.

## Ejemplo

Script de entrada de la aplicación web de la plantilla `yii2-app-basic`:

```php
<?php

defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'dev');

// registra autoloader de Composer
require __DIR__ . '/../vendor/autoload.php';

// incluye el archivo de la clase Yii
require __DIR__ . '/../vendor/yiisoft/yii2/Yii.php';

// carga la configuración de la aplicación
$config = require __DIR__ . '/../config/web.php';

// crea, configura y ejecuta la aplicación
(new yii\web\Application($config))->run();
```

# Aplicaciones

## Aplicaciones

- Las aplicaciones son los objetos que gobiernan la estructura general y el
  ciclo de vida de una aplicación Yii 2.

- Cada aplicación en Yii 2 contiene un único objeto aplicación.

- Ese objeto se crea en el script de entrada.

- Se puede acceder a él desde cualquier parte usando la expresión `\Yii::$app`.

## Configuración de aplicaciones

- Cuando un script de entrada crea una aplicación, cargará su configuración y
  se la aplicará a la aplicación al instanciar el objeto aplicación:

```php
<?php

require __DIR__ . '/../vendor/autoload.php';
require __DIR__ . '/../vendor/yiisoft/yii2/Yii.php';

// carga la configuración de la aplicación desde el archivo config/web.php
$config = require __DIR__ . '/../config/web.php';

// instancia, configura y ejecuta la aplicación
(new yii\web\Application($config))->run();
```

---

- Como pasa con cualquier otra configuración, la configuración de la aplicación
  especifica cómo inicializar las propiedades del objeto aplicación.

- Como las configuraciones de aplicación suelen ser muy complejas, normalmente
  se mantienen en archivos de configuración separados, como el `config/web.php`
  del ejemplo anterior. 

- Precisamente, `config/web.php` es el archivo principal de configuración de la
  aplicación web en la plantilla básica de Yii 2.

## Propiedades de la aplicación

- Las aplicaciones tienen muchas propiedades importantes que se pueden
  configurar mediante una configuración de aplicación.

- Por ejemplo, las aplicaciones deben saber cómo y dónde cargar controladores,
  dónde guardar los archivos temporales, etc.

- Las dos únicas propiedades obligatorias son:

  - `id`: un identificador único que diferencia una aplicación de las demás.

  - `basePath`: especifica el directorio raíz de la aplicación (a donde apunta
    el alias `@app`).

## Propiedades importantes de una aplicación

`components`

:   Permite registrar (y configurar) en la aplicación los **componentes de
aplicación** que alojará la misma (recuerda que una aplicación es un
*localizador de servicios*). Por ejemplo:

    ```php
    [
        'components' => [
            'cache' => [
                'class' => 'yii\caching\FileCache',
            ],
            'user' => [
                'identityClass' => 'app\models\User',
                'enableAutoLogin' => true,
            ],
        ],
    ]
    ```

    Aquí se especifican dos componentes de aplicación: `cache` y `user.` Cada
    componente va asociado con la configuración que se usará al instanciar ese
    componente. Después se podrá acceder a ellos haciendo, por ejemplo,
    `\Yii::$app->cache`.

---

`aliases`

:   Te permite definir un conjunto de alias usando un array. Por ejemplo:

    ```php
    [
        'aliases' => [
            '@nombre1' => 'ruta/del/alias1',
            '@nombre2' => 'ruta/del/alias2',
        ],
    ]
    ```

    Equivale a hacer:
    
    ```php
    \Yii::setAlias('@nombre1', 'ruta/del/alias1')
    \Yii::setAlias('@nombre2', 'ruta/del/alias2')
    ```

# Componentes de aplicación

## Componentes de aplicación

...

# Controladores

## Controladores

...

# Modelos

## Modelos

...

