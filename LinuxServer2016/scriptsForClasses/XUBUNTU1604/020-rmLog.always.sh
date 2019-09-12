#!/bin/bash

chmod -R 777 /var/log

exit 1

rm /var/log/laus/*
systemctl reboot

exit 1

