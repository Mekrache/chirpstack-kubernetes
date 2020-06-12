#!/bin/sh

kubectl apply -f config-maps
kubectl apply -f volumes
kubectl apply -f services
kubectl apply -f deployments 
