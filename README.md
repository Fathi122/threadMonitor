# Prometheus Jmx Exporter Operator deployment on K8s

This example shows how to scrape Jmx metrics into Prometheus.

## Deploy sample application running Jmx prometheus java agent
```console
kubectl create -f deployment/k8s-threadmonitor-deployment.yaml
```

## Deploy helm3 chart for prometheus operator with new additional datasource
```console
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -f deployment/datasource-prom.yaml --create-namespace --namespace monitoring
```

## Deploy Jmx operator
```console
./start-jmx-prom-operator.sh
```

## Create a new Grafana dashboard with Jmx metrics

Upload prometheus-jmx-exporter_rev1.json file to create a new Jmx prometheus dashboard and select the newly created prometheus datasource.
