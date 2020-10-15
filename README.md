# pyiron-docker-stack
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/muh-hassani/pyiron-docker-stack/master)  
Here, one can find different flavours of Dockerfile for building pyiron docker images.   
The resulting images are:

| Image name | Derived from | Additional Dependencies |
|------------|--------------|-------------------------|
| pyiron/base | jupyter/base-notebook | <a href="https://anaconda.org/conda-forge/pyiron">pyiron_base</a> |
| pyiron/atomistic | pyiron/base | <a href="https://anaconda.org/conda-forge/pyiron">pyiron</a> and <a href="https://anaconda.org/conda-forge/nglview">nglview</a> |
| pyiron/md | pyiron/atomistic | <a href="https://anaconda.org/conda-forge/lammps">LAMMPS</a> | 
| pyiron/sphinx | pyiron/md | <a href="https://anaconda.org/conda-forge/sphinxdft">SPHInX</a> |
| pyiron/dft | pyiron/sphinx | <a href="https://anaconda.org/conda-forge/gpaw">GPAW</a> |
| pyiron/pyiron | pyiron/dft |   | 

The images also include some examplary notebooks.  
