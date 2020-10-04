#!/bin/bash

kubectl apply -f $(dirname $0)/deployment/additional-scrape-configs.yaml
kubectl apply -f $(dirname $0)/deployment/rbac-prom.yaml
kubectl apply -f $(dirname $0)/deployment/serv-monit.yaml
kubectl apply -f $(dirname $0)/deployment/prom-obj.yaml
kubectl apply -f $(dirname $0)/deployment/serv-threadmonit.yaml