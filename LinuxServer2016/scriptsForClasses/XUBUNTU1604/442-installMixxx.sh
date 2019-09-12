#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

############################### NT 2019-01-21 #############
## Mixxx-DJ-Software

add-apt-repository -y ppa:mixxx/mixxx
apt -y update
apt-get -y install mixxx

## Ende

