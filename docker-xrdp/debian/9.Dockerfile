
FROM debian:9
ENV RDP_USER=user
ENV RDP_PWD=Password
ENV DEBIAN_FRONTEND=noninteractive
RUN	apt-get update && \
	apt-get -y --no-install-recommends install lxde-core lxterminal xrdp tigervnc-standalone-server && \
	apt-get clean && \
	apt-get -y remove && \
	useradd -ms /bin/bash RDP_USER && \
	echo '$RDP_USER:$RDP_PWD'|chpasswd && \
	service xrdp restart
EXPOSE 3389
ENTRYPOINT /etc/init.d/xrdp start && tail -F /var/log/xrdp-sesman.log