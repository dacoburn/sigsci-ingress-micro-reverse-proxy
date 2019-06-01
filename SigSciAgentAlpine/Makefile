dockeruser?=trickyhu
dockername?=sigsci-agent-alpine
dockertag?=latest
env_options?="-e SIGSCI_ACCESSKEYID=SETME -e SIGSCI_SECRETACCESSKEY=SETME -e SIGSCI_HOSTNAME=alpine35"

build:
	./getAgent.sh
	docker build -t $(dockeruser)/$(dockername):$(dockertag) .
	rm -rf contrib/sigsci-agent

build-no-cache:
	./getAgent.sh
	docker build --no-cache -t $(dockeruser)/$(dockername):$(dockertag) .
	rm -rf contrib/sigsci-agent

run:
	docker run --name $(dockername) -d $(env_options) $(dockeruser)/$(dockername):$(dockertag)

deploy:
	docker push $(dockeruser)/$(dockername):$(dockertag)
