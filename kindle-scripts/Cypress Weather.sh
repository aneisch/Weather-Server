#!/bin/sh

while :
 
	do

		killall -STOP cvm;
		killall -STOP powerd;
		cd "$(dirname "$0")"
		rm /mnt/us/weather/Cypress.png
		eips -c
		if wget http://dl.dropboxusercontent.com/u/6127829/Cypress.png -O /mnt/us/weather/Cypress.png; then
			eips -g /mnt/us/weather/Cypress.png
		else
			eips -g /mnt/us/weather/weather-image-error.png

		
		fi;
	sleep 1800
		

	done