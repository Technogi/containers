FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install \
    gpg-agent \
    dirmngr \
    software-properties-common \
    gettext-base \
    curl \
    python-dev \
    apt-transport-https \
    ca-certificates \
    git \
    -y --no-install-recommends
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 \
    && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update \
    && apt-get install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    -y --no-install-recommends 
RUN curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli \
    && pip install awsebcli --upgrade
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 \
    && apt-get update \
    && apt-get install \
    openjdk-8-jdk \ 
    bc \
    sbt \
    -y --no-install-recommends 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install nodejs -y --no-install-recommends 
RUN npm install -g yarn
RUN apt-get clean && rm -rf /var/lib/apt/lists/*