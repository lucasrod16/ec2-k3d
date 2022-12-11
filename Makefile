SHELL := /usr/bin/env bash -o errexit -o pipefail -o nounset

.PHONY: help
help: ## Display list of all targets
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: all
all: create-infra wait create-cluster copy-kubeconfig ## Create AWS infrastructure, create k3d cluster, and set up cluster for remote access

.PHONY: copy-kubeconfig
copy-kubeconfig: ## Copy the kubeconfig from the ec2 instance to the local machine for remote access
	hack/copy-kubeconfig.sh

.PHONY: create-cluster
create-cluster: ## Create k3d cluster on the ec2 instance
	hack/create-cluster.sh

.PHONY: create-infra
create-infra: ## Create ec2 instance, security group, ssh keypair
	hack/create-infra.sh

.PHONY: destroy
destroy: ## Tear down AWS infrastructure
	hack/destroy.sh

.PHONY: wait
wait: ## Wait for the ec2 instance to be ready
	hack/wait.sh