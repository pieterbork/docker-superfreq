FROM 192.168.20.233:5000/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

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
cp examples/ieee802_15_4_oqpsk_phy.py /root/.grc_gnuradio/

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
