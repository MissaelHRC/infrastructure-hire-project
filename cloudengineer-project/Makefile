APP_REPOSITORY ?= missael/infrastructure-hire-project-app
PROXY_REPOSITORY ?= missael/infrastructure-hire-project-proxy
APP_VERSION ?= local

tf-init:
	./scripts/init-terraform.sh

tf-plan:
	terraform -chdir=terraform/ plan

tf-apply:
	terraform -chdir=terraform/ apply

tf-fmt:
	terraform -chdir=terraform/ fmt

tf-destroy:
	terraform -chdir=terraform/ destroy

test-app:
	python3 flask/app/test_app.py

test-proxy:
	python3 flask/proxy/test_proxy.py

build-app:
	docker build -f flask/app/Dockerfile . -t $(APP_REPOSITORY):$(APP_VERSION)

run-app:
	docker run -p 8001:8001 --name app $(APP_REPOSITORY):$(APP_VERSION)

build-proxy:
	docker build -f flask/proxy/Dockerfile . -t $(APP_REPOSITORY):$(APP_VERSION)

run-proxy:
	docker run -p 8001:8001 --name proxy $(APP_REPOSITORY):$(APP_VERSION)
