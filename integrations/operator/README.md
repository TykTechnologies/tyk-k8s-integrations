### How to install Tyk Operator

```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.3.0/cert-manager.yaml
helm install tyk-operator tyk-helm/tyk-operator
```
