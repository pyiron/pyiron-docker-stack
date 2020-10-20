#!/bin/bash
git clone https://github.com/pyiron/pyiron_base
cp -r "$HOME"/pyiron_base/notebooks/*.ipynb "$HOME"/
rm -r "$HOME"/pyiron_base
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
