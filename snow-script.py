#!/usr/bin/python2

# Kindle Snow Report
# November 2014

import datetime
import socket
import codecs
from os.path import expanduser
home = expanduser("~")
hostname = (socket.gethostname())
from BeautifulSoup import BeautifulSoup 
import urllib2
import sys

#current breck temperature
for line in sys.stdin:
    current = line
breck_current = current + "F"
    
# Open SVG to process
output = codecs.open(home+'/weather_server/snow-script-preprocess.svg', 'r', encoding='utf-8').read()


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

dtnow=str(dtmonth+'/'+dtday+'/'+dtyear+' '+dthour+':'+dtmin+suffix + ' via ' + hostname)


#Get opensnow values
def get_values(url):
    
    
    snow_toggle = False
    base_toggle = False
    lifts_toggle = False
    trails_toggle = False
    conditions_toggle = False
    acres_toggle = False
    previous = ''
    result_snow = "n/a"
    result_base = "n/a"
    result_conditions = "n/a"
    result_long = ""
    result_lifts = "n/a"
    result_trails = "n/a"
    result_acres = "n/a"
    report_status = ''
    
    html = urllib2.urlopen(url).read()
    soup = BeautifulSoup(html)
    
    try:
        initial = str(soup.findAll('div', attrs={'class':'col-sm-6'}))
    except:
        pass
    processed = initial.split("\n")
    for line in processed:
        if snow_toggle == True and "New Snow" in previous:
            if "error" in line:
                result_snow = ""
                snow_toggle = False
                report_status = "No Report"
            else:
                result_snow = line.strip("<div class=\"snow-report-value\">").strip("&rdquo;</div>") + "\""
                snow_toggle = False
        if base_toggle == True and "Base Depth" in previous:
            if "error" in line:
                result_base = ""
                base_toggle = False
            else:
                result_base = line.strip("<div class=\"snow-report-value\">").strip("&rdquo;</div>") + "\""
                base_toggle = False
        if conditions_toggle == True and "Conditions" in previous:
            if "error" in line:
                result_conditions = ""
                conditions_toggle = False
            else:
                result_conditions = line.replace("<div class=\"snow-report-value\">","").replace("&rdquo;</div>","").replace("</div>","")
                conditions_toggle = False
        if lifts_toggle == True and "Lifts" in previous:
            if "error" in line:
                result_lifts = ""
                lifts_toggle = False
            else:
                result_lifts = line.strip("<div class=\"snow-report-value\">").strip("&rdquo;</div>")
                lifts_toggle = False
        if trails_toggle == True and "Trails Open" in previous:
            if "error" in line:
                result_trails = ""
                trails_toggle = False
            else:
                result_trails = line.strip("<div class=\"snow-report-value\">").strip("&rdquo;</div>")
                trails_toggle = False
        if acres_toggle == True and "Acres Open" in previous:
            if "error" in line:
                result_acres = ""
                acres_toggle = False
            else:
                result_acres = line.strip("<div class=\"snow-report-value\">").strip("&rdquo;</div>")
                acres_toggle = False
            
        if "New Snow" in line:
            previous = line
            snow_toggle = True
        if "Base Depth" in line:
            previous = line
            base_toggle = True
        if "Conditions" in line:
            previous = line
            conditions_toggle = True
        if "Lifts Open" in line:
            previous = line
            lifts_toggle = True
        if "Trails Open" in line:
            previous = line
            trails_toggle = True
        if "Acres Open" in line:
            previous = line
            acres_toggle = True
    
    if len(result_conditions) > 6:
        result_long = result_conditions
        result_conditions = ''
    return result_snow, result_base, result_conditions, result_long, result_lifts, result_trails, result_acres, report_status




breck_snow, breck_base, breck_conditions, breck_long, breck_lifts, breck_trails, breck_acres, report_status = get_values('http://opensnow.com/location/breckenridge')
keystone_snow, keystone_base, keystone_conditions, keystone_long, keystone_lifts, keystone_trails, keystone_acres, report_status = get_values('http://opensnow.com/location/keystone')
abasin_snow, abasin_base, abasin_conditions, abasin_long, abasin_lifts, abasin_trails, abasin_acres, report_status = get_values('http://opensnow.com/location/arapahoebasin')


#print keystone_snow
#print keystone_base
#print keystone_conditions
#print keystone_lifts
#print keystone_trails
#print keystone_acres
#print keystone_current
#print
#print breck_snow
#print breck_base
#print breck_conditions
#print breck_lifts
#print breck_trails
#print breck_acres
#print breck_current
#print
#print abasin_snow
#print abasin_base
#print abasin_conditions
#print abasin_lifts
#print abasin_trails
#print abasin_acres
#print abasin_current


#Fill in SVG Values
output = output.replace('DATE_VALPLACE',str(dtnow))
output = output.replace('breck_snow',breck_snow).replace('report_status',report_status).replace('breck_current',breck_current).replace('breck_base',breck_base).replace('breck_conditions',breck_conditions).replace('breck_acres',breck_acres).replace('breck_trails',breck_trails).replace('breck_lifts',breck_lifts)
output = output.replace('keystone_snow',keystone_snow).replace('keystone_base',keystone_base).replace('keystone_conditions',keystone_conditions).replace('keystone_acres',keystone_acres).replace('keystone_trails',keystone_trails).replace('keystone_lifts',keystone_lifts)
output = output.replace('abasin_snow',abasin_snow).replace('abasin_base',abasin_base).replace('abasin_conditions',abasin_conditions).replace('abasin_acres',abasin_acres).replace('abasin_trails',abasin_trails).replace('abasin_lifts',abasin_lifts)
output = output.replace('breck_long', breck_long).replace('keystone_long', keystone_long).replace('abasin_long', abasin_long)

# Write output
codecs.open(home+'/weather_server/snow-script-output.svg', 'w', encoding='utf-8').write(output)