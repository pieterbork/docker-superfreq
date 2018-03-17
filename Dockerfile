FROM gnuradio:latest

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
mkdir /root/.grc_gnuradio && \
cp examples/ieee802_15_4_oqpsk_phy.py /root/.grc_gnuradio/

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

RUN pip install --upgrade pip && \
pip install scapy

RUN apt-get install mercurial && \
hg clone https://bitbucket.org/secdev/scapy-com && \
cd scapy-com && \
python setup.py install 

RUN git clone https://github.com/riverloopsec/killerbee.git && \
cd killerbee && \
python setup.py install

CMD ["/bin/bash"]
