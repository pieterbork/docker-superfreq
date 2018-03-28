# SUPERFREQ docker container

## Building 

    sudo docker build -t superfreq:latest .

## Running
    
Currently, Carlos sucks and cannot seem to write code that doesn't use X server - which means that we need to pass our X socket through to the docker container

First, we need to allow X server connections on our host machine, so install **xorg-xhost** and run this:

    xhost +local:

Now run the docker container

    sudo docker run --name sf -it --privileged -p 80:5000 -e DISPLAY=$DISPLAY -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix superfreq bash

If it already exists, remove it and run again.

    sudo docker rm sf

Now you're ready to collect some data!

Right now Wifi, Zigbee, and bluetooth scanning are implemented with various libraries.

Wifi scanning can be attempted with 
    
    Carlos, what have you done?
    python SUPERFREQ/src/hackrf/SDR_Testing/wifi_rx_rftap_nox.py

Results will be in `/tmp/out_frames`

Zigbee scanning with

    Shame, Carlos, shame.
    python SUPERFREQ/src/hackrf/SDR_Testing/SUPERFREQ/zigbee_rftap_nox.py

Results will be in `/tmp/??`

Bluetooth scanning with

    timeout 10 btle_rx -o > bluetooth_out.txt

Results will be in `bluetooth_out.txt`

After you're finished, revert your X server permissions

    xhost -
