#!/bin/bash

cp integrations/ssl/tyk.local.secret.yaml.example integrations/ssl/tyk.local.secret.yaml

echo "  tyk.local.crt: `cat integrations/ssl/certs/tyk.local.crt | base64`" >> integrations/ssl/tyk.local.secret.yaml
echo "  tyk.local.key: `cat integrations/ssl/certs/tyk.local.key | base64`" >> integrations/ssl/tyk.local.secret.yaml
