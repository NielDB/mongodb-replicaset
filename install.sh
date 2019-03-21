#!/bin/bash

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

helm install --name mongodb -f ./yaml/values-production.yaml stable/mongodb

while true; do kubectl get pods; done
