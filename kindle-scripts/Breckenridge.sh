#!/bin/sh
killall -STOP cvm;
/usr/sbin/usbnetwork
/etc/init.d/framework stop
/etc/init.d/powerd stop
killall -STOP powerd;
cd "$(dirname "$0")"
if wget http://aws.aneis.ch/kindle-scripts/breckenridge.sh -O /mnt/us/weather/breckenridge.sh.new; then
	rm /mnt/us/weather/breckenridge.sh
	mv /mnt/us/weather/breckenridge.sh.new /mnt/us/weather/breckenridge.sh
else
	sleep 1
fi;
rm /mnt/us/weather/snow-report.png
rm /mnt/us/weather/Breck.png
rm /mnt/us/weather/snow.png
eips -c
if wget http://aws.aneis.ch/weather/breckenridge.png -O /mnt/us/weather/Breck.png; then
	wget http://aws.aneis.ch/weather/snow.png -O /mnt/us/weather/snow.png
	wget http://aws.aneis.ch/weather/snow-report.png -O /mnt/us/weather/snow-report.png
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png


	
else
	eips -g /mnt/us/weather/weather-image-error.png
	sleep 30
	wget http://aws.aneis.ch/weather/breckenridge.png -O /mnt/us/weather/Breck.png
	wget http://aws.aneis.ch/weather/snow.png -O /mnt/us/weather/snow.png
	wget http://aws.aneis.ch/weather/snow-report.png -O /mnt/us/weather/snow-report.png
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
	sleep 15
	eips -g /mnt/us/weather/Breck.png
	sleep 15
	eips -g /mnt/us/weather/snow-report.png
fi;
