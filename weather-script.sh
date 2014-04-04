#!/bin/sh

cd "$(dirname "$0")"


#College Station
#77840
curl --silent "http://xml.weather.yahoo.com/forecastrss?p=77840&u=f" | grep -E '(Current Conditions:|F<BR)' | sed -e 's/Current Conditions://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//' -e 's/Fair, //' -e 's/Wintry Mix, //' -e 's/Cloudy\/Windy, //' -e 's/Mostly Cloudy, //'  -e 's/Light Freezing Rain, //'  -e 's/Partly Cloudy, //' -e 's/Cloudy, //' -e 's/.$//' -e 's/.$//' -e 's/Tornado, //' -e 's/Tropical Storm, //' -e 's/Hurricane, //' -e 's/Severe Thunderstorms, //' -e 's/Thunderstorms, //' -e 's/Mixed Rain and Snow, //' -e 's/Rain and Sleet, //' -e 's/Mixed Rain and Sleet, //' -e 's/Mixed Snow and Sleet, //' -e 's/Freezing Drizzle, //' -e 's/Drizzle, //' -e 's/Rain, //' -e 's/Freezing Rain, //' -e 's/Showers, //' -e 's/Snow Flurries, //' -e 's/Light Rain, //' -e 's/Light Snow, //' -e 's/Light Snow Showers, //' -e 's/Blowing Snow, //' -e 's/Light //' -e 's/Snow, //' -e 's/Hail, //' -e 's/Sleet, //' -e 's/Dust, //' -e 's/Foggy, //' -e 's/Fog, //' -e 's/Haze, //' -e 's/Smoky, //' -e 's/Blustery, //' -e 's/Windy, //' -e 's/Cold, //' -e 's/Clear, //' -e 's/Sunny, //' -e 's/Mixed Rain and Hail, //' -e 's/Hot, //' -e 's/Isolated Thunderstorms, //' -e 's/Scattered Thunderstorms, //' -e 's/Scattered Showers, //' -e 's/Heavy Snow, //' -e 's/Scattered Snow Showers, //' -e 's/Heavy Snow, //' -e 's/Thundershowers, //' -e 's/Snow Showers, //' -e 's/Isolated Thundershowers, //' -e 's/Not Available, //' | python ~/weather_server/weather-script_College_Station.py
convert ~/weather_server/weather-script-output.svg ~/weather_server/weather-script-output-new.png 
convert ~/weather_server/weather-script-output-new.png -resize 600x800 ~/weather_server/weather-script-output-new.png
pngcrush -c 0 -nofilecheck ~/weather_server/weather-script-output-new.png weather-script-csoutput.png
mv ~/weather_server/weather-script-csoutput.png ~/weather_server/College\ Station.png
~/Dropbox-Uploader/dropbox_uploader.sh upload ~/weather_server/College\ Station.png /Public/
rm ~/weather_server/College\ Station.png
rm ~/weather_server/weather-script-output-new.png

