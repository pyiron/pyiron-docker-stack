#!/bin/bash

# aggegate notebook from the pyiron_atomistics repo into this image
git clone https://github.com/pyiron/pyiron_atomistics
cp -r "$HOME"/pyiron_atomistics/notebooks/*.ipynb "$HOME"/

# exclude notebooks listed in file 'exclude'
for f in $(cat "$HOME"/exclude); do rm "$HOME"/$f; done;
rm "$HOME"/exclude

# clean up the image's $HOME
rm -r "$HOME"/pyiron_atomistics
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
