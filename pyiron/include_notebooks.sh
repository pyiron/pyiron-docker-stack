#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone https://github.com/pyiron/pyiron
cp -r "${HOME}"/pyiron/notebooks/*.ipynb "${NOTEBOOK_DIR}"
rm -r "${HOME}"/pyiron
for f in $(cat "${HOME}"/exclude); do rm "${NOTEBOOK_DIR}"/$f; done;
rm "${HOME}"/Dockerfile
rm "${HOME}"/exclude
rm "${HOME}"/*.sh
rm "${HOME}"/*.yml
