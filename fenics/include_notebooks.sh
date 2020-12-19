#!/bin/bash
git clone https://github.com/pyiron/pyiron_contrib "$HOME"/from_contrib
cd "$HOME"/from_contrib/
git checkout FEniCS_job
cp "$HOME"/from_contrib/notebooks/fenics_tutorial.ipynb "$HOME"/
cp -r "$HOME"/from_contrib/pyiron_contrib "$HOME"/
rm -r "$HOME"/from_contrib
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh