# SigSciAgentAlpine

This simple container definition has only has the Signal Sciences Agent running in it. 

## Usage

**build**

The build command will use the Dockerfile to automatically build the container. You do not have to specify the username but it will default to my default docker username.

`make build dockeruser=MYUSERNAME`

**run**

The run command will spin up the built docker container.

`make run dockeruser=MYUSERNAME env_options="-e SIGSCI_ACCESSKEYID=REPLACEME -e SIGSCI_SECRETACCESSKEY=REPLACEME -e SIGSCI_HOSTNAME=sidecar -e SIGSCI_RPC_ADDRESS=unix:/var/run/sigsci/sigsci.sock"`

**deploy**

This will deploy the container to Docker hub

`make deploy dockeruser=MYUSERNAME`

## Make Options

| option | description | defaults |
|--------|-------------|----------|
|dockeruser|Docker hub username|trickyhu|
|dockername|Name for the Docker Image|sigsci-debian-nginx|
|dockertag|Docker tag to apply (latest, random_string)|latest|
|env_options| This allows you to pass additional docker options to the docker command line like `-e ENV_NAME=ENV_VALUE`||
|nginx_port|Port to expose and have nginx run on|8282|
|sigsci_socket|The socket file path that the module & agent will communicate over|unix:/var/run/sigsci/sigsci.sock|

**Example Usage**

`make run dockeruser=sigsci dockername=sigsci-nginx dockertag=ver1 env_options="-e ENV_NAME=env_value nginx_port=8383 sigsci_socket=unix:/tmp/sigsci.sock"`