#!/bin/bash -e
set -o pipefail

if [ "$TRAVIS_BRANCH" = "master" ] && [ "$TRAVIS_PULL_REQUEST" = "false" ]  && [ "$TRAVIS_NODE_VERSION" = "5.1" ]
then
  git config --global user.email "sbeleidy90@gmail.com"
  git config --global user.name "auto deployer"

  polymer build
  firebase deploy --token "$FIREBASE_TOKEN" -m "Auto Deployed by Travis CI"

fi