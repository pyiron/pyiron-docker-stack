#!/bin/bash

# aggegate notebook from the pyiron_base repo into this image
git clone https://github.com/pyiron/pyiron_base
cp -r "$HOME"/pyiron_base/notebooks/*.ipynb "$HOME"/

# clean up the image's $HOME
rm -r "$HOME"/pyiron_base
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
