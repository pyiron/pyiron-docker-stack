ARG ROOT_CONTAINER=jupyter/base-notebook:ubuntu-22.04@sha256:b0dd163091ed964d349193a08d2c68fad964c680b57ead288afd3bca132417f0
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Marian Bruns <m.bruns@mpie.de>

USER root

ARG DOCKER_UID="1000"
ARG DOCKER_GID="100"

# set environment variables
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    DOCKER_UID=$DOCKER_UID \
    DOCKER_GID=$DOCKER_GID \
    HOME=/home/$NB_USER

# install some packages via apt
COPY apt.txt /tmp/
RUN apt-get update -y && \
    xargs -a /tmp/apt.txt apt-get install -y && \
    apt-get clean && \
    rm /tmp/apt.txt

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    conda list

# Fix permissions on /etc/jupyter as root
USER root
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /etc/jupyter/ &&\
    fix-permissions ${HOME} && \
    fix-permissions $CONDA_DIR

USER $DOCKER_UID

WORKDIR $HOME
