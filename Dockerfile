FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /

RUN git clone https://github.com/bastibl/gr-foo.git -b master && \
cd gr-foo && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install && \
ldconfig

RUN git clone https://github.com/pieterbork/gr-ieee802-11.git && \
cd gr-ieee802-11 && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install && \
ldconfig

RUN git clone https://github.com/rftap/gr-rftap && \
cd gr-rftap && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install && \
ldconfig 

RUN git clone https://github.com/pieterbork/gr-ieee802-15-4.git && \
cd gr-ieee802-15-4 && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install && \
ldconfig && \
cd ../ && \
mkdir /root/.grc_gnuradio && \
cp examples/ieee802_15_4_oqpsk_phy.py /root/.grc_gnuradio/

RUN apt-get install -y vim

RUN pip install --upgrade pip && \
pip install scapy flask flask_socketio

RUN apt-get install -y python-gtk2 python-cairo python-usb python-crypto python-serial python-dev libgcrypt-dev mercurial tcpdump && \
hg clone https://bitbucket.org/secdev/scapy-com && \
cd scapy-com && \
python setup.py install 

RUN git clone https://github.com/riverloopsec/killerbee.git && \
cd killerbee && \
python setup.py install

RUN git clone https://github.com/JiaoXianjun/BTLE.git && \
cd BTLE && \
cd host && \
mkdir build && \
cd build && \
cmake .. && \
make && \
make install

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
