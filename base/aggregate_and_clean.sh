#!/bin/bash

# aggegate notebook from the pyiron_base repo into this image
git clone https://github.com/pyiron/pyiron_base.git
cp -r "$HOME"/pyiron_base/notebooks/*.ipynb "$HOME"/

# clean up the image's $HOME
rm -r "$HOME"/pyiron_base
rm "$HOME"/environment.yml
rm "$HOME"/Dockerfile
rm "$HOME"/apt.txt
rm "$HOME"/aggregate_and_clean.sh
