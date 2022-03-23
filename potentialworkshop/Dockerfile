ARG ROOT_CONTAINER=pyiron/pyiron:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    conda list

USER root
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions $CONDA_DIR && \
    fix-permissions ${HOME}

# Switch back to pyiron to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
