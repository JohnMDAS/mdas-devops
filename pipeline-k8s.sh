#!/bin/bash

docker-compose rm -f &&\
docker-compose up --build -d &&\
docker-compose run --rm mytest &&\
docker-compose push &&\
echo "GREEN" || echo "RED"

#deploy
kubectl apply -f votingapp.yaml

kubectl run votingapptestpod \
	--generator=run-pod/v1 \
	--image=john/votingapp-test myvotingapp  \
	--env=VOTINGAPP_HOST=myvotingapp.votingapp \
	--rm \
	--attach \
	--restart=Never