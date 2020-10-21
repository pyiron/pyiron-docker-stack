#!/bin/bash
git clone https://github.com/vitesh13/DAMASK_workflows
cp -r "$HOME"/DAMASK_workflows/DAMASK_workflows.ipynb "$HOME"/
rm -r "$HOME"/DAMASK_workflows
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/*.sh
