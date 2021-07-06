#!/bin/bash

TIMESTAMP=$(date +%F_%H-%M-%S)

docker build -t my-app:latest-$TIMESTAMP ../

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 579332302665.dkr.ecr.us-east-1.amazonaws.com
docker tag my-app:latest-$TIMESTAMP 579332302665.dkr.ecr.us-east-1.amazonaws.com/my-app:latest-$TIMESTAMP
docker push 579332302665.dkr.ecr.us-east-1.amazonaws.com/my-app:latest-$TIMESTAMP