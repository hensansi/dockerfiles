FROM debian:stable
MAINTAINER Henrique Silva

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget ca-certificates unzip make openssl build-essential \
    zlib1g-dev libpcre3 libpcre3-dev libbz2-dev libssl-dev tar &&\
    apt-get autoclean -y &&\
    apt-get autoremove -y

WORKDIR /tmp
RUN wget https://github.com/LuaJIT/LuaJIT/archive/master.zip &&\
    unzip master.zip &&\
    cd LuaJIT* &&\
    make && make install &&\
    rm -rf /tmp/*

RUN wget https://github.com/simpl/ngx_devel_kit/archive/v0.2.19.tar.gz &&\
    wget https://github.com/openresty/lua-nginx-module/archive/v0.9.16.tar.gz

RUN tar -zxf v0.9.16.tar.gz
RUN tar -zxf v0.2.19.tar.gz


RUN wget http://nginx.org/download/nginx-1.9.4.tar.gz &&\
    tar -xzvf nginx* &&\
    ls

RUN export LUAJIT_LIB=/usr/local/lib
RUN export LUAJIT_INC=/usr/local/bin/luajit-2.0.4

RUN cd ./nginx* && ./configure \
    --prefix=/usr/share/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/access.log \
    --user=www-data \
    --group=www-data \
    --without-mail_pop3_module \
    --without-mail_imap_module \
    --without-mail_smtp_module \
    --without-http_fastcgi_module \
    --without-http_uwsgi_module \
    --without-http_scgi_module \
    --without-http_memcached_module \
    --with-ipv6 \
    --with-http_ssl_module \
    --with-http_spdy_module \
    --with-http_stub_status_module \
    --with-http_gzip_static_module \
    --with-ld-opt="-Wl,-rpath,/usr/local/lib" \
    --add-module=/tmp/ngx_devel_kit-0.2.19 \
    --add-module=/tmp/lua-nginx-module-0.9.16 &&\
    make -j2 &&\
    make install

CMD ["nginx", "-g", "daemon off;"]
