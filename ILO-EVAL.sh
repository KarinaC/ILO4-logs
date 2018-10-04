#!/bin/bash 

date=`date +"%m/%d/%Y"`

# Vaciamos el log
echo "" > /tmp/ilotest.log
echo "" > /tmp/iloout.log

# Printeamos fecha a log
#echo "Log del día $date" >> /tmp/ilotest.log 

# Obtenemos los últimos 6 records logs y limpiamos la data
for rec in `/home/karmukis/Documents/CLARO-ARGENTINA/SCRIPTS/EXPECT/ILO4-logs/ILO-logs.sh "${1}" "${2}" "${3}" "${4}" | grep record | tail -6 | awk -F 'cord' '{print $2}'` 
  do
    /home/karmukis/Documents/CLARO-ARGENTINA/SCRIPTS/EXPECT/ILO4-logs/ILO-logs.sh "${1}" "${2}" "${3}" "show /system1/log1/record${rec}"  | awk '/Properties/,/Verbs/' >> /tmp/iloout.log
  done






