#!/bin/bash

kubectl delete -f $(dirname $0)/deployment/additional-scrape-configs.yaml
kubectl delete -f $(dirname $0)/deployment/rbac-prom.yaml
kubectl delete -f $(dirname $0)/deployment/serv-monit.yaml
kubectl delete -f $(dirname $0)/deployment/prom-obj.yaml
kubectl delete -f $(dirname $0)/deployment/serv-threadmonit.yaml

kubectl delete -f $(dirname $0)/deployment/k8s-threadmonitor-deployment.yaml