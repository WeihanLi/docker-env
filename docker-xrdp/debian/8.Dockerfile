FROM debian:8
ENV RDP_USER=user
ENV RDP_PWD=password
# RUN echo $RDP_USER && echo "$RDP_USER:$RDP_PWD"
RUN useradd -ms /bin/bash ${RDP_USER} && \
        echo "${RDP_USER}:${RDP_PWD}"|chpasswd
ENV DEBIAN_FRONTEND=noninteractive
RUN     apt-get update && \
        apt-get -y install lxde-core lxterminal xrdp && \
        apt-get clean && \
        apt-get -y remove
EXPOSE 3389
LABEL maintainer="weihanli@outlook.com"
ENTRYPOINT /etc/init.d/xrdp start && tail -F /var/log/xrdp-sesman.log