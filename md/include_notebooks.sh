#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone --single-branch --branch pyiron_atomistics-$(grep pyiron_atomistics environment.yml | tr "=" "\n" | sed '$!d')  https://github.com/pyiron/pyiron_atomistics.git
cp -r "${HOME}"/pyiron_atomistics/notebooks/*.ipynb "${NOTEBOOK_DIR}"
rm -r "${HOME}"/pyiron_atomistics
for f in $(cat "${HOME}"/exclude); do rm "${NOTEBOOK_DIR}"/$f; done;
rm "${HOME}"/*.yml
rm "${HOME}"/Dockerfile
rm "${HOME}"/exclude
rm "${HOME}"/*.sh