sleep 5
#Breckenridge
#80424
curl --silent "http://xml.weather.yahoo.com/forecastrss?p=80424&u=f" | grep -E '(Current Conditions:|F<BR)' | sed -e 's/Current Conditions://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//' -e 's/Fair, //' -e 's/Wintry Mix, //' -e 's/Cloudy\/Windy, //' -e 's/Mostly Cloudy, //'  -e 's/Light Freezing Rain, //'  -e 's/Partly Cloudy, //' -e 's/Cloudy, //' -e 's/.$//' -e 's/.$//' -e 's/Tornado, //' -e 's/Tropical Storm, //' -e 's/Hurricane, //' -e 's/Severe Thunderstorms, //' -e 's/Thunderstorms, //' -e 's/Mixed Rain and Snow, //' -e 's/Rain and Sleet, //' -e 's/Mixed Rain and Sleet, //' -e 's/Mixed Snow and Sleet, //' -e 's/Freezing Drizzle, //' -e 's/Drizzle, //' -e 's/Rain, //' -e 's/Freezing Rain, //' -e 's/Showers, //' -e 's/Snow Flurries, //' -e 's/Light Rain, //' -e 's/Light Snow, //' -e 's/Light Snow Showers, //' -e 's/Blowing Snow, //' -e 's/Light //' -e 's/Snow, //' -e 's/Hail, //' -e 's/Sleet, //' -e 's/Dust, //' -e 's/Foggy, //' -e 's/Fog, //' -e 's/Haze, //' -e 's/Smoky, //' -e 's/Blustery, //' -e 's/Windy, //' -e 's/Cold, //' -e 's/Clear, //' -e 's/Sunny, //' -e 's/Mixed Rain and Hail, //' -e 's/Hot, //' -e 's/Isolated Thunderstorms, //' -e 's/Scattered Thunderstorms, //' -e 's/Scattered Showers, //' -e 's/Heavy Snow, //' -e 's/Scattered Snow Showers, //' -e 's/Heavy Snow, //' -e 's/Thundershowers, //' -e 's/Snow Showers, //' -e 's/Isolated Thundershowers, //' -e 's/Not Available, //' | python ~/weather_server/weather-script_Breck.py
convert ~/weather_server/weather-script-output.svg ~/weather_server/weather-script-output-new.png 
convert ~/weather_server/weather-script-output-new.png -resize 600x800 ~/weather_server/weather-script-output-new.png
pngcrush -c 0 -nofilecheck ~/weather_server/weather-script-output-new.png ~/weather_server/weather-script-breckoutput.png
mv ~/weather_server/weather-script-breckoutput.png ~/weather_server/Breck.png
~/Dropbox-Uploader/dropbox_uploader.sh upload ~/weather_server/Breck.png /Public/
rm ~/weather_server/Breck.png
rm ~/weather_server/weather-script-output-new.png

sleep 5
#Cypress
#77429
curl --silent "http://xml.weather.yahoo.com/forecastrss?p=77429&u=f" | grep -E '(Current Conditions:|F<BR)' | sed -e 's/Current Conditions://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//' -e 's/Fair, //' -e 's/Wintry Mix, //' -e 's/Cloudy\/Windy, //' -e 's/Mostly Cloudy, //'  -e 's/Light Freezing Rain, //'  -e 's/Partly Cloudy, //' -e 's/Cloudy, //' -e 's/.$//' -e 's/.$//' -e 's/Tornado, //' -e 's/Tropical Storm, //' -e 's/Hurricane, //' -e 's/Severe Thunderstorms, //' -e 's/Thunderstorms, //' -e 's/Mixed Rain and Snow, //' -e 's/Rain and Sleet, //' -e 's/Mixed Rain and Sleet, //' -e 's/Mixed Snow and Sleet, //' -e 's/Freezing Drizzle, //' -e 's/Drizzle, //' -e 's/Rain, //' -e 's/Freezing Rain, //' -e 's/Showers, //' -e 's/Snow Flurries, //' -e 's/Light Rain, //' -e 's/Light Snow, //' -e 's/Light Snow Showers, //' -e 's/Blowing Snow, //' -e 's/Light //' -e 's/Snow, //' -e 's/Hail, //' -e 's/Sleet, //' -e 's/Dust, //' -e 's/Foggy, //' -e 's/Fog, //' -e 's/Haze, //' -e 's/Smoky, //' -e 's/Blustery, //' -e 's/Windy, //' -e 's/Cold, //' -e 's/Clear, //' -e 's/Sunny, //' -e 's/Mixed Rain and Hail, //' -e 's/Hot, //' -e 's/Isolated Thunderstorms, //' -e 's/Scattered Thunderstorms, //' -e 's/Scattered Showers, //' -e 's/Heavy Snow, //' -e 's/Scattered Snow Showers, //' -e 's/Heavy Snow, //' -e 's/Thundershowers, //' -e 's/Snow Showers, //' -e 's/Isolated Thundershowers, //' -e 's/Not Available, //' | python ~/weather_server/weather-script_Cypress.py
convert ~/weather_server/weather-script-output.svg ~/weather_server/weather-script-output-new.png 
convert ~/weather_server/weather-script-output-new.png -resize 600x800 ~/weather_server/weather-script-output-new.png
pngcrush -c 0 -nofilecheck ~/weather_server/weather-script-output-new.png ~/weather_server/weather-script-cypoutput.png
mv ~/weather_server/weather-script-cypoutput.png ~/weather_server/Cypress.png
~/Dropbox-Uploader/dropbox_uploader.sh upload ~/weather_server/Cypress.png /Public/
rm ~/weather_server/Cypress.png
rm ~/weather_server/weather-script-output-new.png

