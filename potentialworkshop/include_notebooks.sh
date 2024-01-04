#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone https://github.com/pyiron/potentials-workshop-2021.git
cp -r "$HOME"/potentials-workshop-2021/day_* "${NOTEBOOK_DIR}"
rm -r "$HOME"/potentials-workshop-2021
rm apt.txt
rm Dockerfile
rm *.yml
rm exclude
rm *.sh
