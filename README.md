# pyiron-docker-stack
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/muh-hassani/pyiron-docker-stack/master)  
Here, one can find different flavours of Dockerfile for building pyiron docker images.   
The resulting images are:

| Image name | Derived from | Additional Dependencies |
|------------|--------------|-------------------------|
| pyiron-base-image | jupyter/base-notebook | <a href="https://anaconda.org/conda-forge/pyiron">pyiron_base</a> |
| pyiron-atomistic-image | jupyter/base-notebook | <a href="https://anaconda.org/conda-forge/pyiron">pyiron</a> and <a href="https://anaconda.org/conda-forge/nglview">nglview</a> |
| pyiron-md-image | pyiron/pyiron-atomistic-image | <a href="https://anaconda.org/conda-forge/lammps">LAMMPS</a> | 
| pyiron-sphinx-image | pyiron/pyiron-md-image | <a href="https://anaconda.org/conda-forge/sphinxdft">SPHInX</a> |
| pyiron-dft-image | pyiron/pyiron-sphinx-image | <a href="https://anaconda.org/conda-forge/gpaw">GPAW</a> |
| pyiron-image | pyiron/pyiron-dft-image |   | 

The images also include some examplary notebooks.  
