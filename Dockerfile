FROM debian:stretch-slim

LABEL maintainer="Christoph Pilka <c.pilka@asconix.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV GITIT_VERSION   0.12.1.1+dfsg-6+b3
ENV GITIT_WORKDIR   /data

RUN set -x \
        && apt-get update \
        && apt-get install --no-install-recommends --no-install-suggests -y gitit=$GITIT_VERSION

VOLUME ["/data"]

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

WORKDIR "/data"

EXPOSE 5001

STOPSIGNAL SIGTERM

CMD ["gitit", "-f", "/data/gitit.conf"]
