FROM ubuntu:20.04

RUN apt-get update -y && \
    apt-get install -y libboost-filesystem-dev libboost-program-options-dev \
    libboost-thread-dev libdb5.3++-dev libdb++-dev libdb5.3-dev libdb-dev \
    libssl-dev xxd

WORKDIR /var/local/smly
COPY smileycoind entrypoint.sh ./

EXPOSE 9332
CMD ./entrypoint.sh
