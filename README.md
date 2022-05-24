# tyk-k8s-integrations

## Getting Started

1. Add Tyk Helm Repo: 
```
helm repo add tyk-helm https://helm.tyk.io/public/helm/charts/
helm repo update
```

2. Create `valaues.yaml` file: `helm show values tyk-helm/tyk-pro > values.yaml`

3. Add your license key under `.dash.license`

4. Create `tyk` namespace and install Redis and Mongo dependecies
```
kubectl create ns tyk
helm install redis tyk-helm/simple-redis -n tyk
helm install mongo tyk-helm/simple-mongodb -n tyk
```

5. Install Tyk: `helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -n tyk --wait`

For more information on the Tyk Helm Charts please visit our [tyk-helm-chart](https://github.com/TykTechnologies/tyk-helm-chart) Github repository or our official [Tyk Helm Chart](https://tyk.io/docs/tyk-self-managed/tyk-helm-chart/) documentation.

## Integrations
- Multi Data Centre Bridge `integrations/mdcb`
- MiniKube `integrations/minikube`
- Nginx Ingress Controller `integrations/nginx-ingress`
- Operator `integrations/operator`
    - **Examples of CRDs** `/example-crds`
    - **httpbin service and API CRD** `/httpbin`
- SSL `integrations/ssl`
