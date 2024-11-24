#!/bin/bash

echo -e "\e[36m
╭━━╮╭━━┳━╮╱╭╮
┃╭╮┃╰┫┣┫┃╰╮┃┃
┃╰╯╰╮┃┃┃╭╮╰╯┃
┃╭━╮┃┃┃┃┃╰╮┃┃
┃╰━╯┣┫┣┫┃╱┃┃┃
╰━━━┻━━┻╯╱╰━╯
╭━━━━┳━━━┳━━━┳━━━┳╮╱╭┳━━━┳━━━━┳━━━┳━━━╮
┃╭╮╭╮┃╭━╮┃╭━╮┣╮╭╮┃┃╱┃┃╭━╮┃╭╮╭╮┃╭━╮┃╭━╮┃
╰╯┃┃╰┫╰━╯┃┃╱┃┃┃┃┃┃┃╱┃┃┃╱╰┻╯┃┃╰┫┃╱┃┃╰━╯┃
╱╱┃┃╱┃╭╮╭┫╰━╯┃┃┃┃┃┃╱┃┃┃╱╭╮╱┃┃╱┃┃╱┃┃╭╮╭╯
╱╱┃┃╱┃┃┃╰┫╭━╮┣╯╰╯┃╰━╯┃╰━╯┃╱┃┃╱┃╰━╯┃┃┃╰╮
╱╱╰╯╱╰╯╰━┻╯╱╰┻━━━┻━━━┻━━━╯╱╰╯╱╰━━━┻╯╰━╯\e[0m"

echo -e "\e[1;33mTRADUCTOR INGLES-ESPAÑOL CARDO49\e[0m"

# Verifica si el usuario tiene instalado el paquete 'translate-shell'
if ! command -v trans &> /dev/null; then
    echo "Por favor, instala el paquete 'translate-shell' con el comando: pkg install translate-shell"
    exit 1
fi

# Directorio donde se guardarán los archivos traducidos
output_dir="/sdcard/traduccion"

# Crea el directorio si no existe
mkdir -p "$output_dir"

# Pide al usuario que ingrese el texto a traducir
echo "Ingresa el texto a traducir (o escribe 'salir' para terminar):"

while true; do
    read -r text
    if [[ "$text" == "salir" ]]; then
        break
    fi

    # Traduce el texto de inglés a español
    translation=$(trans -b en:es "$text")

    # Genera el nombre del archivo de salida
    output_file="$output_dir/traduccion_$(date +"%Y%m%d_%H%M%S").txt"

    # Guarda la traducción en el archivo
    echo "$translation" > "$output_file"
    echo "Traducción guardada en: $output_file"

    echo "Ingresa más texto a traducir (o escribe 'salir' para terminar):"
done

echo "¡Proceso terminado!"