#!/bin/bash

# ergänzt von NT 2017-10-25 -> pc01 in allen Räumen erhalten Win7-Zugang
# auch eintragen in hosttoclasses!

case $(hostname) in
  r*pc01 )
    rm /opt/nwboxuser/dt-main/*
    cp -p /nwbox-nfs/files/dt-main.pc01/* /opt/nwboxuser/dt-main
    cp -p /nwbox-nfs/files/dt-main.pc01/* /opt/nwboxuser/Schreibtisch
    chmod 777 /opt/nwboxuser/dt-main/*
    chmod 777 /opt/nwboxuser/Schreibtisch/*
  ;;
  * )
  ;;
esac

exit 1
