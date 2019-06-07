#!/bin/bash

##the clear way:
while read -r LINE; do
	echo $LINE | cut -d ":" -f1 -z
	echo -n ", " 
	echo $LINE | cut -d ":" -f3 -z
	echo -n ", "
	echo $LINE | cut -d ":" -f6 
done < /etc/passwd

##the simple way:
#while read -r LINE; do
#      	echo $LINE | cut -d ":" -f1,3,6
#done < /etc/passwd
