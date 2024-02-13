# Docker Stacks
[![Docker Testing](https://github.com/pyiron/docker-stacks/workflows/Docker%20Push/badge.svg)](https://github.com/pyiron/docker-stacks/actions)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/pyiron/docker-stacks/master) 

Here, you find the necessary files for building various pyiron docker images. All of these images can be pulled from [docker-hub](https://hub.docker.com/u/pyiron). We provide following flavors based on the main pyiron modules:

| Image Name                                                                    | Derived From          | Additional Dependencies | Pull Command |
|-------------------------------------------------------------------------------|-----------------------|-------------------------|--------------|
| [pyiron/base](https://hub.docker.com/r/pyiron/base)                           | jupyter/base-notebook | [pyiron_base](https://anaconda.org/conda-forge/pyiron_base) | `docker pull pyiron/base` |
| [pyiron/md](https://hub.docker.com/r/pyiron/md)                               | pyiron/base           | [LAMMPS](https://anaconda.org/conda-forge/lammps), [pyiron](https://anaconda.org/conda-forge/pyiron), [NGLview](https://anaconda.org/conda-forge/nglview) | `docker pull pyiron/md` |
| [pyiron/pyiron](https://hub.docker.com/r/pyiron/pyiron)                       | pyiron/md             | [SPHInX](https://anaconda.org/conda-forge/sphinxdft), [GPAW](https://anaconda.org/conda-forge/gpaw) |  `docker pull pyiron/pyiron` |
| [pyiron/experimental](https://hub.docker.com/r/pyiron/experimental)           | pyiron/base           | [TEMMETA](https://anaconda.org/conda-forge/temmeta), [pyprismatic](https://anaconda.org/conda-forge/pyprismatic), [match-series](https://anaconda.org/conda-forge/match-series), [pyxem](https://anaconda.org/conda-forge/pyxem), [pystem](https://anaconda.org/conda-forge/pystem)  |  `docker pull pyiron/experimental` |
| [pyiron/continuum](https://hub.docker.com/r/pyiron/continuum)                 | pyiron/md             | [damask](https://anaconda.org/conda-forge/damask), [sqsgenerator](https://anaconda.org/conda-forge/sqsgenerator), [fenics](https://anaconda.org/conda-forge/fenics) |  `docker pull pyiron/continuum` |
| [pyiron/potentialworkshop](https://hub.docker.com/r/pyiron/potentialworkshop) | pyiron/pyiron         | [atomicrex](https://anaconda.org/conda-forge/atomicrex), [calphy](https://anaconda.org/conda-forge/calphy), [pyiron_contrib](https://anaconda.org/conda-forge/pyiron_contrib), [pyiron_gpl](https://anaconda.org/conda-forge/pyiron_gpl), [python-ace](https://anaconda.org/conda-forge/python-ace), [runner](https://anaconda.org/conda-forge/runner) | `docker pull pyiron/potentialworkshop` |
| [pyiron/mpie_cmti](https://hub.docker.com/r/pyiron/mpie_cmti)                 | pyiron/pyiron         | [atomicrex](https://anaconda.org/conda-forge/atomicrex), [calphy](https://anaconda.org/conda-forge/calphy), [fitsnap](https://anaconda.org/conda-forge/fitsnap3), [pyiron_contrib](https://anaconda.org/conda-forge/pyiron_contrib), [pyiron_gpl](https://anaconda.org/conda-forge/pyiron_gpl), [pyiron_gui](https://anaconda.org/conda-forge/pyiron_gui), [pyiron_workflow](https://anaconda.org/conda-forge/pyiron_workflow), [python-ace](https://anaconda.org/conda-forge/python-ace), [pytorch](https://anaconda.org/conda-forge/pytorch), [runner](https://anaconda.org/conda-forge/runner), [tensorflow](https://anaconda.org/conda-forge/tensorflow) | `docker pull pyiron/mpie_cmti` |

By deriving the images from each other the size of [Docker layers](https://docs.docker.com/build/guide/layers/) is reduced to a minimum. The images also include some example notebooks to get you started. 

# Execute Docker Container 

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

## Data Persistence

In case you want to keep data you worked on/created while using the container, it may be convenient to mount a local directory into the home directory of the docker container by adding `-v <local_path>:/home/jovyan/` to the `docker run` command:
```bash
docker run -i -t  -v <local_path>:/home/jovyan/ -p 8888:8888 <image_name> /bin/bash -c "source /opt/conda/bin/activate; jupyter notebook --notebook-dir=/home/jovyan/ --ip='*' --port=8888"
```
