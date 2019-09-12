#!/bin/bash

# skype-Installation in EDV-Sälen, 2017-04-24 NT
# wenn Skype-Installation nicht gewünscht, folgende Zeile einkommentieren
# exit 0

export DEBIAN_FRONTEND=noninteractive

case $(hostname) in
    r407* | r408* )
        add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
        apt-get -y update
        apt-get -y install skype
    ;;
    * )
    ;;
esac

exit 0
