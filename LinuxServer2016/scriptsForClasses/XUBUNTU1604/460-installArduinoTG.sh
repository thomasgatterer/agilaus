#!/bin/bash


# get file
# Extrakt File 
# with
# FILENAME
# to 
# DESTINATION_PATH

# Source Laus-Settings
. /etc/default/laus-setup

SOURCE_PATH=./lfsdir

DESTINATION_PATH=/opt

# filename has to be:
# x86_64 <=> 64 bit: arduino-1.6.1-x86_64.tar.xz
# i686   <=> 32 bit: arduino-1.6.1-i686.tar.xz
NAME=arduino-1.8.5

ARCHITECTURE=$(uname -m)

FILESUFFIX=tar.xz

FILENAME=$NAME-$ARCHITECTURE.$FILESUFFIX

# check, if Programm already exists from previous installation
if [ -d $DESTINATION_PATH/arduino ];
then
	exit
fi

cp $SOURCE_PATH/$FILENAME $DESTINATION_PATH

cd $DESTINATION_PATH

tar -xf $FILENAME

rm $FILENAME

chown -R root:root $NAME

ln -s $NAME arduino

# for writing to arduino board user has to be in group dialout
usermod -aG dialout nwboxuser



