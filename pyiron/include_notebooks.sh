#!/bin/bash
git clone https://github.com/pyiron/pyiron
cp -r "$HOME"/pyiron/notebooks/*.ipynb "$HOME"/
rm -r "$HOME"/pyiron
for f in $(cat "$HOME"/exclude); do rm "$HOME"/$f; done;
rm "$HOME"/Dockerfile
rm "$HOME"/exclude
rm "$HOME"/*.sh
rm "$HOME"/*.yml
