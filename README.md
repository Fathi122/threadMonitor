# Prometheus Jmx Exporter Operator deployment on K8s

This example shows how to scrape jmeter metrics into Prometheus.

## Deploy sample application running jmx prometheus java agent
```
kubectl create -f deployment/k8s-threadmonitor-deployment.yaml
```

## Deploy helm3 chart for prometheus operator with new additional datasource
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -f deployment/datasource-prom.yaml --namespace monitoring
```

## Deploy jmx operator
```
./start-jmx-prom-operator.sh
```
