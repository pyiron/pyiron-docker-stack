ARG ROOT_IMAGE=jupyter/base-notebook:ubuntu-22.04@sha256:0ec801994602a53d3917d0f07ccf4474a1ddf5ae419483b24681a3c42abc4ce5 AS root_image
FROM $ROOT_IMAGE

MAINTAINER Jan Janssen <janssen@mpie.de>, Marian Bruns <m.bruns@mpie.de>

ARG DOCKER_UID="1000"
ARG DOCKER_GID="100"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    DOCKER_UID=$DOCKER_UID \
    DOCKER_GID=$DOCKER_GID \
    HOME=/home/$NB_USER \
    OMPI_MCA_plm=isolated \
    OMPI_MCA_rmaps_base_oversubscribe=yes \
    OMPI_MCA_btl_vader_single_copy_mechanism=none

# apt installation as root
USER root

# copy list of apt packages to be installed  
COPY apt.txt /tmp/

# install the packages and clean up
RUN apt-get update -y &&\
    xargs -a /tmp/apt.txt apt-get install -y &&\
    apt-get clean &&\
    rm /tmp/apt_global.txt /tmp/apt_local.txt /tmp/apt.txt 

# install conda packages as $DOCKER_USER
USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    mamba clean --all -f -y && \
    mamba list

# Fix permissions on /etc/jupyter as root
USER root
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /etc/jupyter/ &&\
    fix-permissions ${HOME} && \
    fix-permissions $CONDA_DIR

# switch back to DOCKER_USER
USER $DOCKER_UID
WORKDIR $HOME
