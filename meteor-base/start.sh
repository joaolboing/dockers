#!/bin/bash

if [ ! -f /home/node/.meteor/meteor ]; then
  curl https://install.meteor.com/?release=${METEOR_VERSION} | sh
fi

meteor $@