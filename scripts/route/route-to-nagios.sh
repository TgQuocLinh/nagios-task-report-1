#!/bin/bash

# set it excutable  
# type: ln -s /path/to/sript /etc/rc.d to run it at startup

route add -net 192.168.85.0/24 gw 192.168.10.100 dev ens38
