dockeruser?=trickyhu
dockername?=sigsci-debian-nginx
dockertag?=latest
env_options?=
nginx_port?=8282
sigsci_socket=unix:/var/run/sigsci/sigsci.sock

build:
	docker build -t $(dockeruser)/$(dockername):$(dockertag) .

build-no-cache:
	docker build --no-cache -t $(dockeruser)/$(dockername):$(dockertag) .

run:
	docker run -p $(nginx_port):$(nginx_port) --name $(dockername) -d -e SIGSCI_SOCKET=$(sigsci_socket) -e SIGSCI_NGINX_PORT=$(nginx_port) $(env_options) $(dockeruser)/$(dockername):$(dockertag)

deploy:
	docker push $(dockeruser)/$(dockername):$(dockertag)
