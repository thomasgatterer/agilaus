#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# installiert QTractor (Music-Sequencer), 2019-02-16 NT

wget -q https://launchpad.net/~kxstudio-debian/+archive/kxstudio/+files/kxstudio-repos_9.2.2~kxstudio1_all.deb
dpkg -i kxstudio-repos_9.2.2~kxstudio1_all.deb
apt-get -y update
apt-get -y install qtractor