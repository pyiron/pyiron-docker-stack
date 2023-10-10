ARG ROOT_CONTAINER=pyiron/md:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Marian Bruns <m.bruns@mpie.de>

USER root
COPY apt.txt /tmp/
# installing build-essential
RUN apt-get update -y && \
    xargs -a /tmp/apt.txt apt-get install -y && \
    apt-get clean && \
    rm /tmp/apt.txt && \
    sed -i '$d' /opt/conda/conda-meta/pinned

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    conda list

USER root
RUN rm ${HOME}/*.ipynb &&\
    chmod +x ${HOME}/aggregate_and_clean.sh && \
    /bin/bash ${HOME}/aggregate_and_clean.sh && \
    fix-permissions ${HOME} && \
    fix-permissions $CONDA_DIRs

# Switch back to jovyan to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
