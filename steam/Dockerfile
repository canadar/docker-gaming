FROM ubuntu:xenial

USER root

ARG GOSU_VERSION=1.10
ENV DEBIAN_FRONTEND=noninteractive

#Install tools and dependencies, set up gosu
RUN apt-get update && \
apt-get install -y --no-install-recommends \
curl \
wget \
ca-certificates \
lib32gcc1 \
libstdc++6 \
&& dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
&& chmod +x /usr/local/bin/gosu \
&& gosu nobody true \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
/var/tmp/* \
/tmp/*

#Add steam user and group
RUN groupadd \
--system \
--gid 1000 \
steam && \
useradd \
--create-home \
--home /steam \
--uid 1000 \
--gid 1000 \
--groups steam\
--shell /bin/false \
steam

#Install SteamCmd


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

#Default command
CMD ["/bin/bash"]