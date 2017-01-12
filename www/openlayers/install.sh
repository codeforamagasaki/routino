#!/bin/sh -x

version=2.13.1

# Download the file.

#wget http://openlayers.org/download/OpenLayers-$version.tar.gz
wget https://github.com/openlayers/ol2/releases/download/release-${version}/OpenLayers-${version}.tar.gz

# Uncompress it.

tar -xzf OpenLayers-$version.tar.gz

# Create a custom OpenLayers file

(cd OpenLayers-$version/build && python build.py ../../routino.cfg && cp OpenLayers.js ..)

# Copy the files.

cp -p  OpenLayers-$version/OpenLayers.js .
cp -pr OpenLayers-$version/img .
cp -pr OpenLayers-$version/theme .

# Delete the remainder

rm -rf OpenLayers-$version
