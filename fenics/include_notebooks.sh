#!/bin/bash
git clone https://github.com/pyiron/pyiron_contrib
git checkout FEniCS_job
cp -r "$HOME"/pyiron/notebooks/fenics_tutorial.ipynb "$HOME"/
cp -r "$HOME"/pyiron_contrib/pyiron_contrib "$HOME/"
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/exclude
rm "$HOME"/*.sh
