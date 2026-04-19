#!/bin/bash

# Closebox73
# This script is to get weather data from openweathermap.com in the form of a json file
# so that conky will still display the weather when offline even though it doesn't up to date

# you can use this or replace with yours
api_key=65e65a09b8cb2e20b00c1369add43f6e

# get your city id at https://openweathermap.org/find and replace
city_id=1185241

url="api.openweathermap.org/data/2.5/weather?id=${city_id}&appid=${api_key}&cnt=5&units=metric&lang=en"
curl ${url} -s -o ~/.cache/weather.json

exit
