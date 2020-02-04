FROM osgeo/gdal:alpine-ultrasmall-latest

RUN \
  apk update -qq && \
  apk add boost-dev g++ make cmake \
  swig python-dev python3 \
  bash

ENV HOME /root

ADD . /app/

# Binaries

RUN mkdir -p /app/build
WORKDIR /app/build
RUN cmake .. && make && make install

# Python extension

#RUN mkdir -p /app/python/build
#WORKDIR /app/python/build
#RUN cmake .. && make
#ENV PYTHONPATH /app/python/build

WORKDIR /app
