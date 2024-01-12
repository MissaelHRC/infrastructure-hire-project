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

eks-config:
	aws eks update-kubeconfig --region us-east-1 --name missael-hire-project

create-namespace:
	kubectl create namespace missael

apply-all:
	kubectl apply -f k8s/app

alb-account:
	kubectl apply -f k8s/alb/aws-load-balancer-controller-service-account.yaml

alb-cert:
	kubectl apply \
        --validate=false \
        -f https://github.com/jetstack/cert-manager/releases/download/v1.12.3/cert-manager.yaml

alb-apply-full:
	kubectl apply -f k8s/alb/v2_5_4_full.yaml

alb-apply-ingress:
	kubectl apply -f k8s/alb/v2_5_4_ingclass.yaml

alb-verify:
	kubectl get deployment -n kube-system aws-load-balancer-controller

get-address:
	kubectl get ingress/proxy-ingress -n missael
