#!/bin/bash
echo "--Estado del sistema--"
echo " "
echo "Nombre del equipo: $(hostname)"
echo " "
echo "IP Actual: $(hostname -I | awk '{print $2}')"
echo " "
echo "Espacio en disco:"
df -h / | tail -n 1 | awk '{print "Total: " $2 ", Usado: " $3 ", Libre: " $4}'