FROM hackermd/ubuntu-xenial-python

USER root

COPY sudoers /etc/sudoers

WORKDIR /usr/src/app
RUN useradd -ms /bin/bash buildbot && chown -R buildbot /usr/src/app
USER buildbot

COPY requirements.txt ./
RUN sudo pip install -U pip && \
    sudo pip install --no-cache-dir -r requirements.txt && \
    sudo pip install -U pyasn1-modules

RUN buildbot create-master -r master

COPY master.cfg master/
