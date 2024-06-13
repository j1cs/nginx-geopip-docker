#!/bin/sh

# Define the base URL
BASE_URL="https://sources.archlinux.org/other/packages/geoip-database/"

# Fetch the directory listing, find the latest date using awk
LATEST_DATE=$(curl -s ${BASE_URL} | awk -F '[<>]' '/href="[0-9]{8}\/"/ {print $3}' | sort | tail -n 1 | tr -d '/')

# Define the URLs for the GeoIP files
GEOIP_CITY_URL="${BASE_URL}${LATEST_DATE}/GeoIPCity.dat.gz"
GEOIP_URL="${BASE_URL}${LATEST_DATE}/GeoIP.dat.gz"

# Download the files
mkdir -p /usr/share/GeoIP
cd /usr/share/GeoIP
curl -O -J ${GEOIP_CITY_URL}
curl -O -J ${GEOIP_URL}
gzip -d *.gz
