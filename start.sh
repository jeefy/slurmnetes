#!/bin/bash

CLUSTER=$(minikube status)
STATUS=$?
if [ "$STATUS" -lt 1 ]; then
  echo "Existing minikube detected.";
  minikube delete
else
  echo "Starting fresh!";
fi

minikube start --memory 8192

helm init; kubectl rollout status -w deployment/tiller-deploy --namespace=kube-system;
sleep 10;

minikube ssh "cd /Users/jeefy/Code/slurmnetes/ && ./build.sh"

helm install --namespace "kube-system" -n "kubernetes" stable/prometheus --set server.service.type=NodePort

kubectl apply -f infrastructure/grafana-configmap.yaml
kubectl apply -f infrastructure/grafana-deployment.yaml
kubectl apply -f infrastructure/grafana-service.yaml

kubectl apply -f infrastructure/es-statefulset.yaml
kubectl apply -f infrastructure/es-service.yaml

kubectl apply -f infrastructure/fluentd-es-configmap.yaml
kubectl apply -f infrastructure/fluentd-es-ds.yaml

kubectl apply -f infrastructure/kibana-deployment.yaml
kubectl apply -f infrastructure/kibana-service.yaml

kubectl apply -f infrastructure/consul-deployment.yaml
kubectl apply -f infrastructure/consul-service.yaml

kubectl apply -f infrastructure/slurmctld-deployment.yaml
kubectl apply -f infrastructure/slurmctld-service.yaml
kubectl apply -f infrastructure/slurmd-deployment.yaml
