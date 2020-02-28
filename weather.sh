#!/bin/bash

temp=$(weather lfmu | awk 'NR==3{sub(/\(/, ""); print $4}')
humidity=$(weather lfmu | awk 'NR == 4{print $3}')
wind_dir=$(weather lfmu | awk 'NR==5{print $4}')
wind_speed_mph=$(weather lfmu | awk 'NR==5{print $8}')
wind_speed_kmh=$(echo "$wind_speed_mph*1.60934" | bc | awk '{printf("%d\n",$1 + 0.5)}')

echo "Aujourd'hui, la température est de $temp degrés avec une humidité de $humidity. Le vent viendra du $wind_dir avec une vitesse de $wind_speed_kmh km/h."
