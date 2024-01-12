CLUSTERNAME ?= dev-01

create-cluster:
	@k3d cluster create $(CLUSTERNAME) --agents 2 --k3s-arg "--disable=traefik@server:*" --port 80:80@loadbalancer --port 443:443@loadbalancer

deploy-services:
	# Install Nginx Ingress Controller
	@kubectl create namespace ingress-nginx
	@helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
	@helm repo update
	@helm install nginx-ingress ingress-nginx/ingress-nginx --namespace ingress-nginx --set controller.replicaCount=2

	# Install Cert-Manager
	@kubectl create namespace cert-manager
	@helm repo add jetstack https://charts.jetstack.io
	@helm repo update
	@helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.3.0 --set installCRDs=true

delete-cluster:
	@k3d cluster delete $(CLUSTERNAME)

up: create-cluster deploy-services

down: delete-cluster
