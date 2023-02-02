ARG ROOT_CONTAINER=pyiron/base:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Marian Bruns <bruns@mpie.de>

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

ENV OMPI_MCA_plm=isolated
ENV OMPI_MCA_rmaps_base_oversubscribe=yes
ENV OMPI_MCA_btl_vader_single_copy_mechanism=none

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    conda list

USER root
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions ${HOME} && \
    fix-permissions $CONDA_DIR

# Switch back to pyiron to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
