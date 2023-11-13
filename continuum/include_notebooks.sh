#!/bin/bash
mkdir ${NOTEBOOK_DIR}
git clone https://github.com/pyiron/pyiron_continuum
cp "${HOME}"/pyiron_continuum/notebooks/fenics_tutorial.ipynb "${NOTEBOOK_DIR}"
cp "${HOME}"/pyiron_continuum/notebooks/damask_tutorial.ipynb "${NOTEBOOK_DIR}"
rm -r "${HOME}"/pyiron_continuum
rm "${HOME}"/*.yml
rm "${HOME}"/Dockerfile
rm "${HOME}"/*.sh
