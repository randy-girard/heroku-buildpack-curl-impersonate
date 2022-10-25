FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y \
    build-essential \
    pkg-config \
    cmake \
    autoconf \
    automake \
    libtool \
    ninja-build \
    python3-pip \
    libnss3 \
    golang-go \
    git \
    unzip \
    curl

RUN mkdir -p /curl-impersonate-install
RUN git clone https://github.com/lwthiker/curl-impersonate.git
RUN cd curl-impersonate && \
    mkdir build && \
    cd build && \
    ../configure --prefix /curl-impersonate-install

RUN cd curl-impersonate/build && make chrome-build
RUN cd curl-impersonate/build && make chrome-install

RUN mkdir -p /curl-impersonate/include
RUN cp -r curl-impersonate/build/curl-7.84.0/include /curl-impersonate-install/include/

RUN tar -zcvf /curl-impersonate.tar.gz --directory /curl-impersonate-install /curl-impersonate-install/*
