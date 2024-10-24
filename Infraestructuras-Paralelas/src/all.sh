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

for img in public/assets/*.jpg; do
    echo "Processing $img"
    base=$(basename $img .jpg)
    python3 fromPNG2Bin.py $img
    ./main image.bin
    python3 fromBin2PNG.py image.bin.new
    mv image.bin.new.png processed_${base}.png
done