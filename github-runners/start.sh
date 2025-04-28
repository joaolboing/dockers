#!/bin/bash

ORGANIZATION=$ORGANIZATION
ACCESS_TOKEN=$ACCESS_TOKEN

REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)

cd /home/ec2-user

./config.sh --unattended --replace --url https://github.com/${ORGANIZATION} --token ${REG_TOKEN}

mkdir -p /home/ec2-user/.docker
cp /tmp/config/config.json /home/ec2-user/.docker/config.json

cp /usr/bin/meteor /home/ec2-user/.meteor/meteor

cleanup() {
    echo "Removing runner..."
    REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!