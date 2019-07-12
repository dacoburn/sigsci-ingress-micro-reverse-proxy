dockeruser?=trickyhu
dockername?=sigsci-apache-alpine
dockertag?=latest
env_options?=
apache_port?=8989
sigsci_rpc?=\/var\/run\/sigsci\/apache.sock

build:
	docker build -t $(dockeruser)/$(dockername):$(dockertag) .

build-no-cache:
	docker build --no-cache -t $(dockeruser)/$(dockername):$(dockertag) .

run:
	docker run -p $(apache_port):$(apache_port) --name $(dockername) -d -e sigsci_rpc=$(sigsci_rpc) -e apache_port=$(apache_port) $(dockeruser)/$(dockername):$(dockertag)

deploy:
	docker push $(dockeruser)/$(dockername):$(dockertag)
