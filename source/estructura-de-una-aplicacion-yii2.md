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

---

`bootstrap`

:   Permite definir componentes que se cargarán durante el proceso de arranque
de la aplicación.

    Recordemos que un componente de aplicación, normalmente, no se carga hasta
    que se accede a él por primera vez indicando el ID del servicio asociado en
    `\Yii::$app->ID`. En cambio, a veces interesa que determinados componentes
    se carguen y se ejecuten **siempre** al iniciarse la aplicación:

    ```php
    [
        'bootstrap' => [
            'app\components\Profiler',
        ],
    ]
    ```

---

`language`

:   Especifica el idioma en el que la aplicación deberá mostrar el contenido a
los usuarios finales.

    El valor predeterminado es `en`.

    Para usar el español de España, lo correcto sería establecerlo a `es-ES`:

    ```php
    [
        'language' => 'es-ES',
    ]
    ```

---

`timeZone`

:   Define la zona horaria con la que trabajará la aplicación a la hora de
manipular fechas y horas.

    El valor predeterminado es `UTC`.

    En España, lo correcto sería usar `Europe/Madrid`, pero más correcto sería
    usar la zona horaria que el usuario establezca en su perfil.

    ```php
    [
        'timeZone' => 'Europe/Madrid',
    ]
    ```

# Componentes de aplicación

## Componentes de aplicación

- Recordemos que las aplicaciones son *localizadores de servicios*.

- Las aplicaciones contienen los llamados **componentes de aplicación**, los
  cuales proporcionan diferentes servicios útiles durante el procesamiento de
  las peticiones.

- Por ejemplo:

  - El componente `urlManager` es responsable de encaminar (*enrutar*) las
    peticiones web a los controladores apropiados.

  - El componente `db` proporciona servicios relacionados con la base de datos.

---

- Cada componente de aplicación tiene un ID que lo identifica de forma única
  entre los demás componentes de la misma aplicación.

- Se puede acceder a un componente de aplicación mediante la expresión
  `\Yii::$app->ID`.

- Por ejemplo, se puede usar `\Yii::$app->db` para acceder a la conexión a la
  base de datos, o `\Yii::$app->cache` para obtener la caché principal
  registrada en la aplicación.

- Un componente de aplicación se crea la primera vez que se accede a él usando
  la expresión anterior. Los demás accesos posteriores devolverán la misma
  instancia sin crear otro objeto.

---

Como vimos anteriormente, los componentes de aplicación se definen (o
*registran*) a través de la propiedad `components` de la configuración de la
aplicación:

```php
[
    'components' => [
        // registra el componente "cache" usando un nombre de clase:
        'cache' => 'yii\caching\ApcCache',

        // registra el componente "db" usando una configuración:
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'pgsql:host=localhost;dbname=demo',
            'username' => 'usuario',
            'password' => 'contraseña',
        ],

        // registra el componente "search" usando una función anónima:
        'search' => function () {
            return new app\components\SolrService;
        },
    ],
]
```

## Componentes de aplicación principales

- Yii 2 define un conjunto de componentes de aplicación *principales* o
  predefinidos, con IDs fijos y configuraciones predeterminadas.

- Gracias a esos componentes principales, las aplicaciones pueden procesar las
  peticiones de los usuarios.

- Es posible configurar y personalizar esos componentes como si fueran
  componentes de aplicación normales. Cuando se configura un componente de
  aplicación principal, si no se indica la clase a usar, se usará su clase
  predeterminada.

---

Lista de componentes de aplicación principales:

- `assetManager`: gestiona los *asset bundles* y la publicación de *assets*.
- `db`: representa la conexión a la base de datos.
- `errorHandler`: gestiona los errores y excepciones de PHP.
- `formatter`: formatea los datos para que los visualicen los usuarios finales.
- `i18n`: se encarga de la traducción de mensajes y la internacionalización.
- `log`: gestiona los registros de la aplicación.
- `mailer`: se encarga de la composición y envío de e-mails.
- `response`: representa la respuesta que va a ser enviada al usuario final.
- `request`: representa la petición recibida del usuario final.
- `session`: representa la información de la sesión (sólo en aplicaciones web).
- `urlManager`: se encarga de la interpretación y creación de URLs.
- `user`: representa la información de autenticación de usuarios.
- `view`: gestiona el renderizado de las vistas.

# Controladores

## Controladores

- Los **controladores** son parte de la arquitectura **MVC**.

- Son instancias de subclases (directas o indirectas) de `\yii\base\Controller`.

- Son los responsables de procesar las peticiones y generar las respuestas.

## Acciones

- Los controladores se componen de **acciones**.

- La acción es la unidad mínima de ejecución en una aplicación MVC.

- Es decir, es la unidad más básica que un usuario final puede solicitar que se
  ejecute.

- Un controlador puede tener una o más acciones.

---

Ejemplo:

```php
namespace app\controllers;

use app\models\Post;

class PostController extends \yii\web\Controller
{
    public function actionView($id)
    {
        $model = Post::findOne($id);
        if ($model === null) {
            throw new \yii\web\NotFoundHttpException;
        }

        return $this->render('view', [
            'model' => $model,
        ]);
    }
}
```

- En la acción `view` (definida por el método `actionView()`), se carga el
  modelo que corresponda al ID solicitado en `$id`. Si el modelo se carga
  correctamente, se muestra usando una vista llamada `view`. En caso contrario,
  se lanza una excepción.

---

```php
namespace app\controllers;

class PostController extends \yii\web\Controller
{
    public function actionCreate()
    {
        $model = new \app\models\Post;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }
}
```

- En la acción `create` (definida por el método `actionCreate()`) se intenta
  rellenar una instancia nueva del modelo usando los datos de la petición y
  luego se guarda el modelo. Si hay éxito se redirige al navegador a la acción
  `view` pasándole el ID del modelo recién creado. En caso contrario, se
  muestra la vista `create` para que los usuarios puedan introducir los datos.

## Rutas

- Los usuarios finales indican las acciones que desean ejecutar mediante las
  denominadas **rutas**.

- Una ruta es una cadena que consta de:

  El ID de un controlador

  : Una cadena que identifica de forma única a un controlador de entre todos
  los controladores de la misma aplicación.

  El ID de una acción

  : Una cadena que identifica de forma única a una acción de entre todas las
  acciones del mismo controlador.

- Las rutas toman la siguiente forma: `IDcontrolador/IDacción`.

- Por ejemplo: `socios/crear` (controlador `socios`, acción `crear`).

---

Para indicar una ruta, se utiliza el parámetro `r` enviado mediante GET.

Por tanto, si un usuario solicita la URL

`http://host/index.php?r=site/index`

se ejecutará la acción `index` del controlador `site`.

# Modelos

## Modelos

...

