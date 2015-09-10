#!/usr/bin/env bash

docker build --no-cache -t statuspage-notification-resource .
docker tag -f statuspage-notification-resource teamidefix/statuspage-notification-resource
docker push teamidefix/statuspage-notification-resource
