#!/bin/sh
usbnetwork
killall -STOP cvm;
/etc/init.d/framework stop
/etc/init.d/powerd stop
killall -STOP powerd;
cd "$(dirname "$0")"
rm /mnt/us/weather/Breck.png
rm rm /mnt/us/weather/snow.png
eips -c
if wget http://aws.aneis.ch/weather/breckenridge.png -O /mnt/us/weather/Breck.png; then
	wget http://aws.aneis.ch/weather/snow.png -O /mnt/us/weather/snow.png
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
else
	eips -g /mnt/us/weather/weather-image-error.png
	sleep 10
	wget http://aws.aneis.ch/weather/breckenridge.png -O /mnt/us/weather/Breck.png
	wget http://aws.aneis.ch/weather/snow.png -O /mnt/us/weather/snow.png
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
	eips -g /mnt/us/weather/snow.png
	sleep 30
	eips -g /mnt/us/weather/Breck.png
	sleep 30
fi;
