#!/bin/bash
mkdir ${NOTEBOOK_DIR} 
git clone --single-branch --branch pyiron_experimental-$(grep pyiron_experimental environment.yml | tr "=" "\n" | sed '$!d')  https://github.com/pyiron/pyiron_experimental.git pyiron_experimental_repo
cp "$HOME"/pyiron_experimental_repo/notebooks/*.ipynb "${NOTEBOOK_DIR}"
cp "$HOME"/pyiron_experimental_repo/notebooks/*.tif "${NOTEBOOK_DIR}"
cp "$HOME"/pyiron_experimental_repo/notebooks/*.emd "${NOTEBOOK_DIR}"
cp -r "$HOME"/pyiron_experimental_repo/pyiron_experimental "${NOTEBOOK_DIR}"
rm -rf "$HOME"/pyiron_experimental_repo
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
rm "$HOME"/*.yml
