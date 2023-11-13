#!/bin/bash
NOTEBOOK_DIR="${HOME}"/notebooks_atomistics
mkdir ${NOTEBOOK_DIR}
git clone https://github.com/pyiron/pyiron_atomistics
cp -r "$HOME"/pyiron_atomistics/notebooks/*.ipynb "$NOTEBOOK_DIR"
rm -r "$HOME"/pyiron_atomistics
for f in $(cat "$HOME"/exclude); do rm "$HOME"/$f; done;
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/exclude
rm "$HOME"/*.sh
