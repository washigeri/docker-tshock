FROM ubuntu:xenial

MAINTAINER Mark <willietgwb@gmail.com>

COPY start.sh /start
# Add and install mono
ENV TSHOCK_VERSION=4.3.25

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/ubuntu stable-xenial main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update
RUN apt-get install -y zip mono-complete wget
RUN apt-get clean

RUN mkdir /world /config /logs /plugins /tshock && \
        cd /tshock && \
        wget https://github.com/NyxStudios/TShock/releases/download/v$TSHOCK_VERSION/tshock_$TSHOCK_VERSION.zip && \
        unzip tshock_$TSHOCK_VERSION.zip && \
        rm tshock_$TSHOCK_VERSION.zip && \
        chmod +x /tshock/TerrariaServer.exe && \
        chmod +x /start

# External data
VOLUME ["/world", "/config", "/logs", "/plugins"]

# Back to the working directory for the server
WORKDIR /tshock

EXPOSE 7777

ENTRYPOINT ["/start"]
