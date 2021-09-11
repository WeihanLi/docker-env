FROM debian:8

ENV DEBIAN_FRONTEND=noninteractive
RUN     apt-get update && \
        apt-get -y install lxde-core lxterminal xrdp iceweasel && \
        apt-get clean && \
        apt-get -y remove

ARG RDP_USER=user
ARG RDP_PWD=password

RUN useradd -ms /bin/bash ${RDP_USER} && \
        echo "${RDP_USER}:${RDP_PWD}"|chpasswd && \
        usermod -a -G sudo ${RDP_USER}

EXPOSE 3389
LABEL maintainer="weihanli@outlook.com"
ENTRYPOINT /etc/init.d/xrdp start && tail -F /var/log/xrdp-sesman.log
