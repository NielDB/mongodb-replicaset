#!/bin/bash

kubectl delete clusterrolebinding myname-cluster-admin-binding

helm ls --all --short | xargs -L1 helm delete --purge


kubectl delete crd prometheuses.monitoring.coreos.com
kubectl delete crd prometheusrules.monitoring.coreos.com
kubectl delete crd servicemonitors.monitoring.coreos.com
kubectl delete crd alertmanagers.monitoring.coreos.com


kubectl delete pvc --all 
kubectl delete pv --all

kubectl delete -f ./yaml/gke-sc.yaml

kubectl delete deployments tiller-deploy -n kube-system
