FROM ubuntu:xenial

RUN apt-get update && apt-get install -y curl logrotate

WORKDIR /tmp
RUN curl -OL https://cloud.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent_6.0.0.381-1_amd64.ubuntu1604.deb && \
    dpkg -i mongodb-mms-monitoring-agent_6.0.0.381-1_amd64.ubuntu1604.deb

RUN curl -OL https://cloud.mongodb.com/download/agent/backup/mongodb-mms-backup-agent_5.9.0.662-1_amd64.ubuntu1604.deb && \
    dpkg -i mongodb-mms-backup-agent_5.9.0.662-1_amd64.ubuntu1604.deb

ADD monitoring-agent.config /etc/mongodb-mms/monitoring-agent.config
ADD backup-agent.config /etc/mongodb-mms/backup-agent.config
