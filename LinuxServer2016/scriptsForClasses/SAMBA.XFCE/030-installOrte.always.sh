#! /bin/sh

# Script 030-installOrte.always.sh

mkdir -p /media/nwboxuser
chown -R nwboxuser:nwboxuser /media/nwboxuser

mkdir -p /Orte
rm /Orte/*
chown -R nwboxuser:nwboxuser /Orte

ln -s /nwbox/homes-m   "/Orte/1_Daten_Server"
# ln -s /nwbox/austausch "/Orte/2. Austauschverzeichnis"
ln -s /media/nwboxuser "/Orte/2_USB-Sticks"
ln -s /nwbox/videos    "/Orte/3_Videos_Server"
ln -s /nwbox/bilder    "/Orte/4_Bilder_Server"

case $(hostname) in
  r402* | r403* )
    ln -s /nwbox/austausch-be "/Orte/5_Austauschverzeichnis-BE"
  ;;
  r407* | r408* )
    ln -s /nwbox/austausch-edv "/Orte/5_Austauschverzeichnis-EDV"
  ;;
  * )
  ;;
esac

case $(hostname) in
  r407pc20 | r408pc20 )
    ln -s /nwbox/homeroot "/Orte/6_Schülerverzeichnisse"
  ;;
  * )
  ;;
esac

case $(hostname) in
  r009pc03 )
    ln -s /nwbox/austausch-be "/Orte/5_Austauschverzeichnis-BE"
    ln -s /nwbox/austausch-edv "/Orte/6_Austauschverzeichnis-EDV"
    ln -s /nwbox/musiksaal "/Orte/7_Musiksaal"
  ;;
  * )
  ;;
esac


exit 1

