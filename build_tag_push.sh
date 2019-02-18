#!/bin/bash

TAG=2.0.0.3
REPO=damiansilbergleithcunniff/node-with-awscli
COMMIT=`git rev-parse HEAD`

docker build -f Dockerfile -t $REPO:$COMMIT .
docker tag $REPO:$COMMIT $REPO:$TAG
docker push $REPO
