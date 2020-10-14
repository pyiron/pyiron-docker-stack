#!/bin/bash
git clone https://github.com/pyiron/pyiron
mv "$HOME"/pyiron/notebooks/ "$HOME"/
rm -r "$HOME"/pyiron
for f in $(cat "$HOME"/exclude); do rm "$HOME"/notebooks/$f; done;