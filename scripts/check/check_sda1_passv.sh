#!/bin/bash

# check disk (sda1) script
# from webserver1

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

CHECKSTR="$(/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1)"
CHECKCODE=$?
CMD="webserver1;DISK;$CHECKCODE;$CHECKSTR"
CFG="/etc/send_nsca.cfg"

echo $CMD | send_nsca -H 192.168.85.2 -d ";" -c $CFG

