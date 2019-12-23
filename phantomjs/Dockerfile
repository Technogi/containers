FROM node:10-jessie-slim AS base
RUN echo "deb http://httpredir.debian.org/debian jessie main contrib" > /etc/apt/sources.list \
  && echo "deb http://security.debian.org/ jessie/updates main contrib" >> /etc/apt/sources.list \
  && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  bash \
  ca-certificates \
  curl \
  python \
  python3-pip \
  python3-setuptools \
  rsync \
  openssh-server \
  git \
  fontconfig \
  build-essential \
  chrpath \
  libssl-dev \
  libxft-dev \
  libfreetype6 \
  libfreetype6-dev \
  libfontconfig1 \
  libfontconfig1-dev \
  ttf-mscorefonts-installer \
  google-chrome-unstable \
  gconf-service \
  libasound2 \
  libatk1.0-0 \
  libc6 \
  libcairo2 \
  libcups2 \
  libdbus-1-3 \
  libexpat1 \
  libfontconfig1 \
  libgcc1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  fonts-liberation \
  libappindicator1 \
  libnss3 \
  lsb-release \
  xdg-utils
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# ---- Phantom ----
FROM base AS phantom
RUN curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -o phantomjs-2.1.1-linux-x86_64.tar.gz \
  && tar -xvf phantomjs-2.1.1-linux-x86_64.tar.gz -C /usr/local/share \
  && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin \   
  && phantomjs --version \
  && apt-get autoremove -y \
  ca-certificates \
  curl \
  python \
  python3-pip \
  python3-setuptools \
  rsync \
  openssh-server \
  git \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PHANTOM_PATH=/usr/local/bin/phantomjs
CMD [ "bash" ]