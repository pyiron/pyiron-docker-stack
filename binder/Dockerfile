FROM pyiron/pyiron:2020-10-28
COPY . ${HOME}/

USER root
RUN fix-permissions /home/$DOCKER_USER
USER $DOCKER_UID
