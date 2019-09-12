#! /bin/bash

exit 1

export DEBIAN_FRONTEND=noninteractive

cp -u /nwbox-nfs/files/nwboxuser/.PlayOnLinux/wineprefix/Office2010/user.reg /opt/mso/.PlayOnLinux/wineprefix/Office2010

exit 1






if [ ! -e /opt/mso/.PlayOnLinux/wineprefix/Office2010/user.reg ]
then
  exit 1
fi

sed -i '/StandardPlaces/a "Show"=dword:00000000' /opt/mso/.PlayOnLinux/wineprefix/Office2010/user.reg

exit 1