sleep 5
#Dallas
#75063
curl --silent "http://xml.weather.yahoo.com/forecastrss?p=75063&u=f" | grep -E '(Current Conditions:|F<BR)' | sed -e 's/Current Conditions://' -e 's/<br \/>//' -e 's/<b>//' -e 's/<\/b>//' -e 's/<BR \/>//' -e 's/<description>//' -e 's/<\/description>//' -e 's/Fair, //' -e 's/Wintry Mix, //' -e 's/Cloudy\/Windy, //' -e 's/Mostly Cloudy, //'  -e 's/Light Freezing Rain, //'  -e 's/Partly Cloudy, //' -e 's/Cloudy, //' -e 's/.$//' -e 's/.$//' -e 's/Tornado, //' -e 's/Tropical Storm, //' -e 's/Hurricane, //' -e 's/Severe Thunderstorms, //' -e 's/Thunderstorms, //' -e 's/Mixed Rain and Snow, //' -e 's/Rain and Sleet, //' -e 's/Mixed Rain and Sleet, //' -e 's/Mixed Snow and Sleet, //' -e 's/Freezing Drizzle, //' -e 's/Drizzle, //' -e 's/Rain, //' -e 's/Freezing Rain, //' -e 's/Showers, //' -e 's/Snow Flurries, //' -e 's/Light Rain, //' -e 's/Light Snow, //' -e 's/Light Snow Showers, //' -e 's/Blowing Snow, //' -e 's/Light //' -e 's/Snow, //' -e 's/Hail, //' -e 's/Sleet, //' -e 's/Dust, //' -e 's/Foggy, //' -e 's/Fog, //' -e 's/Haze, //' -e 's/Smoky, //' -e 's/Blustery, //' -e 's/Windy, //' -e 's/Cold, //' -e 's/Clear, //' -e 's/Sunny, //' -e 's/Mixed Rain and Hail, //' -e 's/Hot, //' -e 's/Isolated Thunderstorms, //' -e 's/Scattered Thunderstorms, //' -e 's/Scattered Showers, //' -e 's/Heavy Snow, //' -e 's/Scattered Snow Showers, //' -e 's/Heavy Snow, //' -e 's/Thundershowers, //' -e 's/Snow Showers, //' -e 's/Isolated Thundershowers, //' -e 's/Not Available, //' | python ~/weather_server/weather-script_Dallas.py
convert ~/weather_server/weather-script-output.svg ~/weather_server/weather-script-output-new.png 
convert ~/weather_server/weather-script-output-new.png -resize 600x800 ~/weather_server/weather-script-output-new.png
pngcrush -c 0 -nofilecheck ~/weather_server/weather-script-output-new.png ~/weather_server/weather-script-Dallas.png
mv ~/weather_server/weather-script-Dallas.png ~/weather_server/Dallas.png
~/Dropbox-Uploader/dropbox_uploader.sh upload ~/weather_server/Dallas.png /Public/
rm ~/weather_server/Dallas.png
rm ~/weather_server/weather-script-output-new.png
