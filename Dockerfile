FROM ubuntu:14.04

RUN apt-get update && \
  apt-get install -qq -y curl

ADD elasticsearch-optimize-index.sh /elasticsearch-optimize-index.sh
ADD elasticsearch-remove-old-indices.sh elasticsearch-remove-old-indices.sh

RUN chmod 755 /*.sh
