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
# Install latest chrome package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update && apt-get install -y wget --no-install-recommends \
    && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst ttf-freefont \
      --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && apt-get -y remove \
    && rm -rf /src/*.deb

EXPOSE 3389
LABEL maintainer="weihanli@outlook.com"
ENTRYPOINT /etc/init.d/xrdp start && tail -F /var/log/xrdp-sesman.log
