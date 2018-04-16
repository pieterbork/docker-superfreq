#
# SUPERFREQ docker container
# Copyright (C) 2018 Team SUPERFREQ, CU Boulder ITP <itp@colorado.edu>
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

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

## Development

Sometimes it's useful to be able to open up gnuradiocompanion, but we need a display to do that. Here's how we can pass our xserver instance through to the docker container.

First, install the **xorg-host** package.

Now, allow local connections to your Xserver.

    xhost +local:

Now run the docker container with variables passed through

    sudo docker run --name sf -it --privileged -p 80:5000 -e DISPLAY=$DISPLAY -v /dev/bus/usb:/dev/bus/usb -v /tmp/.X11-unix:/tmp/.X11-unix superfreq bash

You should now be able to `gnuradiocompanion file.grc` and get a display on your host machine!

After you're finished, cleanup by disallowing connections

    xhost - 
