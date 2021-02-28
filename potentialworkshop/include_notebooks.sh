#!/bin/bash
git clone https://github.com/pyiron/pyiron_potentialfit.git
cp -r "$HOME"/pyiron_potentialfit/day_* "$HOME"/
rm -r "$HOME"/pyiron_potentialfit
