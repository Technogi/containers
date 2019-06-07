FROM node:10-jessie-slim AS base
RUN apt-get update && apt-get install -y \
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
  build-essential chrpath libssl-dev libxft-dev \
  && apt-get install -y libfreetype6 libfreetype6-dev \
  && apt-get install -y libfontconfig1 libfontconfig1-dev
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