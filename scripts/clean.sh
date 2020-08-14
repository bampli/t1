#!/bin/sh

#kubectl delete ns cass-operator
docker stop kind-registry
kind delete cluster --name=kind-cassandra
kind delete cluster --name=kind-registry
docker rm kind-registry
docker rmi $(docker images --filter=reference='localhost:5000/nginx-image' -q)
docker rmi $(docker images --filter=reference='localhost:5000/t1-image' -q)