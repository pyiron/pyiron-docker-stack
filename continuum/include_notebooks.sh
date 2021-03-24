#!/bin/bash
git clone https://github.com/pyiron/pyiron_continuum "$HOME"/pyiron_continuum/
cd "$HOME"/pyiron_continuum/
cp "$HOME"/pyiron_continuum/notebooks/fenics_tutorial.ipynb "$HOME"/
cd ..
git clone https://github.com/materialdigital/pyiron-workflow-damask "$HOME"/pyiron-workflow-damask/
cd "$HOME"/pyiron-workflow-damask/
cp "$HOME"/pyiron-workflow-damask/*.ipynb "$HOME"/
cp -r "$HOME"/pyiron-workflow-damask/Examples/ "$HOME"/
cd ..
rm -r "$HOME"/pyiron_continuum
rm -r "$HOME"/pyiron-workflow-damask/
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
