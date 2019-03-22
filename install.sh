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


helm install -f ./yaml/monitoring/prometheus-operator-chart.yaml stable/prometheus-operator --name prometheus-operator --namespace monitoring

helm install -f ./yaml/monitoring/exporter-chart.yaml --name prometheus-mongodb-exporter stable/prometheus-mongodb-exporter --namespace monitoring


helm install --name mongodb -f ./yaml/values-production.yaml stable/mongodb

while true; do kubectl get pods; done
