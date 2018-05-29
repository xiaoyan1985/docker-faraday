FROM kalilinux/kali-linux-docker:latest

RUN apt-get update && apt-get install -y git python-qt4-dev libqt4-qt3support 

# RUN wget https://bootstrap.pypa.io/get-pip.py 
# RUN python get-pip.py 
# RUN pip install requests 

# RUN git clone https://github.com/benoitc/restkit.git restkit
# WORKDIR restkit
# RUN python setup.py install 
# RUN pip install restkit 
    
RUN mkdir /home/git/
WORKDIR /home/git
RUN git clone https://github.com/xiaoyan1985/faraday-5.git faraday
WORKDIR faraday
RUN apt-get -y install python-pip
RUN pip install restkit
RUN apt -y install gir1.2-vte-2.91

RUN ./install.sh
RUN python2 faraday-server.py
CMD /home/git/faraday/faraday.py
