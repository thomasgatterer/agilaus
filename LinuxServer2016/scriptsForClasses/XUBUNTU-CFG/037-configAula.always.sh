#!/bin/bash

case $(hostname) in
  r086pc01 )
#  r*pc01 )
    rm /opt/nwboxuser/dt-main/*
    cp -p /nwbox-nfs/files/dt-main.aula/* /opt/nwboxuser/dt-main
    cp -p /nwbox-nfs/files/dt-main.aula/* /opt/nwboxuser/Schreibtisch
    chmod 777 /opt/nwboxuser/dt-main/*
    chmod 777 /opt/nwboxuser/Schreibtisch/*
  ;;
  * )
  ;;
esac

exit 1
