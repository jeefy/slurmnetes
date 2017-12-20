#!/bin/bash

kubectl apply -f infrastructure/sshd-configmap.yaml
kubectl apply -f infrastructure/sshd-wrapper-configmap.yaml
kubectl delete deployment/sshd
kubectl apply -f infrastructure/sshd-deployment.yaml
