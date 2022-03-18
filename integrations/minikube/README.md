# MiniKube

## Getting Started

1. Start MiniKube. You can specify the number of nodes by setting the `--nodes=x` flag: `minikube start`

2. Follow the instructions in the root of the repository to install Tyk on MinKube.

### Optional
Run the following commands to enable Nginx ingress controller and Tyk services ingresses.
```
minikube addons enable ingress
helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -f ./integrations/ingress/ingress.yaml -n tyk --wait
```
