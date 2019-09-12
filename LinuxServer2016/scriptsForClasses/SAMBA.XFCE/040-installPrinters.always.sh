#!/bin/bash

timeout1=0
while lpstat -r | grep -q "not running" > /dev/null
do
   sleep 1
   timeout1=$(($timeout1+1))
   if [ $timeout1 -ge 60 ]
   then
      echo "no cups" > /var/log/cupsrunning.txt
      exit 1
   fi
done

### alle Drucker entfernen
# /usr/sbin/lpadmin -x LJ4000
# /usr/sbin/lpadmin -x HL5350
# /usr/sbin/lpadmin -x LJ4000-EDV1
# /usr/sbin/lpadmin -x HL5350
 /usr/sbin/lpadmin -x BR8250
# /usr/sbin/lpadmin -x LJ2200
 /usr/sbin/lpadmin -x Bibliothek
 /usr/sbin/lpadmin -x BR8250be
 /usr/sbin/lpadmin -x KYOCERA
 /usr/sbin/lpadmin -x KYOCERA-PH

# Drucker installieren
# sleep 5
# echo $(date) > /var/log/server-drucker.txt

case $(hostname) in
  r007* )
#    /usr/sbin/lpadmin -p LokalerDrucker -v parallel:/dev/lp0 -P /nwbox/public/ppd/hl1250.ppd -E
    /usr/sbin/lpadmin -p LokalerDrucker -v usb://Brother/HL-1450%20series?serial=E2J770263 -P /nwbox/public/ppd/hl1250.ppd -E
    /usr/sbin/lpadmin -p Bibliothek -v socket://bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
    # /usr/sbin/lpadmin -p Bibliothek -v smb://nwboxuser:123@smb01/bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
    /usr/sbin/lpadmin -d LokalerDrucker
  ;;
  r009pc03 )
    /usr/sbin/lpadmin -p Bibliothek -v socket://bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
    # /usr/sbin/lpadmin -p Bibliothek -v smb://nwboxuser:123@smb01/bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
    /usr/sbin/lpadmin -d Bibliothek
  ;;
esac

#######################################################################################
# Feriensperre 2017-05-24 NT (aufheben: nachfolgende Zeile - exit 1 - auskommentieren)
# exit 1 # Feriensperre
#######################################################################################

#######################################################################################
# Einbinden von Druckern während der Unterrichtszeit

case $(hostname) in
  r402pc01 )
    /usr/sbin/lpadmin -p befarbe -v smb://nwboxuser:123@smb01/befarbe -P /nwbox/public/ppd/befarbe.ppd -E
    /usr/sbin/lpadmin -d befarbe
  ;;
#  r407*)
#    /usr/sbin/lpadmin -p LJ4000 -v smb://nwboxuser:123@smb01/LJ4000-EDV1 -P /nwbox/public/ppd/lj4000.ppd -E
#    /usr/sbin/lpadmin -d LJ4000
#  ;;
#  r407* | r408* )
#    /usr/sbin/lpadmin -p HL5350 -v smb://nwboxuser:123@smb01/hl5350dn -P /nwbox/public/ppd/hl5350dn.ppd -E
#    /usr/sbin/lpadmin -d HL5350
#  ;;
  r110* | r102pc01 | r208pc01 |r210* | r310* )
#    /usr/sbin/lpadmin -p HL5350 -v smb://nwboxuser:123@smb01/HL5350 -P /nwbox/public/ppd/hl5350.ppd -E
#    /usr/sbin/lpadmin -p KonfZimmer -v smb://nwboxuser:123@smb01/br8250 -P /nwbox/public/ppd/Brother8250.ppd -E
#    /usr/sbin/lpadmin -p BR8250 -v smb://nwboxuser:123@smb01/BR8250 -P /nwbox/public/ppd/bibfarbe.ppd -E
#     /usr/sbin/lpadmin -p BR8250 -v socket://BR8250 -P /nwbox/public/ppd/bibfarbe.ppd -E
     /usr/sbin/lpadmin -p KYOCERA -v smb://nwboxuser:123@smb01/KYOCERA -P /nwbox/public/ppd/kyocera.ppd -E
#    /usr/sbin/lpadmin -p BR8250 -v socket://br8250 -P /nwbox/public/ppd/br8250.ppd -E
#    /usr/sbin/lpadmin -p LJ2200 -v smb://nwboxuser:123@smb01/LJ2200 -P /nwbox/public/ppd/lj2200d.ppd -E
#    /usr/sbin/lpadmin -p Bibliothek -v smb://nwboxuser:123@smb01/bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
#    /usr/sbin/lpadmin -d HL5350
#    /usr/sbin/lpadmin -d LJ2200
#    /usr/sbin/lpadmin -d BR8250
    /usr/sbin/lpadmin -d KYOCERA
  ;;
#  r124* )
#    /usr/sbin/lpadmin -p KYOCERA-PH -v smb://nwboxuser:123@smb01/KYOCERA-PH -P /nwbox/public/ppd/kyocera.ppd -E
#    /usr/sbin/lpadmin -d KYOCERA-PH
#   
#  ;;
#  r009pc02 | r009pc04 | r009pc05 )
#    /usr/sbin/lpadmin -p Bibliothek -v smb://nwboxuser:123@smb01/bibfarbe -P /nwbox/public/ppd/bibfarbe.ppd -E
#    /usr/sbin/lpadmin -d Bibliothek
#  ;;

esac

exit 1
