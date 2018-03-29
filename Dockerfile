FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /

RUN pip install --upgrade pip && \
    pip install scapy flask flask_socketio

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
