ARG ROOT_CONTAINER=quay.io/jupyter/base-notebook:ubuntu-24.04@sha256:0ec801994602a53d3917d0f07ccf4474a1ddf5ae419483b24681a3c42abc4ce5
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER root

#removing the default user and the corresponding home directory.
#RUN rm -r /home/$NB_USER
#RUN userdel $NB_USER

#ARG DOCKER_USER="pyiron"
ARG DOCKER_UID="1000"
ARG DOCKER_GID="100"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    DOCKER_UID=$DOCKER_UID \
    DOCKER_GID=$DOCKER_GID
    # DOCKER_USER=$DOCKER_USER

#ENV HOME=/home/$DOCKER_USER
ENV HOME=/home/$NB_USER


COPY apt.txt /tmp/
# creating account for pyiron_user.
# RUN useradd -m -s /bin/bash -N -u $DOCKER_UID $DOCKER_USER && \
#     chown $DOCKER_USER:$NB_GID $CONDA_DIR && \
#     chmod g+w /etc/passwd

RUN apt-get update -y && \
    xargs -a /tmp/apt.txt apt-get install -y && \
    apt-get clean && \
    rm /tmp/apt.txt

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN mamba env update -n base -f ${HOME}/environment.yml && \
    mamba clean --all -f -y && \
    mamba list

# Fix permissions on /etc/jupyter as root
USER root
ENV NOTEBOOK_DIR=${HOME}/notebooks_base
RUN chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /etc/jupyter/ &&\
    fix-permissions ${HOME} && \
    fix-permissions $CONDA_DIR

#confirming that /home/jovyan is removed
#RUN rm -r /home/$NB_USER
# Switch back to pyiron to avoid accidental container runs as root

USER $DOCKER_UID

WORKDIR $HOME
