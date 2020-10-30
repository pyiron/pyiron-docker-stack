#!/bin/bash
# executed from project root

echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/base:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/base:"$TODAY"; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/testing:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/testing:"$TODAY"; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/md:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/md:"$TODAY"; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/pyiron:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/pyiron:"$TODAY"; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/experimental:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/experimental:"$TODAY"; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/damask:latest; fi
if [ "$TRAVIS_BRANCH" = "master" ]; then docker push pyiron/damask:"$TODAY"; fi

docker logout
