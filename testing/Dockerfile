ARG ROOT_CONTAINER=pyiron/base:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

RUN git clone https://github.com/pyiron/pyiron.git && \
    conda env update -n base -f ${HOME}/pyiron/.ci_support/environment.yml --prune && \
    conda clean --all -f -y && \
    rm -rf pyiron
    
# Switch back to pyiron to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
