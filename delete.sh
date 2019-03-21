#!/bin/bash

./scripts/del-mongo.sh
kubectl delete -f ./yaml/gke-sc.yaml
kubectl delete deployments tiller-deploy -n kube-system
