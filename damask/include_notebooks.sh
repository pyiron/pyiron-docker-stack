#!/bin/bash
git clone https://github.com/matbinder/DAMASK-example
cp "$HOME"/DAMASK-example/DAMASK_workflows.ipynb "$HOME"/
cp "$HOME"/DAMASK-example/*.py "$HOME"/
rm -r "$HOME"/DAMASK-example
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
