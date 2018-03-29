FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /

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

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
