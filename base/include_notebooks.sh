#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone --single-branch --branch pyiron_base-$(grep pyiron_base environment.yml | tr "=" "\n" | sed '$!d')  https://github.com/pyiron/pyiron_base.git
cp -r "$HOME"/pyiron_base/notebooks/*.ipynb "$NOTEBOOK_DIR"
rm -r "$HOME"/pyiron_base
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
