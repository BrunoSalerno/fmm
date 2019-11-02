FROM osgeo/gdal:alpine-ultrasmall-latest

RUN \
  apk update -qq && \
  apk add boost-dev g++ make cmake

ENV HOME /root

ADD . /app/

RUN mkdir -p /app/build
WORKDIR /app/build

RUN cmake .. && make && make install
