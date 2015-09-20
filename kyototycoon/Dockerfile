FROM debian:stable
MAINTAINER Henrique Silva

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates unzip make openssl build-essential zlib1g-dev libssl-dev

WORKDIR /tmp
RUN wget https://github.com/cloudflare/kyotocabinet/archive/master.zip -O kyotocabinet.zip \
    && unzip /tmp/kyotocabinet.zip

WORKDIR  /tmp/kyotocabinet-master/
RUN ./configure && make && make install

WORKDIR /tmp
RUN wget https://github.com/cloudflare/kyototycoon/archive/master.zip -O kyototycoon.zip \
    && unzip /tmp/kyototycoon.zip
WORKDIR  /tmp/kyototycoon-master/
RUN ./configure && make && make install

RUN echo "include /usr/local/lib" >> /etc/ld.so.conf && ldconfig
CMD ["ktserver"]
