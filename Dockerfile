FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /root

RUN pip install --upgrade pip && \
    pip install scapy flask flask_socketio

RUN echo 'alias sfterm="python /root/SUPERFREQ/src/infrastructure/terminal.py"' >> ~/.bashrc

RUN git clone https://github.com/pieterbork/SUPERFREQ.git

CMD ["/bin/bash"]
