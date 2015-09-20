https://github.com/cloudflare/kyototycoon

    docker pull hensansi/kyototycoon
    docker run -d -p 1978:1978 hensansi/kyototycoon
    curl http://127.0.0.1:1978/rpc/echo?ping=pong
