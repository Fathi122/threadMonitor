# Prometheus Jmx Exporter Operator deployment on K8s

This example shows how to scrape jmeter metrics into Prometheus.

## Deploy sample application running Jmx prometheus java agent
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

## Deploy Jmx operator
```
./start-jmx-prom-operator.sh
```

## Create a new Grafana dashboard with Jmx metrics

Upload prometheus-jmx-exporter_rev.json file to create a new Jmx prometheus dashboard and select the newly created prometheus datasource.
