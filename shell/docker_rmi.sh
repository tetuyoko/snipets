#!/bin/sh

docker images | grep nginx | awk '{print $3}' | xargs docker rmi
