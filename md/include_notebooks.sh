#!/bin/bash
git clone https://github.com/pyiron/pyiron_atomistics
cp -r "$HOME"/pyiron_atomistics/notebooks/*.ipynb "$HOME"/
rm -r "$HOME"/pyiron_atomistics
for f in $(cat "$HOME"/exclude); do rm "$HOME"/$f; done;
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/exclude
rm "$HOME"/*.sh
