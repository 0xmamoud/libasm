FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    nasm \
    binutils \
    make \
    gdb \
    valgrind \
    vim \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /libasm
CMD ["/bin/bash"]
