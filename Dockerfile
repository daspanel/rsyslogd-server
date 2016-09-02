FROM daspanel/alpine-base:latest
MAINTAINER Abner G Jacobsen - http://daspanel.com <admin@daspanel.com>

RUN set -x \

    # Install rsyslog
    && apk add --no-cache rsyslog rsyslog-tls \

    # Create dirs for rsyslog
    && mkdir -p /var/spool/rsyslog \

    # Install the necessary security certificates
    && mkdir -p /etc/rsyslog.d/keys/ca.d \
    # && wget https://logdog.loggly.com/media/logs-01.loggly.com_sha12.crt --no-check-certificate -O /etc/rsyslog.d/keys/ca.d/loggly.crt \
    
    # Clean up
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

# Inject files in container file system
COPY rootfs /

# Expose ports for the service
EXPOSE 514/udp

