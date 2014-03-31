#!/bin/sh

while :
 
	do

		killall -STOP cvm;
		killall -STOP powerd;
		cd "$(dirname "$0")"
		rm /mnt/us/weather/College.png
		eips -c
		if wget http://dl.dropboxusercontent.com/u/6127829/College%20Station.png -O /mnt/us/weather/College.png; then
			eips -g /mnt/us/weather/College.png
		else
			eips -g /mnt/us/weather/weather-image-error.png
		
		
		fi;
	sleep 1800

	done