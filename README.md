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

Start the container using: 
```
docker run -i -t -p 8888:8888 pyiron/pyiron /bin/bash -c "source /opt/conda/bin/activate; jupyter notebook --notebook-dir=/home/pyiron/ --ip='*' --port=8888"
```
replace `pyiron/pyiron` with the sepecific container you downloaded and to start jupyter lab use:
```
docker run -i -t -p 8888:8888 pyiron/pyiron /bin/bash -c "source /opt/conda/bin/activate; jupyter lab --notebook-dir=/home/pyiron/ --ip='*' --port=8888"
```
To explain the command: `docker run` starts the container in interactive mode `-i` by allocating a pseudo-TTY `-t`. The port `8888` of the docker container instance is forwarded to the local port `8888` the image of choice is `pyiron/pyiron` and inside the image the bash shell is used `/bin/bash` to execute the following command `-c`. First activate the conda environment by sourcing `source /opt/conda/bin/activate` and afterwars start either a jupyter notebook `jupyter notebook` or `jupyter lab` both in the home directory of the pyiron user `--notebook-dir=/home/pyiron/` and allow connections from any IP address `--ip='*'` on port 8888 `--port=8888` which is connected to the outside. 
