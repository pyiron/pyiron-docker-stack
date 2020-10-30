# Dockerfile for mybinder
To configure mybinder to run the notebooks from your repositories, you can simply include a Dockerfile, like the one in this folder, in the root of your repository.
## Details of the Dockerfile
In the first line, the base image is defined. You can select from different pyiron image. To check the available docker images from pyiron, please check [pyiron repositories on docker hub](https://hub.docker.com/orgs/pyiron/repositories). It is noteworthy that in [mybinder documentation](https://mybinder.readthedocs.io/en/latest/tutorials/dockerfile.html), it is suggested to use tags other than latest.      
In the second line the content of your repository is copied in the Docker image, so when you start mybinder, your notebooks and other files appear in the jupyter server.  
The rest of the Dockerfile, make sure that user has the right permissions when he/she work on the recently copied material to the container. **It is important to include these lines for users' write permission, therefore do not omit them.**
