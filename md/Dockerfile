ARG ROOT_CONTAINER=pyiron/base:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER $DOCKER_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
RUN conda env update -n base -f ${HOME}/environment.yml && \
    jupyter nbextension install nglview --py --sys-prefix && \
    jupyter nbextension enable nglview --py --sys-prefix && \
    jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build && \
    jupyter labextension install nglview-js-widgets && \
    conda clean --all -f -y && \
    npm cache clean --force && \
    jlpm cache clean && \ 
    jupyter lab clean && \
    rm ${HOME}/environment.yml 

USER root
RUN fix-permissions /home/$DOCKER_USER &&\
    fix-permissions $CONDA_DIR && \
    chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /home/$DOCKER_USER && \
    chown -R ${DOCKER_USER}:${DOCKER_GID} ${HOME}/*.ipynb

# Switch back to pyiron to avoid accidental container runs as root
USER $DOCKER_UID

WORKDIR $HOME
