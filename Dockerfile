FROM kalilinux/kali-linux-docker:latest

RUN apt-get update && apt-get install -y git python-qt4-dev libqt4-qt3support \
 && apt-get -y install python-pip \
 && apt-get -y install python-psycopg2 \
 && pip install psycopg2 \
 && pip install restkit \
 && pip install lxml \
 && pip install beautifulsoup4 \
 && apt -y install gir1.2-vte-2.91 \ 
 && mkdir /home/git/ \
 && apt-get install -y couchdb

WORKDIR /home/git
RUN git clone https://github.com/xiaoyan1985/faraday2.git faraday
WORKDIR faraday

RUN chmod a+x -R /home/git/faraday 
RUN mount --bind /etc/fstab/ /home/git/faraday 
RUN ./install.sh 

CMD /home/git/faraday/faraday.py --gui=no-gui 
