# Servicio zweicom_service

Para el servicio se creó un contenedor con una instalación mínima de Python 3, esto se encuentra en el archivo `Dockerfile`. Primero crea un contenedor temporal en donde se instalan las herramientas para instalar las dependencias de la aplicación en un virtualenv, para luego copiar ese virtualenv un segundo contenedo. En este último es donde se compia también la aplicación. Esto ayuda a reducir el tamaño de la imagen y que esta no contenga elementos que solo fueron necesarios para su instalación. 

Se incorporó gunicorn para levantar el servicio y que este pueda soportar concurrencia de mejor manera en un ambiente productivo. Las dependencias del servicio se encuentran en el archivo `requirements.txt`.

## Dependencias

La máquina donde se instalará debe tener instalado previamente:

    - Docker
    - Makefile
    - Curl

### Instalación

- Descargar el repositorio.

    ```
    git clone https://github.com/fjfuente77/zweicom.git
    ```

- Desplegar el servicio. Esto crea la imagen, levanta el servicio, corre un test y luego destruye el contenedor. En caso que el servicio no responda correctamente, el despliegue falla y se debe ejecutar el comando `make down` posteriormente.

    ```
    make deploy
    ```

## Ejecución

Para ejecutar el servicio y este siga funcionando en segundo plano:

    make run

Detener el servicio:

    make down

En caso que requiera crear nuevamente la imagen del contenedor de forma manual:

    make build

Para probar el servicio de forma manual, primero debe asegurarse que se encuentra en ejecución  `docker ps`. Se puede realizar de dos formas:

1. Ejecutando `make test`
2. Ejecutar `.test.sh`

Si el servicio se encuentra en funcionamiento, se muestra por consola "Test Ok." y el código de salida de la aplicación es 0. En caso de no encontrarse en funcionamiento se muestra por consola "El servicio no ha pasado el test." y el código de salida de la aplicación es 1.


## Uso

    curl http://localhost:5000