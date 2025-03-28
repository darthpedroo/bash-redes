#!/bin/bash
for file in ~/BASURA/*; do 
    if [ -f "$file" ]; then 
        file_timestamp=$(stat --format=%Z "$file") #Devuelve la fecha de modidicacion
        current_timestamp=$(date +%s) 
        time_difference=$((current_timestamp-file_timestamp))
        seconds_to_delete=$((60 * 60 * 24 * 2))

        if [ $time_difference -gt $seconds_to_delete ]
        then
            rm $file
        else
            echo "Pasaron: $time_difference segundos. Todavia no podes borrar el archivo"
        fi
    fi 
done
