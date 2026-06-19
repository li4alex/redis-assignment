#!/bin/bash

set -e

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

kubectl apply -f "$PROJECT_ROOT/k8s/redis-configmap.yaml"
kubectl apply -f "$PROJECT_ROOT/k8s/redis-secret.yaml"
kubectl apply -f "$PROJECT_ROOT/k8s/redis-pvc.yaml"

kubectl apply -f "$PROJECT_ROOT/k8s/redis-deployment.yaml"
kubectl apply -f "$PROJECT_ROOT/k8s/redis-service.yaml"

kubectl apply -f "$PROJECT_ROOT/k8s/deployment.yaml"
kubectl apply -f "$PROJECT_ROOT/k8s/service.yaml"

kubectl apply -f "$PROJECT_ROOT/k8s/ingress.yaml"

echo "Deployment completed."
