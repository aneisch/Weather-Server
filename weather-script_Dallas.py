#!/usr/bin/python2

# Kindle Weather Display
# Matthew Petroff (http://www.mpetroff.net/)
# September 2012

import urllib2
from xml.dom import minidom
import datetime
import codecs

import sys

#Acquire output from shell for current weather
for line in sys.stdin:
    current = line

#
# Download and parse weather data
#

# Fetch data (change lat and lon to desired location)
weather_xml = urllib2.urlopen('http://graphical.weather.gov/xml/SOAP_server/ndfdSOAPclientByDay.php?whichClient=NDFDgenByDay&lat=32.91&lon=-97.03&format=24+hourly&numDays=4&Unit=e').read()
dom = minidom.parseString(weather_xml)

# Parse temperatures
xml_temperatures = dom.getElementsByTagName('temperature')
highs = [None]*4
lows = [None]*4
for item in xml_temperatures:
    if item.getAttribute('type') == 'maximum':
        values = item.getElementsByTagName('value')
        for i in range(len(values)):
            highs[i] = int(values[i].firstChild.nodeValue)
    if item.getAttribute('type') == 'minimum':
        values = item.getElementsByTagName('value')
        for i in range(len(values)):
            lows[i] = int(values[i].firstChild.nodeValue)

# Parse icons
xml_icons = dom.getElementsByTagName('icon-link')
icons = [None]*4
for i in range(len(xml_icons)):
    try:
	icons[i] = xml_icons[i].firstChild.nodeValue.split('/')[-1].split('.')[0].rstrip('0123456789')
	#Parse Percentages 
        percent[i] = xml_icons[i].firstChild.nodeValue.split('/')[-1].split('.')[0].strip('bkn').strip('blizzard').strip('cold').strip('du').strip('few').strip('fg').strip('fu').strip('fzra').strip('hi_shwrs').strip('hot').strip('ip').strip('mix').strip('ovc').strip('ra').strip('raip').strip('rasn').strip('sct').strip('sctfg').strip('scttsra').strip('shra').strip('skc').strip('sn').strip('tsra').strip('wind')
    except AttributeError:
	icons = [u'no', u'no', u'no', u'no']

# Parse dates
xml_day_one = dom.getElementsByTagName('start-valid-time')[0].firstChild.nodeValue[0:10]
day_one = datetime.datetime.strptime(xml_day_one, '%Y-%m-%d')



#
# Preprocess SVG
#

# Open SVG to process
output = codecs.open('weather-script-preprocess.svg', 'r', encoding='utf-8').read()
now = datetime.datetime.now()
dtyear=str(now.year)
dtmonth=str(now.month)
dtday=str(now.day)
dthour=str(((now.hour + 11) % 12) + 1)

#fix for minute less than 10
if now.minute < 10:
    dtmin = "0" + str(now.minute)
if now.minute >= 10:
    dtmin = str(now.minute)

#AM or PM
if now.hour >= 12:
    suffix = " PM"
if now.hour < 12:
    suffix = " AM"

dtnow=str(dtmonth+'/'+dtday+'/'+dtyear+' '+dthour+':'+dtmin+suffix + ' via Pi')



# Insert icons and temperatures
output = output.replace('ICON_ONE',icons[0]).replace('ICON_TWO',icons[1]).replace('ICON_THREE',icons[2]).replace('ICON_FOUR',icons[3])
output = output.replace('HIGH_ONE',str(highs[0])).replace('HIGH_TWO',str(highs[1])).replace('HIGH_THREE',str(highs[2])).replace('HIGH_FOUR',str(highs[3]))
output = output.replace('LOW_ONE',str(lows[0])).replace('LOW_TWO',str(lows[1])).replace('LOW_THREE',str(lows[2])).replace('LOW_FOUR',str(lows[3]))
output = output.replace('DATE_VALPLACE',str(dtnow))
output = output.replace('CURRENT',str(current))



#insert percentages
output = output.replace('PERCENT_ONE',str(percent[0])).replace('PERCENT_TWO',str(percent[1])).replace('PERCENT_THREE',str(percent[2])).replace('PERCENT_FOUR',str(percent[3]))



# Insert days of week
one_day = datetime.timedelta(days=1)
days_of_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
output = output.replace('DAY_ONE',days_of_week[(day_one + 0*one_day).weekday()]).replace('DAY_TWO',days_of_week[(day_one + 1*one_day).weekday()]).replace('DAY_THREE',days_of_week[(day_one + 2*one_day).weekday()]).replace('DAY_FOUR',days_of_week[(day_one + 3*one_day).weekday()])

#original --> output = output.replace('DAY_THREE',days_of_week[(day_one + 2*one_day).weekday()]).replace('DAY_FOUR',days_of_week[(day_one + 3*one_day).weekday()])

# Write output
codecs.open('weather-script-output.svg', 'w', encoding='utf-8').write(output)
