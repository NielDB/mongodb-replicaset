#!/bin/bash
helm del --purge mongodb
kubectl delete pvc --all 
kubectl delete pv --all
