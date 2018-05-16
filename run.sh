#!/bin/bash

while true; do
   if [ -f /stop ]; then
      exit 1
   else
      /domoticz/domoticz
   fi
done
		
