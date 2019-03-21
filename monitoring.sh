#!/bin/bash

kubectl create -f ./yaml/monitoring/
kubectl create configmap grafana-config --from-file=./grafanaConfigurations -n kube-system
