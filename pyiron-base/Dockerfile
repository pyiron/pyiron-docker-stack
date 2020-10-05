ARG ROOT_CONTAINER=jupyter/base-notebook:36d857bb0121
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER root

#removing the default user and the corresponding home directory.
RUN rm -r /home/$NB_USER
RUN userdel $NB_USER 
    

ARG PYIRON_USER="pyiron"
ARG PYIRON_UID="1000"
ARG NB_GID="100"

# Configure environment
ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    PYIRON_USER=$PYIRON_USER \
    PYIRON_UID=$PYIRON_UID \
    NB_GID=$NB_GID \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ENV HOME=/home/$PYIRON_USER

# creating account for pyiron_user.
RUN useradd -m -s /bin/bash -N -u $PYIRON_UID $PYIRON_USER && \
    chown $PYIRON_USER:$NB_GID $CONDA_DIR && \
    chmod g+w /etc/passwd && \
    fix-permissions $HOME && \
    fix-permissions $CONDA_DIR


USER $PYIRON_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY environment.yml ${HOME}/
#RUN conda install --quiet -y -c conda-forge lammps &&\
RUN conda env update -n base -f ${HOME}/environment.yml && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    fix-permissions /home/$PYIRON_USER &&\
    fix-permissions $CONDA_DIR

# Fix permissions on /etc/jupyter as root
USER root
RUN fix-permissions /etc/jupyter/
#confirming that /home/jovyan is removed
RUN rm -r /home/$NB_USER
# Switch back to pyiron to avoid accidental container runs as root

USER $PYIRON_UID

WORKDIR $HOME
