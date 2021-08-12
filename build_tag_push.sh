#!/bin/bash

TAG=4.0.0
REPO=damiansilbergleithcunniff/node-with-awscli
COMMIT=`git rev-parse HEAD`

docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$TAG
docker push $REPO:$TAG
