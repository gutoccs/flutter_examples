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


### Cambio de Splash Screen en Android

Ahora, mientras se está cargando la App mostrará a Charizard.

Esta manera de cambiar el Splash Screen, es una forma simplista.

Lo idóneo es colocar la imagen en las carpetas mipmap con un tamaño en específico. Ya que Android determina el tamaño de la pantalla donde se está ejecutando la App y seleccionará la indicada.

Sin embargo, de igual manera resulta.


### Transparent AppBar (transparent_app_bar) - AppBar Transparent

No solo basta con colocar el color de fondo del AppBar en transparente, es necesario extender el body y quitar las sombras


### Page View (page_view) - Page View

PageView permite deslizarnos entre diferentes pantallas, en este caso creo 3 pantallas y el deslizamiento es vertical.

Por razones de comodidad construyo un Widget con el fin de reutilizarlo, para poder reutilizarlo debe recibir los parámetros, nombre de la playa, ubicación, URL de la imagen, entre otros.

En este ejemplo hago uso del Widget Stack, el cual nos permite apilar Widgets, es decir, coloca los Widgets uno encima del otro y en orden.

Además, las imágenes están en Internet y mientras realiza la carga muestra una imagen Placeholder, esta imagen si está en local.
