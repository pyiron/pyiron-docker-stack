#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone https://github.com/pyiron/pyiron_base
cp -r "$HOME"/pyiron_base/notebooks/*.ipynb "$NOTEBOOK_DIR"
rm -r "$HOME"/pyiron_base
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
