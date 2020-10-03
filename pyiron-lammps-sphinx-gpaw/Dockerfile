ARG ROOT_CONTAINER=muhhassani/pyiron-image:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER $PYIRON_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

RUN conda install -y --quiet -c conda-forge lammps &&\
    conda install -y --quiet -c conda-forge sphinxdft && \
    conda install -y --quiet -c conda-forge gpaw && \
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
