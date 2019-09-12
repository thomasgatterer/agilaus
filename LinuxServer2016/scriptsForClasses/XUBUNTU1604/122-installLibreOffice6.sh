#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

## LibreOffice full Package 6.0 - 2019-02-08, NT

# altes LibreOffice löschen

apt-get -y remove --purge libreoffice-core

rm -y /usr/share/applications/libreoffice-startcenter.desktop

# neues LibreOffice 6 installieren

dpkg -i /nwbox-nfs/files/Installationen/LibreOffice_6.2.0.3_Linux_x86-64_deb/DEBS/*.deb
dpkg -i /nwbox-nfs/files/Installationen/LibreOffice_6.2.0.3_Linux_x86-64_deb_langpack_de/DEBS/*.deb




