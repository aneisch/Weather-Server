#!/bin/sh

while :
 
	do

		killall -STOP cvm;
		killall -STOP powerd;
		cd "$(dirname "$0")"
		rm /mnt/us/weather/Breck.png
		eips -c
		if wget http://dl.dropboxusercontent.com/u/6127829/Breck.png -O /mnt/us/weather/Breck.png; then
			eips -g /mnt/us/weather/Breck.png
		else
			eips -g /mnt/us/weather/weather-image-error.png
		
		
		fi;
	sleep 1800

	done