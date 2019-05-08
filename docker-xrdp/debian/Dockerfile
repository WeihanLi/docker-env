FROM debian:9
ENV RDP_USER=user
ENV RDP_PWD=Password
RUN	apt-get update && \
	apt-get -y install lxde-core lxterminal xrdp iceweasel && \
	apt-get clean && \
	apt-get -y remove && \
	ln -s /usr/share/doc/xrdp/rsakeys.ini /etc/xrdp && \
	useradd -ms /bin/bash RDP_USER && \
	echo '$RDP_USER:$RDP_PWD' |chpasswd
EXPOSE 3389