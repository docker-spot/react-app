FROM ubuntu:22.04

LABEL maintainer="Devansh Bawari"

ARG NODE_VERSION=16
ARG UID=1000
ARG USER=devansh0207
ARG USER_DIR=/home/$USER
ARG WORK_DIR=$USER_DIR/workspace

RUN apt-get update \
    && apt-get install -y curl git \
    && curl -sLS https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

RUN useradd -G www-data,root -u $UID -d $USER_DIR $USER
RUN mkdir -p $WORK_DIR && \
    chown -R $USER:$USER $USER_DIR

USER $USER
WORKDIR $WORK_DIR
