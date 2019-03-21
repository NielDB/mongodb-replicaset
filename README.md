# mongodb-replicaset

Deploys a bitnami mongodb stack in kubernetes using a replicaset for persistent volumes.

MongoDB gets installed using the helm chart found in [values-production.yaml](./yaml/values-production.yaml).
Multiple parameters can be configured in this values file. 

To access the MongoDB container, run `kubectl run --namespace default mongodb-client --rm --tty -i --image bitnami/mongodb --command -- mongo admin --host mongodb -u root -p $PASSWORD`.
