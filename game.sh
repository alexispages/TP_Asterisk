#!/bin/bash
# Script jeu du plus ou moins
min=1
max=99
nbr=0
tentatives=0
# nombre aléatoire entre $min et $max
aleatoire=$[($RANDOM % ($[$max - $min] + 1)) + $min]

while [ $nbr -ne $aleatoire ] ; do
	echo -n "Donnez un nombre entre $min et $max : "
	read nbr
	if [ $nbr -lt $aleatoire ] ; then
		echo "Le nombre est plus grand"
	elif [ $nbr -gt $aleatoire ] ; then
		echo "Le nombre est plus petit"
	fi
	tentatives=$(( $tentatives + 1 ))
done
echo "Bravo !! Vous avez gagné en $tentatives coups."
