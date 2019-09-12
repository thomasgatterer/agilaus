#!/bin/sh

# Skript 020-nwbox-mount.always.sh
# mkdir in Script 010...sh

mkdir -p /nwbox
mkdir -p /nwbox/Faecher
mkdir -p /nwbox/apps-wine
# mkdir -p /nwbox/austausch
mkdir -p /nwbox/bilder
mkdir -p /nwbox/bilder-neu
mkdir -p /nwbox/fueralle
mkdir -p /nwbox/homes-m
mkdir -p /nwbox/homeroot
mkdir -p /nwbox/linuxapps
mkdir -p /nwbox/manuals
mkdir -p /nwbox/manuals-lehrer
mkdir -p /nwbox/public
mkdir -p /nwbox/vcds
mkdir -p /nwbox/vcd2
mkdir -p /nwbox/vcd3
mkdir -p /nwbox/videos
mkdir -p /nwbox/videos-neu
# Ergänzung nt 2017-04-21
mkdir -p /nwbox/austausch-edv
mkdir -p /nwbox/austausch-be
# Ende Ergänzung nt 2017-04-21
# Ergänzung nt 2018-05-09
mkdir -p /nwbox/jahresbericht
# Ende Ergänzung nt 2018-05-09
# Ergänzung nt 2019-01-29
mkdir -p /nwbox/musiksaal
# Ende Ergänzung nt 2019-01-29

chmod -R 777 /nwbox

OPTIONS='credentials=/root/credentials.nwbox,nobrl,port=139,netbiosname='$(hostname)
mount.cifs //smb01/Faecher   /nwbox/Faecher   -o $OPTIONS,ro
mount.cifs //smb01/apps-wine /nwbox/apps-wine -o $OPTIONS,ro
# mount.cifs //smb01/austausch /nwbox/austausch -o $OPTIONS,rw
mount.cifs //smb01/bilder    /nwbox/bilder    -o $OPTIONS,ro
mount.cifs //smb01/fueralle  /nwbox/fueralle  -o $OPTIONS,ro
mount.cifs //smb01/linuxapps /nwbox/linuxapps -o $OPTIONS,ro
mount.cifs //smb01/manuals   /nwbox/manuals   -o $OPTIONS,ro
mount.cifs //smb01/public    /nwbox/public    -o $OPTIONS,ro
mount.cifs //smb01/vcds      /nwbox/vcds      -o $OPTIONS,ro
mount.cifs //smb01/vcd2      /nwbox/vcd2      -o $OPTIONS,ro
mount.cifs //smb01/vcd3      /nwbox/vcd3      -o $OPTIONS,ro
mount.cifs //smb01/videos    /nwbox/videos    -o $OPTIONS,ro

# mount homes-m
case $(hostname) in
  r407* )
    mount.cifs //smb01/homes-m-r407     /nwbox/homes-m -o $OPTIONS,rw
    mount.cifs //smb01/austausch-edv    /nwbox/austausch-edv -o $OPTIONS,rw
    ;;
  r408* )
    mount.cifs //smb01/homes-m-r408     /nwbox/homes-m -o $OPTIONS,rw
    mount.cifs //smb01/austausch-edv    /nwbox/austausch-edv -o $OPTIONS,rw
    ;;
  * )
    mount.cifs //smb01/homes-m          /nwbox/homes-m   -o $OPTIONS,rw
    ;;
esac

# mount homeroot in EDV1, EDV2
case $(hostname) in
  r407pc20 )
    mount.cifs //smb01/homeroot-r407     /nwbox/homeroot -o $OPTIONS,rw
    ;;
  r408pc20 )
    mount.cifs //smb01/homeroot-r408     /nwbox/homeroot -o $OPTIONS,rw
    ;;
  * )
    ;;
esac

# mount homes be nt 2017-04-21
case $(hostname) in
  r402* | r403* )
    mount.cifs //smb01/austausch-be /nwbox/austausch-be -o $OPTIONS,rw
  ;;
  * )
  ;;
esac

# mount zusätzliche Orte in sbib03, ergänzt um musiksaal 2019-01-29 NT
case $(hostname) in
  r009pc03 )
    mount.cifs //smb01/austausch-be /nwbox/austausch-be -o $OPTIONS,rw
    mount.cifs //smb01/austausch-edv /nwbox/austausch-edv -o $OPTIONS,rw
    mount.cifs //smb01/homes-m-musik /nwbox/musiksaal -o $OPTIONS,rw
  ;;
  * )
  ;;
esac


exit 1
