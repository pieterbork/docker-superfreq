# SUPERFREQ docker container

## Building 

    sudo docker build -t superfreq:latest .

## Running
    
Currently, Carlos sucks and cannot seem to write code that doesn't use X server - which means that we need to pass our X socket through to the docker container

First, we need to allow X server connections on our host machine, so install **xorg-xhost** and run this:

    xhost +local:

Now run the docker container, check /tmp for out_frames.csv

    sudo docker rm sf && sudo docker run --name sf -it --privileged -e DISPLAY=$DISPLAY -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix superfreq bash

After you're finished, revert your X server permissions

    xhost -
