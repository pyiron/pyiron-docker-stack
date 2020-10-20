#!/bin/bash
git clone https://github.com/pyiron/pyiron_experimental
cp "$HOME"/pyiron_experimental/*.ipynb "$HOME"/
mv "$HOME"/pyiron_experimental/ "$HOME"/pyiron_experimental_tmp/
cp "$HOME"/pyiron_experimental_tmp/pyiron_experimental "$HOME"/
rm -r "$HOME"/pyiron_experimental_tmp
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
