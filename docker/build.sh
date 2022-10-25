#!/bin/bash

docker build -t curl-impersonate .

docker stop extract
docker rm extract
docker create --name extract curl-impersonate
docker cp extract:/curl-impersonate.tar.gz .
docker rm extract
