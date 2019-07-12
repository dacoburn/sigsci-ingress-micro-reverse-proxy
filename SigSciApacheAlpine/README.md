## Signal Sciences Docker Configuration - Alpine with Apache 2.4

This is a dockerized agent with the SigSci Apache Module and Apache2. This container is set up to take environment variables for the Access Key and Secret Key. You can use a pre-built container or build your own. When building and deploying I tend to use the agent version followed by the SigSci module version for the tag.

## Information about the files


**start.sh**
The start.sh is a simple script for doing some customizations. I use it to start the apache service and then set a custom hostname that the Signal Sciences agent will report up. I like to include a hard coded value, I.E. MYKUBECLUSTERNAME, followed by the dynamically found hostname. On Docker, or Kuberneted, the hostname is the docker id. Between those two things it makes it very easy to figure out where the container is running in relation to the agent found in the Signal Sciences dashboard.

**contrib**

_Files:_

````
    contrib/index.html  # Index.html for the sample web page
    contrib/signalsciences.png # Sample image for the web page
    contrib/sigsci-module/httpd.conf # Default httpd.conf with the pre-configured LoadModule for the SigSci Module
````


I'll usually create a .dockerignore file that will ignore adding the contrib to the final docker container and put files that I would like to copy into the container in this folder. For example in my demo container I've put a custom splash screen for the default index.html for Apache2.

![signalsciences_example_screenshot.png "SigSci Default HTML"] (contrib/signalsciences_example_screenshot.png)


**Dockerfile**
The included dockerfile is my example for creating a container that has Apache2, with the SignalSciences Module enabled, and our Signal Sciences Agent.

**Makefile**
I tend to prefer nice easy command for doing my tasks in building, deploying, and testing locally. The makefile simplifies this process but is not neccessary.

## Running the container

make run DOCKERUSER=*USERNAME* DOCKERNAME=sigsci-agent-apache-alpine DOCKERTAG=1.21.0-1.5.1 SIGSCI_ACCESSKEYID=*ACCESSKEY* SIGSCI_SECRETACCESSKEY=*SECRETKEY* SIGSCI_HOSTNAME=dockerhostname

## Building Docker image

You can use the Makefile to build the Docker Container
Make Example:

make build DOCKERUSER=*USERNAME* DOCKERNAME=sigsci-agent-apache-alpine DOCKERTAG=1.21.0-1.5.1

Example:

make build  DOCKERUSER=*USERNAME* DOCKERNAME=sigsci-agent-apache-alpine DOCKERTAG=1.21.0-1.5.1

## Deploying to Docker

You can also use the Makefile to deploy the created container to Docker Hub

make deploy DOCKERUSER=*USERNAME* DOCKERNAME=sigsci-agent-apache-alpine DOCKERTAG=1.21.0-1.5.1


