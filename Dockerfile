FROM frolvlad/alpine-oraclejdk8

# root filesystem
COPY rootfs /

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.15.0.0/s6-overlay-amd64.tar.gz /tmp/s6-overlay.tar.gz

# DNS resolver
ADD https://github.com/janeczku/go-dnsmasq/releases/download/0.9.8/go-dnsmasq-min_linux-amd64 /usr/sbin/go-dnsmasq
RUN tar xvfz /tmp/s6-overlay.tar.gz -C / && \
  chmod 755 /usr/sbin/go-dnsmasq && \
  rm -rf /tmp/*

##
## INIT
##

ENTRYPOINT ["/init"]
