#!/bin/bash

kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=`gcloud info --format='value(config.account)'`

kubectl create -f ./yaml/gke-sc.yaml
./scripts/helm.sh

TILLERSTATUS=2

while [[ ${TILLERSTATUS} != "1" ]]
do

  if [ ${TILLERSTATUS} = 2 ]
  then
    printf "\nWaiting for tiller\n"
  fi

  TILLERSTATUS="$(kubectl get deployment tiller-deploy -n kube-system | tail -n +2 | awk '{print $5}')"

done

printf "\nTiller ready\n"

helm install -f ./yaml/monitoring/prometheus-operator-chart.yaml stable/prometheus-operator --name postack --namespace monitoring

sleep 5

helm install -f ./yaml/values-production.yaml stable/mongodb --name mongodb

while true; do kubectl get pods; done
