FROM debian:stable
MAINTAINER Henrique Silva

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates unzip make openssl build-essential zlib1g-dev libssl-dev

WORKDIR /tmp
RUN wget https://github.com/cloudflare/kyotocabinet/archive/master.zip -O kc.zip &&\
    unzip /tmp/kc.zip &&\
    cd kyotocabinet-master &&\
    ./configure && make && make install

RUN wget https://github.com/cloudflare/kyototycoon/archive/master.zip -O kt.zip &&\
    unzip /tmp/kt.zip &&\
    cd kyototycoon-master &&\
    ./configure && make && make install

## Cleanup
RUN \
  apt-get autoclean -y &&\
  apt-get autoremove -y &&\
  rm -rf /tmp/*  &&\
  rm -rf /var/tmp/* &&\
  rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN echo "include /usr/local/lib" >> /etc/ld.so.conf && ldconfig
CMD ["ktserver"]
