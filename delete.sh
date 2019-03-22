#!/bin/bash

kubectl delete clusterrolebinding myname-cluster-admin-binding

./scripts/del-mongo.sh
kubectl delete -f ./yaml/gke-sc.yaml
kubectl delete deployments tiller-deploy -n kube-system
