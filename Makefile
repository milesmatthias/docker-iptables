SHELL:=/bin/bash
SHA:=$(shell git describe --long --dirty --always --tags)
IMG:=milesmatthias/iptables-dropped

.PHONY: image deploy

image:
	docker build -t $(IMG):latest -t $(IMG):$(SHA) .
	docker push $(IMG):latest
	docker push $(IMG):$(SHA)

deploy:
	kubectl apply -f daemonset.yaml
