#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Opera-Browser, NT 2018-02-05

add-apt-repository "deb http://deb.opera.com/opera stable non-free"
wget -O - http://deb.opera.com/archive.key | sudo apt-key add -
apt-get -y update
apt-get -y install opera-stable

