#!/bin/bash
minikube start --nodes=2 --cpus=4 --memory=8192
kubectl apply -f ../containers/k8s