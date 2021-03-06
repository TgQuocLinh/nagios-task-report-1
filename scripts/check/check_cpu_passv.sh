#!/bin/bash

# check cpu script
# from webserver1

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games

CHECKSTR="$(/usr/lib/nagios/plugins/check_cpu -w 80 -c 90)"
CHECKCODE=$?
CMD="webserver1;CPU;$CHECKCODE;$CHECKSTR"
CFG="/etc/send_nsca.cfg"

echo $CMD | send_nsca -H 192.168.85.2 -d ";" -c $CFG

