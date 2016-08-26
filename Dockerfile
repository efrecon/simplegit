FROM alpine
MAINTAINER efrecon@gmail.com

RUN apk --update add openssl-dev build-base linux-headers cmake git && \
    mkdir -p /tmp/src && \
    cd /tmp/src && \
    git clone https://github.com/sba1/simplegit.git && \
    cd simplegit && \
    git submodule init && \
    git submodule update libgit2 && \
    make libgit2 && \
    make && \
    cd libgit2/build && \
    make install && \
    cd ../../bin && \
    cp sgit git-init /usr/local/bin/ && \
    cd /usr/local/bin && \
    ln -sf sgit git && \
    apk del build-base linux-headers cmake git && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["ash"]
