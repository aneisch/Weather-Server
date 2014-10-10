#!/usr/bin/python2

# Kindle Weather Display
# Matthew Petroff (http://www.mpetroff.net/)
# September 2012

import urllib2
from xml.dom import minidom
import datetime
import codecs
import sys
from os.path import expanduser
home = expanduser("~")

#Acquire output from shell for current weather
for line in sys.stdin:
    current = line


#
# Download and parse weather data
#

# Fetch data (change lat and lon to desired location)
weather_xml = urllib2.urlopen('http://graphical.weather.gov/xml/SOAP_server/ndfdSOAPclientByDay.php?whichClient=NDFDgenByDay&lat=39.48&lon=-106.15&format=24+hourly&numDays=4&Unit=e').read()
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
percent = [None]*4
for i in range(len(xml_icons)):
    try:
	icons[i] = xml_icons[i].firstChild.nodeValue.split('/')[-1].split('.')[0].rstrip('0123456789')
	#Parse Percentages 
        percent[i] = xml_icons[i].firstChild.nodeValue.split('/')[-1].split('.')[0].strip('bkn').strip('blizzard').strip('cold').strip('du').strip('few').strip('fg').strip('fu').strip('fzra').strip('hi_shwrs').strip('hot').strip('ip').strip('mix').strip('ovc').strip('ra').strip('raip').strip('rasn').strip('sct').strip('sctfg').strip('scttsra').strip('shra').strip('skc').strip('sn').strip('tsra').strip('wind')
    except AttributeError:
	icons = [u'no', u'no', u'no', u'no']

#Insert %
for n,i in enumerate(percent):
    if i!='':
	percent[n]+='% Chance'

# Parse dates
xml_day_one = dom.getElementsByTagName('start-valid-time')[0].firstChild.nodeValue[0:10]
day_one = datetime.datetime.strptime(xml_day_one, '%Y-%m-%d')



#
# Preprocess SVG
#

# Open SVG to process
output = codecs.open(home+'/weather_server/weather-script-breck-preprocess.svg', 'r', encoding='utf-8').read()

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

dtnow=str(dtmonth+'/'+dtday+'/'+dtyear+' '+dthour+':'+dtmin+suffix + ' via AWS')


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


#################################################
#################################################


from BeautifulSoup import BeautifulSoup 
import urllib2

#A hacky way to avoid errors in case the day isn't posted on the page. Will store a bad value for
#the prediction if the day is not seen. Not a problem for my use as I will only ask for available days
monday = 1
mondayn = 1
tuesday = 1
tuesdayn = 1
wednesday = 1
wednesdayn = 1
thursday = 1
thursdayn = 1
friday = 1
fridayn = 1
saturday = 1
saturdayn = 1
sunday = 1
sundayn = 1

counter = 0
values = {}

html = urllib2.urlopen('http://opensnow.com/location/breckenridge').read()
soup = BeautifulSoup(html) 
a = soup.findAll('div', attrs={'class':'powdercast'})

b = str(a)

c = b.split("\n")
d = ""

for line in c:
    if "dow" in line or "val" in line:
        d += line + "\n"
        
e = d.split("\n")

for line in e:
    counter += 1
    if "Monday" in line:
        monday = counter
    elif "Mon<br />Night" in line:
        mondayn = counter
    elif "Tuesday" in line:
        tuesday = counter
    elif "Tue<br />Night" in line:
        tuesdayn = counter
    elif "Wednesday" in line:
        wednesday = counter
    elif "Wed<br />Night" in line:
        wednesdayn = counter
    elif "Thursday" in line:
        thursday = counter
    elif "Thu<br />Night" in line:
        thursdayn = counter
    elif "Friday" in line:
        friday = counter
    elif "Fri<br />Night" in line:
        fridayn = counter
    elif "Saturday" in line:
        saturday = counter
    elif "Sat<br />Night" in line:
        saturdayn = counter
    elif "Sunday" in line:
        sunday = counter
    elif "Sun<br />Night" in line:
        sundayn = counter
        
    if counter %2 == 0:
        values[counter] = line.strip("<div class=\"val\">").strip("&quot;</div>")

