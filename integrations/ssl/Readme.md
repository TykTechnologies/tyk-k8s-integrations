## Getting Started

1. Generate a Certificate Authority:

```
openssl genrsa \
  -des3 \
  -out ./integrations/ssl/certs/tykCA.key \
  -passout pass:topsecretpassword \
  2048
```

2. Generate root cerificate:

```
openssl req \
  -x509 \
  -new \
  -nodes \
  -key ./integrations/ssl/certs/tykCA.key \
  -sha256 \
  -days 825 \
  -out ./integrations/ssl/certs/tykCA.pem \
  -passin pass:topsecretpassword \
  -subj "/C=CA/ST=Ontario/L=London/O=Tyk/CN=tyk.local/emailAddress=zaid@tyk.io"
```

3. Generate SSL certificate private key:

```
openssl genrsa \
  -out ./integrations/ssl/certs/tyk.local.key \
  2048
```

4. Generate SSL certificate certificate-signing request:

```
openssl req \
  -new \
  -key ./integrations/ssl/certs/tyk.local.key \
  -out ./integrations/ssl/certs/tyk.local.csr \
  -subj "/C=CA/ST=Ontario/L=London/O=Tyk/CN=tyk.local/emailAddress=zaid@tyk.io,challengePassword=topsecretpassword"
```

5. Generate SSL certificate:

```
openssl x509 \
  -req \
  -in ./integrations/ssl/certs/tyk.local.csr \
  -CA ./integrations/ssl/certs/tykCA.pem \
  -CAkey ./integrations/ssl/certs/tykCA.key \
  -CAcreateserial \
  -out ./integrations/ssl/certs/tyk.local.crt \
  -days 825 \
  -sha256 \
  -extfile ./integrations/ssl/certs/tyk.local.ext \
  -passin pass:topsecretpassword
```

6. Add Certificate Authority to Keychain Access:

```
sudo security add-trusted-cert \
  -d \
  -r trustRoot \
  -k /Library/Keychains/System.keychain \
  ./integrations/ssl/certs/tykCA.pem
```

7. Add `dashboard.tyk.local` and `gateway/tyk.local` to your `/etc/hosts` file.

```
127.0.0.1 gateway.tyk.local
127.0.0.1 dashboard.tyk.local
```

8. Generate k8s secret by running the `create-secret.sh` script.

`./integrations/ssl/create-secret.sh`

You may need to set the permissions for the script to execute:

`chmod +x ./integrations/ssl/create-secret.sh`

9. Create k8s secret

`kubectl apply -f integrations/ssl/tyk.local.secret.yaml -n tyk`

10. Run the following commands to run the Gateway and Dashboard Tyk services in SSL mode. The first command will standup and bootstrap Tyk. The second will install the SSL certs.
```
helm install tyk-pro tyk-helm/tyk-pro -f ./values.yaml -n tyk --wait
helm upgrade tyk-pro tyk-helm/tyk-pro -f ./values.yaml -f ./integrations/ssl/ssl.yaml -n tyk --wait
```
