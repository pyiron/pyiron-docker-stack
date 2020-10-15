#!/bin/bash
git clone https://github.com/pyiron/pyiron
cp -r "$HOME"/pyiron/notebooks/ "$HOME"/
rm -r "$HOME"/pyiron
for f in $(cat "$HOME"/exclude); do rm "$HOME"/notebooks/$f; done;
rm "$HOME"/*.yml
rm "$HOME"/Dockerfile
rm "$HOME"/exclude
rm "$HOME"/*.sh
rm "$HOME"/apt.txt