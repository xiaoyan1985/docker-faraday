FROM kalilinux/kali-linux-docker:latest
USER faraday

RUN apt-get update && apt-get install -y git python-qt4-dev libqt4-qt3support 

# ARG GECKODRIVER_VERSION=0.19.1
# RUN wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz \
  #&& rm -rf /opt/geckodriver \
  #&& tar -C /opt -zxf /tmp/geckodriver.tar.gz \
  #&& rm /tmp/geckodriver.tar.gz \
  #&& mv /opt/geckodriver /opt/geckodriver-$GECKODRIVER_VERSION \
  #&& chmod 755 /opt/geckodriver-$GECKODRIVER_VERSION \
  #&& ln -fs /opt/geckodriver-$GECKODRIVER_VERSION /usr/bin/geckodriver
  
#RUN apt-get install -y  xvfb 
   
RUN mkdir /home/git/
WORKDIR /home/git
RUN git clone https://github.com/xiaoyan1985/faraday2.git faraday
WORKDIR faraday

RUN apt-get -y install python-pip \
 && apt-get -y install python-psycopg2 \
 && pip install psycopg2 \
 && pip install restkit \
 && pip install lxml \
 && pip install beautifulsoup4 \
 && apt -y install gir1.2-vte-2.91 

RUN ./install.sh 
python2 ./faraday.py 
RUN python2 faraday-server.py 
 
CMD /home/git/faraday/faraday.py --debug --gui=no
