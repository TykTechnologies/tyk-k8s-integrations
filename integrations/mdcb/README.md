# Multi Data Centre Bridge

## Setup Ingresses (Optional)
```
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm install tyk-nginx nginx-stable/nginx-ingress
```

## Getting Started
1. Add the MDCB license to the root `values.yaml`

2. Install `Control Plane` using helm:

`Without ingresses`:
```
helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -f ./integrations/mdcb/mdcb.yaml -n tyk --wait
```

`With ingresses`:
```
helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -f ./integrations/mdcb/mdcb.yaml -f ./integrations/nginx-ingress/ingress.yaml -n tyk --wait
```

3. Follow this [documentation](https://tyk.io/docs/tyk-multi-data-centre/setup-master-data-centre/#gateway-config) to enable hybrid options on your organasation.

4. Copy for `hybrid.yaml.example` to `hybrid.yaml`

`cp ./integrations/mdcb/hybrid.yaml.example ./integrations/mdcb/hybrid.yaml`

5. Update the `hybrid.yaml`:

```
Organisation ID                       > gateway.rpc.rpcKey
Tyk Dashboard API Access Credentials  > gateway.rpc.apiKey
MDCB Connection String                > gateway.rpc.connString
```

`Without ingress`:
```
kubectl create ns tyk-worker
helm install redis tyk-helm/simple-redis -n tyk-worker
helm install tyk-hybrid tyk-helm/tyk-hybrid -f ./integrations/mdcb/hybrid.yaml -n tyk-worker
```

`With ingress`:
```
kubectl create ns tyk-worker
helm install redis tyk-helm/simple-redis -n tyk-worker
helm install tyk-hybrid tyk-helm/tyk-hybrid -f ./integrations/mdcb/hybrid.yaml -f ./integrations/mdcb/hybrid.ingress.yaml -n tyk-worker
```
