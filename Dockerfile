FROM pieterbork/gnuradio

ENV PYTHONPATH /usr/local/lib/python2.7/site-packages/
ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /root

RUN pip install --upgrade pip && \
    pip install scapy flask flask_socketio pdfkit

RUN apt-get install wget

RUN wget -q https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz &&\ 
    tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz &&\
    cp wkhtmltox/bin/wk* /usr/local/bin &&\
    rm -rf wkhtml*

CMD ["/bin/bash"]
