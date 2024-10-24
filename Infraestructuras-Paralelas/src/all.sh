#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversion de un PNG a secuencia de pixeles, se procesan esos pixeles y
# posteriormente se convierte esa secuencia de pixeles a un archivo en formato
# PNG
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#

INPUT_DIR="./"
TEMP_FILE="image.bin"


for INPUT_PNG in ${INPUT_DIR}*.png; do
    echo "Procesando: ${INPUT_PNG}"

    TEMP_FILE="${INPUT_PNG%.png}.bin"

    python3 fromPNG2Bin.py ${INPUT_PNG}
    ./main ${TEMP_FILE}                      
    python3 fromBin2PNG.py ${TEMP_FILE}.new

    echo "Procesado y guardado: ${INPUT_PNG}"
done
