#!/usr/bin/env bash

start_time=$(date +%s)

INPUT_DIR="../public/imagen/"
TEMP_FILE="image.bin"


for INPUT_PNG in ${INPUT_DIR}*.png; do
    echo "Procesando: ${INPUT_PNG}"

    TEMP_FILE="${INPUT_PNG%.png}.bin"

    python3 fromPNG2Bin.py ${INPUT_PNG}
    ./main ${TEMP_FILE}                      
    python3 fromBin2PNG.py ${TEMP_FILE}.new

    echo "Procesado y guardado: ${INPUT_PNG}"
done

end_time=$(date +%s)
execution_time=$((end_time - start_time))
echo "Total tiempo de ejecución: $execution_time segundos"