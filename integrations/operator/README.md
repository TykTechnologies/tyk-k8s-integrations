### How to install Tyk Operator

```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.8.0/cert-manager.yaml
helm install tyk-operator tyk-helm/tyk-operator -n tyk
```
