#!/bin/bash
git clone https://github.com/pyiron/pyiron_experimental pyiron_experimental_repo
cp "$HOME"/pyiron_experimental_repo/notebooks/*.ipynb "$HOME"/
cp "$HOME"/pyiron_experimental_repo/notebooks/*.tif "$HOME"/
cp "$HOME"/pyiron_experimental_repo/notebooks/*.emd "$HOME"/
cp -r "$HOME"/pyiron_experimental_repo/pyiron_experimental "$HOME"/
rm -r "$HOME"/pyiron_experimental_repo
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
rm "$HOME"/*.yml
