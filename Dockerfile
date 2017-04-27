FROM alpine:3.5
MAINTAINER Oli Lalonde <olalonde@gmail.com>

RUN apk add --update curl && \
  rm -rf /var/cache/apk/*

RUN curl -sSL https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz | tar xz
RUN mv oauth2_proxy-2.2.0.linux-amd64.go1.8.1 oauth2_proxy
RUN mv oauth2_proxy/oauth2_proxy /usr/local/bin/oauth2_proxy
RUN rmdir oauth2_proxy
# RUN ./oauth2_proxy help

VOLUME /conf

EXPOSE 4180
ENTRYPOINT ["oauth2_proxy"]
CMD ["-config", "/conf/oauth2_proxy.cfg"]