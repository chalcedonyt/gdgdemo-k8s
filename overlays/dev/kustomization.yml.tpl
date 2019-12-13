bases:
  - ../../base
generatorOptions:
  annotations:
    kustomize.generated.resource: 'true'
namePrefix: dev-

patchesStrategicMerge:
- resource-usage/nginx.yml
resources:
- templates/certs.yml
- templates/ingress.yml
configMapGenerator:
- name: nginx-proxy-conf
  files:
  - configmap-files/app.conf
secretGenerator:
- name: app-secrets
  env: secrets/secrets.env

images:
  - name: asia.gcr.io/gdgkl-demo-tim/gdgdemo-app:latest
    newName: asia.gcr.io/gdgkl-demo-tim/gdgdemo-app
    newTag: 'APP_TAG'