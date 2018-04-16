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

FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /root

RUN pip install --upgrade pip && \
    pip install scapy flask flask_socketio pdfkit

RUN apt-get install wget xvfb wkhtmltopdf -y

#RUN wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz &&\ 
#    tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz &&\
#    cp wkhtmltox/bin/wk* /usr/local/bin &&\
#    rm -rf wkhtml*

CMD ["/bin/bash"]
