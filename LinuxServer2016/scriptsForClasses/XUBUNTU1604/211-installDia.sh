#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

add-apt-repository -y ppa:js-reynaud/kicad-4
apt-get update
apt-get -y install kicad

apt-get -y install dia