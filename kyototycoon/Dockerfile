FROM debian:testing
MAINTAINER Henrique Silva

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates unzip make openssl build-essential libssl-dev &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y &&\

WORKDIR /tmp
RUN wget https://github.com/jtkukunas/zlib/archive/master.zip -O zlib.zip &&\
    unzip /tmp/zlib.zip &&\
    cd zlib* &&\
    ./configure && make && make install &&\
    rm -rf /tmp/*

WORKDIR /tmp
RUN wget https://github.com/cloudflare/kyotocabinet/archive/master.zip -O kc.zip &&\
    unzip /tmp/kc.zip &&\
    cd kyotocabinet-master &&\
    ./configure && make && make install &&\
    rm -rf /tmp/*
RUN wget https://github.com/cloudflare/kyototycoon/archive/master.zip -O kt.zip &&\
    unzip /tmp/kt.zip &&\
    cd kyototycoon-master &&\
    ./configure && make && make install

WORKDIR /
RUN echo "include /usr/local/lib" >> /etc/ld.so.conf && ldconfig
CMD ["ktserver"]
