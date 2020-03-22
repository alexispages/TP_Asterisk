#!/bin/bash
# Script permettant d'obtenir un fichier txt à partir du bulletin météo de la commande weather

temp=$(weather lfmu | awk 'NR==3{sub(/\(/, ""); print $4}')
humidity=$(weather lfmu | awk 'NR == 4{print $3}')
wind_speed_mph=$(weather lfmu | awk 'NR==5{print $8}')

# Conversion MPH en KM/H + arrondi à l'unité
wind_speed_kmh=$(echo "$wind_speed_mph*1.60934" | bc | awk '{printf("%d\n",$1 + 0.5)}')

echo "Aujourd'hui, la température est de $temp degrés avec une humidité de $humidity. Le vent souffle a une vitesse de $wind_speed_kmh kilomètres par heure." > weather.txt
