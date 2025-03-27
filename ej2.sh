#!/bin/bash

shopt -s extglob
file_being_edited=$(echo "data.bin")

function check_current_type(){
    
    current_type=$(file $1)

    gziptest=$(echo $current_type | grep "gzip compressed")
    bziptest=$(echo $current_type | grep "bzip2 compressed")
    tartest=$(echo $current_type | grep "tar archive")
    asciitest=$(echo $current_type | grep "ASCII text")

    if [ ${#gziptest} -gt 0  ]
    then
        mv $1 data.gz
        rm data 2>/dev/null

        gzip -d data.gz
        file_being_edited="data"
      #  echo "Te fuiste gziped niga"
    elif [ ${#bziptest} -gt 0 ]
    then   
        
        mv $1 data.bz2
        rm data 2>/dev/null

        bzip2 -d data.bz2
        file_being_edited="data"
      #  echo "Te fuiste Bziped ahora"
    elif [ ${#tartest} -gt 0 ]
    then
        file_being_edited=$(tar xvf $1)
     #   echo "Te fuiste Tared amigo"
       # echo "editing: $file_being_edited"
    
    elif [ ${#asciitest} -gt 0 ]
    then
        cat data
        exit 1
    fi

}

function delete_files(){
    rm -v !("data.txt"|"ej1.sh")
}

echo "Iniciando la resolucion del ej 12-13 bandit!"

delete_files

touch data.bin

xxd -r data.txt data.bin

for i in {1..10}; do
    #echo "editing después de ${i}ra ejecución: $file_being_edited"
    check_current_type "$file_being_edited"
done

