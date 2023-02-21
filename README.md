# docker-stacks
[![Docker Testing](https://github.com/pyiron/docker-stacks/workflows/Docker%20Push/badge.svg)](https://github.com/pyiron/docker-stacks/actions)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/pyiron/docker-stacks/master) 

Here, you find the necessary files for building various pyiron docker images.
All of these images can be pulled from [docker-hub](https://hub.docker.com/u/pyiron).
We provide following flavors based on the main pyiron-modules:

| image name | derived from | additional dependencies | pull command |
|------------|--------------|-------------------------|---------|
| pyiron/base | jupyter/base-notebook | <a href="https://anaconda.org/conda-forge/pyiron">pyiron_base</a> | `docker pull pyiron/base` |
| pyiron/md | pyiron/base | <a href="https://anaconda.org/conda-forge/lammps">LAMMPS</a>, <a href="https://anaconda.org/conda-forge/pyiron">pyiron</a> and <a href="https://anaconda.org/conda-forge/nglview">nglview</a> | `docker pull pyiron/md` |
| pyiron/pyiron | pyiron/md | <a href="https://anaconda.org/conda-forge/sphinxdft">SPHInX</a> and <a href="https://anaconda.org/conda-forge/gpaw">GPAW</a> |  `docker pull pyiron/pyiron` |
| pyiron/experimental | pyiron/base | <a href="https://anaconda.org/conda-forge/temmeta">TEMMETA</a>, <a href="https://anaconda.org/conda-forge/pyprismatic">pyprismatic</a>, <a href="https://anaconda.org/conda-forge/match-series">match-series</a>, <a href="https://anaconda.org/conda-forge/pyxem">pyxem</a>, <a href="https://anaconda.org/conda-forge/pystem">pystem</a> |  `docker pull pyiron/experimental` |
| pyiron/continuum | pyiron/md | <a href="https://anaconda.org/conda-forge/damask">damask</a>, <a href="https://anaconda.org/conda-forge/sqsgenerator">sqsgenerator</a>, <a href="https://anaconda.org/conda-forge/fenics">fenics</a> |  `docker pull pyiron/continuum` |

The images also include some example notebooks to get you started.

Running one of these container and spawning a Jupyter server from within will provide you with a ready-to-start environment for using pyiron.
If you like a simple Jupyter notebook, run
```bash
docker run -i -t -p 8888:8888 <image name> /bin/bash -c "source /opt/conda/bin/activate; jupyter notebook --notebook-dir=/home/jovyan/ --ip='*' --port=8888"
```
replace `<image_name>` with respective image you want to use, e.g. `pyiron/md`.
If you prefer to use Jupyter lab, run
```bash
docker run -i -t -p 8888:8888 <image_name> /bin/bash -c "source /opt/conda/bin/activate; jupyter lab --notebook-dir=/home/jovyan/ --ip='*' --port=8888"
```
These commands do a number of things:
- `docker run <image_name>` spawns a container based on image `<image_name>`.
In case the image isn't already on your system, it will be downloaded. Also, if not further specified, the `latest` tag will be assumed and outdated local versions may be updated.
- `-i -t`: the container is spanwed in "interactive mode" by allocating a pseudo-tty (`-t`).
- `-p 8888:8888`: port `8888` of the container instance is forwarded to port `8888` of the host.
- `<image name>`: the image's name.
- `/bin/bash`: inside the container, a `bash` shell is started.
- `-c "source /opt/conda/bin/activate; jupyter notebook --notebook-dir=/home/jovyan/ --ip='*' --port=8888"`: 
 the shell executes the command inside the quotation marks:
  - `source /opt/conda/bin/activate`: activate the conda environment
  - `jupyter notebook` or `jupyter lab`: start a Jupyter server running a notebbok/lab. Do this in the user's (`jovyan`) home-directory (`--notebook-dir=/home/jovyan/`) and allow connections from any IP address (`--ip='*'`) on port 8888 (`--port=8888`) which is connected to the outside.   

## Data persistence

In case you want to keep data you worked on/created while using the container, it may be convenient to mount a local directory into the home directory of the docker container by adding `-v <local_path>:/home/jovyan/` to the `docker run` command:
```bash
docker run -i -t  -v <local_path>:/home/jovyan/ -p 8888:8888 <image_name> /bin/bash -c "source /opt/conda/bin/activate; jupyter notebook --notebook-dir=/home/jovyan/ --ip='*' --port=8888"
```
