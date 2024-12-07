# Use debian 12 (bookworm)
FROM debian:bookworm

SHELL ["/bin/bash", "-c"]

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get install -y locales

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8

RUN update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

RUN apt update

RUN apt install -y gawk wget git diffstat unzip texinfo gcc build-essential chrpath socat cpio python3 \
    python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 \
    python3-subunit zstd liblz4-tool file locales libacl1

RUN useradd -m -s /bin/bash -p "$5$TTsdwTS6uKW4g/0U$IOUcrYMZ95bNd9SbeQnsOM4u2i3Io/Sw/19AhsGWCw4" builder

RUN mkdir /home/builder/yocto-dir

WORKDIR /home/builder/yocto-dir

CMD ["/bin/bash"]
