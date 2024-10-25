import numpy as np
from PIL import Image
import sys
import os

if len(sys.argv) != 2:
    print("Dar nombre de archivo")
    sys.exit(1)

INPUT_FILE = sys.argv[1]
FILENAME = os.path.splitext(os.path.basename(INPUT_FILE))[0]

# Especifica la ruta de salida aquí
OUTPUT_DIR = "../public/final"  

# Crear la carpeta de salida si no existe
if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

OUTPUT_FILE = os.path.join(OUTPUT_DIR, f"{FILENAME}.png")

# Leer el archivo binario y convertirlo a un array de NumPy
array_imagen = np.fromfile(INPUT_FILE, dtype='int32')

# Determinar las dimensiones adecuadas del archivo BIN
size = int(np.sqrt(len(array_imagen)))
array_imagen = array_imagen.reshape((size, size))

# Convertir el array a una imagen en escala de grises
imagen = Image.fromarray(array_imagen.astype('uint8'))

# Guardar la imagen en formato PNG
imagen.save(OUTPUT_FILE)

print(f"Imagen guardada en {OUTPUT_FILE}")
