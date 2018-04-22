#!/bin/bash

# TODO parameterize

while ! nc -z buildbot-master 9989; do
  echo "Waiting for buildbot-master:9989..."
  sleep 2
done

echo "Ready. Continuing."