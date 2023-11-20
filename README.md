# LungCancerDetection-MATLAB
## Descripción:
Este repositorio contiene un código en MATLAB que implementa una interfaz gráfica de usuario (GUI) para el procesamiento de imágenes médicas. La interfaz permite cargar imágenes, realizar diversas operaciones de procesamiento de imágenes y visualizar los resultados de manera interactiva.

## Funcionalidades Principales:
### Carga de Imágenes:
Utiliza la función uigetfile para permitir al usuario cargar imágenes médicas desde el sistema de archivos.

### Visualización de Imágenes:
La interfaz muestra la imagen cargada y proporciona la capacidad de navegar entre diferentes imágenes.

### Operaciones de Procesamiento de Imágenes:
__Conversión a Escala de Grises:__ Transforma la imagen a escala de grises para simplificar el análisis.

__Binarización:__ Convierte la imagen en una imagen binaria para resaltar regiones de interés.

__Limpieza de Bordes:__ Elimina los bordes no deseados de la imagen binaria.

__Rellenado de Regiones:__ Rellena regiones en la imagen binaria para facilitar el análisis.

### Operaciones Morfológicas:
__Erosión:__ Reduce el tamaño de los objetos en la imagen binaria.
__Dilatación:__ Aumenta el tamaño de los objetos en la imagen binaria.

### Visualización de Resultados:
Muestra visualmente los resultados de las operaciones de procesamiento de imágenes.

### Detección de Contornos:
Identifica y destaca los contornos de las regiones en la imagen.
