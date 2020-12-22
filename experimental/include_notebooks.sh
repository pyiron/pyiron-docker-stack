#!/bin/bash
git clone https://github.com/pyiron/pyiron_experimental pyiron_experimental_repo
cp "$HOME"/pyiron_experimental_repo/*.ipynb "$HOME"/
cp "$HOME"/pyiron_experimental_repo/*.tif "$HOME"/
cp "$HOME"/pyiron_experimental_repo/*.emd "$HOME"/
cp -r "$HOME"/pyiron_experimental_repo/pyiron_experimental "$HOME"/
rm -r "$HOME"/pyiron_experimental_repo
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
rm "$HOME"/*.yml
