FROM golang

ARG KERNEL_REPO=git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
ARG KERNEL_REF=master
RUN date
RUN apt-get update && \
    apt-get install -y build-essential git cmake \
                       zlib1g-dev libevent-dev \
                       libelf-dev llvm \
                       clang libc6-dev-i386

RUN mkdir /src && \
    git init && \
    ls
WORKDIR /src

# Link asm/byteorder.h into eBPF
RUN ln -s /usr/include/x86_64-linux-gnu/asm/ /usr/include/asm

# Build libbpf as a static lib
RUN git clone https://github.com/libbpf/libbpf-bootstrap.git && \
    cd libbpf-bootstrap && \
    git submodule update --init --recursive

RUN cd libbpf-bootstrap/libbpf/src && \
    make BUILD_STATIC_ONLY=y CONFIG_IKHEADERS=m&& \
    make install BUILD_STATIC_ONLY=y CONFIG_IKHEADERS=m LIBDIR=/usr/lib/x86_64-linux-gnu/

RUN cd libbpf-bootstrap/bpftool/src && \
    make && \
    cp bpftool /bin/bpftool 

RUN mkdir /root/.ssh/ && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

ADD id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa
RUN git clone git@github.com:Stingless/stingless.git && \
    cd stingless && \
    make cli
RUN apt-get update -y && \
    apt-get install -y python3  python3-bpfcc python3-pip binutils libelf1 kmod  
CMD ["cat"]
