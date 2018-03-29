# SUPERFREQ docker container

## Building 

    sudo docker build -t superfreq:latest .

## Running
    
Run the docker container

    sudo docker run --name sf -it --privileged -p 80:5000 -v /dev/bus/usb:/dev/bus/usb superfreq bash

If it already exists, remove it and run again.

    sudo docker rm sf

Now you're ready to collect some data!

Right now Wifi, Zigbee, and bluetooth scanning are implemented with various libraries.

There is an example app in SUPERFREQ/src/hackrf/SDR_Testing/

Just run `python app.py` and visit `127.0.0.1` in your browser.
