#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

dpkg -i /nwbox-nfs/files/Installationen/geogebra-classic_6.0.423.0-201801270911_amd64.deb

#repair missing file ggb-config.js
touch /usr/share/geogebra-classic/resources/app/ggb-config.js



