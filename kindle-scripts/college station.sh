#!/bin/sh
usbnetwork
while :
 
	do

		killall -STOP cvm;
		killall -STOP powerd;
		cd "$(dirname "$0")"
		rm /mnt/us/weather/College.png
		rm /mnt/us/weather/cs-radar.png
		eips -c
		if wget http://aneis.ch/kindle-scripts/college%20station.sh -O /mnt/us/kite/onboot/college\ station.sh.new; then
			rm /mnt/us/kite/onboot/college\ station.sh
			mv /mnt/us/kite/onboot/college\ station.sh.new /mnt/us/kite/onboot/college\ station.sh
		else
			sleep 1
		fi;
		if wget http://aws.aneis.ch/weather/college-station.png -O /mnt/us/weather/College.png; then
			sleep 5
			wget http://aws.aneis.ch/weather/college-station-radar.png -O /mnt/us/weather/cs-radar.png
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 25
			rm /mnt/us/weather/College.png
			rm /mnt/us/weather/cs-radar.png
			wget http://aws.aneis.ch/weather/college-station.png -O /mnt/us/weather/College.png
			wget http://aws.aneis.ch/weather/college-station-radar.png -O /mnt/us/weather/cs-radar.png
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/cs-radar.png
			sleep 30
			eips -c
			eips -g /mnt/us/weather/College.png		
		else
			eips -g /mnt/us/weather/weather-image-error.png
			sleep 30
		fi;
	done
