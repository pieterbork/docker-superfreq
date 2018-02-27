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

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
