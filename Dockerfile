FROM debian:latest
LABEL maintainer="Ka (k@ka.st)"
LABEL version="1.1"
LABEL version_description="Updated from Jessie to latest (...always latest)"


RUN echo Updating sources and installing needed stuff
RUN apt-get update && \
    apt-get install cmake make libudev-dev \
    libssl-dev git libcurl4-openssl-dev \
    libusb-dev python3-dev zlib1g-dev git-core \
    build-essential python-dev autotools-dev \
    libicu-dev libbz2-dev libboost-all-dev -y

RUN echo Building and installing OpenZWave
RUN git clone https://github.com/OpenZWave/open-zwave \
    open-zwave-read-only && cd open-zwave-read-only && \
    git pull && make && make install

RUN echo  Building Domoticz
RUN git clone https://github.com/domoticz/domoticz.git && \
    cd domoticz && git pull && \
    cmake -DCMAKE_BUILD_TYPE=Release CMakeLists.txt && \
    make -j 3

COPY run.sh /run.sh

EXPOSE 8080
EXPOSE 80
EXPOSE 443
EXPOSE 8443

ENTRYPOINT ["/run.sh"]
