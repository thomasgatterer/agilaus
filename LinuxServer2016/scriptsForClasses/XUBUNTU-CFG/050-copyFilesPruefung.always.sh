#!/bin/sh

exit 1 # deaktivieren, wenn Prüfungs-PCs erwünscht (eintragen in case)

# ergänzt von NT, 2017-11-29
# Mini-Prüfungsumgebung (funktioniert in XFCE)
# deaktiviert alle Desktop-Icons und die Icons in der Statusleiste
# deaktiviert die Rechtschreib- und Grammatikprüfung in LibreOffice-Writer
# Usage:
# 1. hostname(s) unten eintragen
# 2. PCs, die für Prüfung bestimmt sind, herunterfahren
# 3. Prüfungs-PCs starten -> kontrollieren, ob Icons unsichtbar sind und Wallpaper mit Blauverlauf
# 4. USB-Stick mit vorbereitetem, leeren ODF-Dokument anstecken
# 5. Im Datei-Dialogfenster ODF-Dokument doppelklicken -> Start von LibreOffice-Writer, Datei-Dialog nicht schließen!
# 6. Speichern mit CTRL-S direkt auf USB-Stick
# 7. Am Ende LibreOffice-Writer beenden und USB-Stick auswerfen
# 8. PC herunterfahren und # bei exit 1 (1. Zeile) setzen
# 9. Beim erneuten Hochfahren des PCs wird die normale Desktop-Umgebung geladen

# bei hostname den PC eintragen, mehrere getrennt mit | <PIPE>
case $(hostname) in
  r307pc01 )
    rm -r /opt/nwboxuser/dt-main/*
    rm -r /opt/nwboxuser/Schreibtisch/*
    cp -p /nwbox-nfs/files/dt-pruefung/* /opt/nwboxuser/dt-main
    cp -p /nwbox-nfs/files/dt-pruefung/* /opt/nwboxuser/Schreibtisch
    chmod 777 /opt/nwboxuser/dt-main/*
    chmod 777 /opt/nwboxuser/Schreibtisch/*
    chmod -R 777 /opt/nwboxuser/.config/xfce4/*
    chmod -R 777 /opt/nwboxuser/.config/libreoffice/4/user/*
    cp -p /nwbox-nfs/files/dt-pruefung-backup/icons.screen0.rc /opt/nwboxuser/.config/xfce4/desktop
    cp -p /nwbox-nfs/files/dt-pruefung-backup/xfce4-panel.xml /opt/nwboxuser/.config/xfce4/xfconf/xfce-perchannel-xml
    cp -p /nwbox-nfs/files/dt-pruefung-backup/registrymodifications.xcu /opt/nwboxuser/.config/libreoffice/4/user
    cp -p /nwbox-nfs/files/wp1_pruefung.jpg /usr/share/wallpapers/wp1.jpg
  ;;
  * )
  ;;
esac

exit 1