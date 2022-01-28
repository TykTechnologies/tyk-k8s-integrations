# Google k8s Engine

## Getting Started

1. Install `nginx` using helm:

```
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install tyk-nginx nginx-stable/nginx-ingress -n tyk
```

2. Run the following commands to enable Tyk services ingresses.
```
helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -f ./integrations/gke/values.yaml -n tyk --wait
```