mondayval = values[monday+1]
mondaynval = values[mondayn+1]
tuesdayval = values[tuesday+1]
tuesdaynval = values[tuesdayn+1]
wednesdayval = values[wednesday+1]
wednesdaynval = values[wednesdayn+1]
thursdayval = values[thursday+1]
thursdaynval = values[thursdayn+1]
fridayval = values[friday+1]
fridaynval = values[fridayn+1]
saturdayval = values[saturday+1]
saturdaynval = values[saturdayn+1]
sundayval = values[sunday+1]
sundaynval = values[sundayn+1]


if (days_of_week[(day_one + 0*one_day).weekday()]) == 'Monday':
    snow_one = mondayval
    snow_one_night = mondaynval
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Tuesday':
    snow_one = tuesdayval
    snow_one_night = tuesdaynval
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Wednesday':
    snow_one = wednesdayval
    snow_one_night = wednesdaynval   
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Thursday':
    snow_one = thursdayval
    snow_one_night = thursdaynval
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Friday':
    snow_one = fridayval
    snow_one_night = fridaynval
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Saturday':
    snow_one = saturdayval
    snow_one_night = saturdaynval
elif (days_of_week[(day_one + 0*one_day).weekday()]) == 'Sunday':
    snow_one = sundayval
    snow_one_night = sundaynval

if (days_of_week[(day_one + 1*one_day).weekday()]) == 'Monday':
    snow_two = mondayval
    snow_two_night = mondaynval
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Tuesday':
    snow_two = tuesdayval
    snow_two_night = tuesdaynval
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Wednesday':
    snow_two = wednesdayval
    snow_two_night = wednesdaynval   
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Thursday':
    snow_two = thursdayval
    snow_two_night = thursdaynval
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Friday':
    snow_two = fridayval
    snow_two_night = fridaynval
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Saturday':
    snow_two = saturdayval
    snow_two_night = saturdaynval
elif (days_of_week[(day_one + 1*one_day).weekday()]) == 'Sunday':
    snow_two = sundayval
    snow_two_night = sundaynval

if (days_of_week[(day_one + 2*one_day).weekday()]) == 'Monday':
    snow_three = mondayval
    snow_three_night = mondaynval
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Tuesday':
    snow_three = tuesdayval
    snow_three_night = tuesdaynval
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Wednesday':
    snow_three = wednesdayval
    snow_three_night = wednesdaynval   
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Thursday':
    snow_three = thursdayval
    snow_three_night = thursdaynval
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Friday':
    snow_three = fridayval
    snow_three_night = fridaynval
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Saturday':
    snow_three = saturdayval
    snow_three_night = saturdaynval
elif (days_of_week[(day_one + 2*one_day).weekday()]) == 'Sunday':
    snow_three = sundayval
    snow_three_night = sundaynval

if (days_of_week[(day_one + 3*one_day).weekday()]) == 'Monday':
    snow_four = mondayval
    snow_four_night = mondaynval
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Tuesday':
    snow_four = tuesdayval
    snow_four_night = tuesdaynval
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Wednesday':
    snow_four = wednesdayval
    snow_four_night = wednesdaynval   
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Thursday':
    snow_four = thursdayval
    snow_four_night = thursdaynval
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Friday':
    snow_four = fridayval
    snow_four_night = fridaynval
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Saturday':
    snow_four = saturdayval
    snow_four_night = saturdaynval
elif (days_of_week[(day_one + 3*one_day).weekday()]) == 'Sunday':
    snow_four = sundayval
    snow_four_night = sundaynval

output = output.replace('SNOW_ONE',snow_one).replace('SNOW_NIGHT_ONE',snow_one_night).replace('SNOW_TWO',snow_two).replace('SNOW_NIGHT_TWO',snow_two_night).replace('SNOW_THREE',snow_three).replace('SNOW_NIGHT_THREE',snow_three_night).replace('SNOW_FOUR',snow_four).replace('SNOW_NIGHT_FOUR',snow_four_night)


#############################
#############################


# Write output
codecs.open(home+'/weather_server/weather-script-output.svg', 'w', encoding='utf-8').write(output)
