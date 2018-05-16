#!/bin/bash

mkdir -p /opt/domoticz

while true; do
   if [ -f /stop ]; then
      exit 1
   else
      /domoticz/domoticz -dbase /opt/domoticz/domoticz.db
   fi
done
		
