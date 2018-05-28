FROM kalilinux/kali-linux-docker:latest

RUN apt-get update && apt-get install -y git python-qt4-dev libqt4-qt3support 
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install requests && \
    git clone https://github.com/benoitc/restkit.git && \
    cd restkit && \
    pip install -r requirements.txt && \
    python setup.py install && \
    pip install restkit && \
    
RUN mkdir /home/git/
WORKDIR /home/git
RUN git clone https://github.com/infobyte/faraday.git faraday
WORKDIR faraday

RUN ./install.sh
RUN python faraday-server.py
CMD /home/git/faraday/faraday.py
