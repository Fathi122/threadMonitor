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

## Observe Grafana dashboard

Do a port forwarding on Grafana K8s pod in monitoring namespace on port 3000
```console
kubectl port-forward $(kubectl get pods --selector=app.kubernetes.io/name=grafana --output=jsonpath="{.items..metadata.name}" -n monitoring) 3000 -n monitoring
```

## Create a new Grafana dashboard with Jmx metrics

Upload **prometheus-jmx-exporter_rev1.json** file to create a new Jmx prometheus dashboard and select the newly created prometheus datasource.

## Clean Up Prometheus deployment
```console
helm uninstall prometheus -n monitoring
```

## Clean Up JMX Prometheus Operator and ThreadMonitor deployments
```console
./clean-up-threadmonit-and-jmx-prom-operator.sh
```