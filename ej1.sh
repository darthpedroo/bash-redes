#!/bin/bash

echo "Ingresa tu fecha de nacimiento en formato (dd/mm/aaaa)"

read user_date

dia=$(echo $user_date | cut -d "/" -f1)
mes=$(echo $user_date | cut -d "/" -f2)
ano=$(echo $user_date | cut -d "/" -f3)

if [ $dia -lt 1 ] || [ $dia -gt 31 ]
then
    echo "Ingresaste un dia invalido"
    exit 1
fi

if [ $mes -lt 1 ] || [ $dia -gt 12 ]
then 
    echo "Ingresaste un mes invalido"
    exit 1
fi

if [ $dia -lt 10 ]
then
    dia=$(echo "0$dia")
fi

if [ $mes -lt 10 ]
then
    mes=$(echo "0$mes")
fi

CURDATE=$( date '+%F' )
CURDATE_DIA=$(echo $CURDATE | cut -d "-" -f3)
CURDATE_MES=$(echo $CURDATE | cut -d "-" -f2)
CURDATE_ANO=$(echo $CURDATE | cut -d "-" -f1)

curdate_formated=$(echo "$CURDATE_ANO$CURDATE_MES$CURDATE_DIA") 
birthday_formtaed=$(echo "$ano$mes$dia")

echo "Viviste estas horas: "$(( ($(date --date="$curdate_formated" +%s) - $(date --date="$birthday_formtaed" +%s) )/(60*60) ))