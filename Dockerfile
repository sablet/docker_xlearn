FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/NewYork
ENV USER=test

RUN apt-get update && apt-get install -y tzdata apt-utils
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        gcc \
        clang \
        binutils \
        cmake \
        python3-dev \
        python3-numpy \
        python3-pandas \
        python3-setuptools \
        python3-wheel \
        python3-pip \
        python3-scipy && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install xlearn

## xlearn demo test
RUN git clone https://github.com/aksnzhy/xlearn
