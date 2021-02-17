ARG ROOT_CONTAINER=jupyter/base-notebook:016833b15ceb
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER root

#removing the default user and the corresponding home directory.
RUN rm -r /home/$NB_USER
RUN userdel $NB_USER 
    
ARG DOCKER_USER="pyiron"
ARG DOCKER_UID="1000"
ARG DOCKER_GID="100"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    DOCKER_USER=$DOCKER_USER \
    DOCKER_UID=$DOCKER_UID \
    DOCKER_GID=$DOCKER_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/$DOCKER_USER

COPY apt.txt /tmp/
# creating account for pyiron_user.
RUN useradd -m -s /bin/bash -N -u $DOCKER_UID $DOCKER_USER && \
    chown $DOCKER_USER:$NB_GID $CONDA_DIR && \
    chmod g+w /etc/passwd && \
    apt-get update -y && \
    xargs -a /tmp/apt.txt apt-get install -y && \
    apt-get clean && \
    rm /tmp/apt.txt

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN conda env update -n base -f ${HOME}/environment.yml --prune && \
    conda clean --all -f -y && \
    conda list

# Fix permissions on /etc/jupyter as root
USER root
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /etc/jupyter/ &&\
    fix-permissions /home/$DOCKER_USER && \
    fix-permissions $CONDA_DIR

#confirming that /home/jovyan is removed
RUN rm -r /home/$NB_USER
# Switch back to pyiron to avoid accidental container runs as root

USER $DOCKER_UID

WORKDIR $HOME
