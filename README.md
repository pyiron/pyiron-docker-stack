# docker-stacks
[![Build Status](https://travis-ci.com/pyiron/docker-stacks.svg?branch=master)](https://travis-ci.com/pyiron/docker-stacks)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/pyiron/docker-stacks/master) 

Here, one can find different flavours of Dockerfile for building pyiron docker images.   
The resulting images are:

| Image name | Derived from | Additional Dependencies | Command |
|------------|--------------|-------------------------|---------|
| pyiron/base | jupyter/base-notebook | <a href="https://anaconda.org/conda-forge/pyiron">pyiron_base</a> | `docker pull pyiron/base` |
| pyiron/atomistic | pyiron/base | <a href="https://anaconda.org/conda-forge/pyiron">pyiron</a> and <a href="https://anaconda.org/conda-forge/nglview">nglview</a> | `docker pull pyiron/atomistic` |
| pyiron/md | pyiron/atomistic | <a href="https://anaconda.org/conda-forge/lammps">LAMMPS</a> | `docker pull pyiron/md` |
| pyiron/sphinx | pyiron/md | <a href="https://anaconda.org/conda-forge/sphinxdft">SPHInX</a> | `docker pull pyiron/sphinx` |
| pyiron/dft | pyiron/sphinx | <a href="https://anaconda.org/conda-forge/gpaw">GPAW</a> | `docker pull pyiron/dft` |
| pyiron/pyiron | pyiron/dft |   |  `docker pull pyiron/pyiron` |

The images also include some examplary notebooks.  
