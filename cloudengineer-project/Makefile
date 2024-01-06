APP_REPOSITORY ?= missael/infrastructure-hire-project-app
APP_VERSION ?= local
AWS_ACCESS_KEY_ID ?= AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY ?= AWS_SECRET_ACCESS_KEY
AWS_REGION ?= us-east-1

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
	python3 flask/test_app.py

build-app:
	docker build -f flask/app/Dockerfile . -t $(APP_REPOSITORY):$(APP_VERSION)

run-app:
	docker run -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) -e AWS_REGION=$(AWS_REGION) -p 8001:8001 --name app $(APP_REPOSITORY):$(APP_VERSION)
