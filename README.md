![banner](https://raw.githubusercontent.com/gutoccs/gutoccs/main/top_image.jpg)

## Flutter Examples - Ejemplos de Flutter :wave:

En este repositorio iré colocando poco a poco código de Flutter.

### Basic Cam (basic_cam) - Cámara Básica

En esta sección se utiliza un paquete simple para manejar la cámara y explorar la Galería de Imágenes. Además, utilizo el Manejador de Estados Providers.


### Ícono de la Aplicación

El ícono de la App se cambia por el Pokemon Charizard. Esto se logra gracias al paquete: flutter_launcher_icons

Una vez instalado el paquete, en el mismo pubspec.yaml se define la ubicación de la imagen (ícono). Esto se puede apreciar al final el archivo.

Para que este paquete termine de generar y configurar el ícono se debe ejecutar:

**flutter packages get**

**flutter packages pub run flutter_launcher_icons:main**


### Cambio de nombre de la Aplicación

El nombre por defecto de la App es el nombre de nuestro proyecto, en mi caso era: **flutter_examples**

El nuevo nombre que se muestra junto al ícono es: **F Examples**

Para esto solo se tuvo que editar dos archivos:

**flutter_examples/android/app/src/main/AndroidManifest.xml**

**flutter_examples/ios/Runner/Info.plist**

El primero edita el nombre para el Sistema Operativo **Android** y el segundo para **iOS**.
