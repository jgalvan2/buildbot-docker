FROM hackermd/ubuntu-xenial-python

USER root

COPY sudoers /etc/sudoers

RUN apt-get update && \
    apt-get install -y netcat

WORKDIR /usr/src/app
RUN useradd -ms /bin/bash buildbot && chown -R buildbot /usr/src/app
USER buildbot

COPY requirements.txt ./
RUN sudo pip install -U pip && \
    sudo pip install --no-cache-dir -r requirements.txt && \
    sudo pip install -U pyasn1-modules

RUN buildbot-worker create-worker worker buildbot-master example-worker pass

COPY wait-for-container-port.sh .
