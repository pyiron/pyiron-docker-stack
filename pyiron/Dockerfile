ARG ROOT_CONTAINER=pyiron/md:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Marian Bruns <m.bruns@mpie.de>

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
#RUN conda install -n base -c defaults mkl=2022.0.1 && \
#    mamba env update -n base -f ${HOME}/environment.yml && \
#    conda clean --all -f -y && \
#    conda list

RUN mamba env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    conda list

USER root
RUN chmod +x ${HOME}/aggregate_and_clean.sh && \
    /bin/bash aggregate_and_clean.sh &&\
    fix-permissions $CONDA_DIR && \
    fix-permissions ${HOME}

# Switch back to user jovyan to avoid accidental container-runs as root
USER $DOCKER_UID

WORKDIR $HOME
