FROM debian:9
ENV RDP_USER=user
ENV RDP_PWD=Password
RUN	apt-get update && ENV DEBIAN_FRONTEND=noninteractive && \
	apt-get -y --no-install-recommends install lxde-core lxterminal xrdp && \
	apt-get clean && \
	apt-get -y remove && \
	useradd -ms /bin/bash RDP_USER && \
	echo '$RDP_USER:$RDP_PWD' |chpasswd
EXPOSE 3389