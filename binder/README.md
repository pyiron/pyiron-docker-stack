# Dockerfile for mybinder
To configure mybinder to run the notebooks from your repositories, you can simply include a Dockerfile, like the one in this folder, in the root of your repository.
## Details of the Dockerfile
In the first line, the base image is defined. You can select from different pyiron image. To check the available docker images from pyiron please check pyiron on docker hub. It is noteworthy that in mybinder documentation, it is suggested to use tags other than latest.      
In the second line the content of your repository is copied in the Docker image, so when you start mybinder, your notebooks and other files appear in the container.  
The rest of the Dockerfile, make sure that you have the right permissions when you work on the recently copied material to the container. **It is important to include these lines for users' write permission, therefore do not omit them.**