# Httpbin

## Getting Started
1. Create namespace for your httpbin app:
```
kubectl create ns services
```

2. Apply `httpbin-svc.yaml` to standup the `httpbin` service

```
kubectl apply -f integrations/operator/httpbin/httpbin-svc.yaml -n services
```

3. Apply  `httpbin-api-crd.yaml` to create Tyk httpbin API

```
kubectl apply -f integrations/operator/httpbin/httpbin-api-crd.yaml -n services
```
