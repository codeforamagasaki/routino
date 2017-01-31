#!/bin/sh -x

# This script can download from the GeoFabrik server.


# EDIT THIS to set the names of the files to download from GeoFabrik.
#files="europe/great-britain-latest.osm.bz2 europe/ireland-and-northern-ireland-latest.osm.bz2"
#server="download.geofabrik.de"
files="osm/extract/planet_135.316,34.675_135.487,34.788.osm.pbf"
server="download.bbbike.org"

# Download the files

for file in $files; do
   wget -N http://$server/$file
done


# Process the data

../bin/planetsplitter --errorlog *.osm.pbf

