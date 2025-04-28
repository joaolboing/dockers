# base
FROM ubuntu:22.04


ARG DOCKER_GROUP=992
ENV DOCKER_GROUP=$DOCKER_GROUP
ARG RUNNER_USER="ec2-user"
ENV RUNNER_USER=$RUNNER_USER
ARG USER="ec2-user"
ENV USER=$USER
ARG LANG="C.UTF-8"
ENV LANG=$LANG


RUN apt update && apt install -y curl jq make bzip2 python2 g++

# update the base packages and add a non-sudo user
RUN groupadd -g ${DOCKER_GROUP} docker && apt-get update -y --fix-missing && apt-get upgrade -y && useradd -mg ${DOCKER_GROUP} ${USER}

# *  Setup docker
RUN curl -fSL get.docker.com | sh
RUN usermod -aG docker ${USER}

# cd into the user directory, download and unzip the github actions runner
WORKDIR /home/${USER}

# set the github runner version
ARG RUNNER_VERSION="2.316.0"

RUN curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && rm ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# install some additional dependencies
RUN chown -R ${USER} /home && /home/${USER}/bin/installdependencies.sh
# copy over the start.sh script
COPY start.sh start.sh
RUN chmod +x start.sh
RUN apt-get autoremove --purge
# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user

# install meteor
RUN curl https://install.meteor.com/ | sh
RUN cp "/root/.meteor/packages/meteor-tool/2.15.0/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor


USER ${USER}



ENV NODE_TLS_REJECT_UNAUTHORIZED=0
# set the entrypoint to the start.sh script
ENTRYPOINT ["./start.sh"]