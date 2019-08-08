#!/bin/bash

if [ -f /etc/cups/client.conf ]
then
	initctl stop cups
	mv /etc/cups/client.conf /etc/cups/client.conf.tocups01
	initctl start cups
fi

. /etc/default/laus-setup

apt-get update

apt-get install libjpeg62

SOURCE_PATH=$MOUNT_PATH_ON_CLIENT/xBigFiles

#dpkg -i $SOURCE_PATH/g148bde_lindeb64_0207.deb
dpkg -i $SOURCE_PATH/o157cde_linux_CQueDEB_v209_64.deb

# Find Printer with:
# lpinfo --make-and-model 'Lexmark' -m

# -E		Enables the destination and accepts jobs
# -p		Specifies a PostScript Printer Description file to use with the printer.
# -v		device-uri
# -m		Sets a standard System V interface script or PPD file for the printer from the model directory or using one of the driver interfaces
# -L		Provides a textual location of the destination.

#	Note the two -E options. The first one (before -p) forces encryption when connecting to the server. The last one enables the destination and starts accepting jobs.
#
# Install Printer Canon-03
lpadmin -E -p Printer-Matura -v socket://rcanon03 -m 'lsb/usr/cel/cel-iradvc7260-pcl-de.ppd.gz' -L "Printer-Matura" -E
#
# Install Printer Canon-02
lpadmin -E -p Printer-Matura-Reserve -v socket://rcanon02 -m 'lsb/usr/cel/cel-iradvc7260-pcl-de.ppd.gz' -L "Printer-Matura-Reserve" -E
#
# set Standard to Color for both
lpoptions -p Printer-Matura -o ColourModel=Colour
lpoptions -p Printer-Matura-Reserve -o ColourModel=Colour

lpadmin -d Printer-Matura

initctl stop cups
initctl start cups
