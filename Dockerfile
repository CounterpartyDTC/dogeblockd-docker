FROM ubuntu:14.04
MAINTAINER Lars Kluge <l@larskluge.com>

RUN apt-get update
RUN dpkg-reconfigure locales && locale-gen en_US.UTF-8 && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get -y install git-core python3 vim sudo

RUN adduser --disabled-password --home /dogeblock --gecos "" dogeblock
RUN echo "dogeblock ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER dogeblock
ENV HOME /dogeblock

WORKDIR /dogeblock
RUN git clone https://github.com/CounterpartyXCP/counterpartyd_build
RUN mkdir data

WORKDIR /dogeblock/counterpartyd_build
RUN git clone https://github.com/Dogeparty/dogeblockd.git dist/counterblockd
# RUN git checkout develop
RUN yes | sudo python3 setup.py --with-counterblockd

WORKDIR /dogeblock

VOLUME /dogeblock/data

EXPOSE 4100 4101 4102



# vim: syn=ruby

