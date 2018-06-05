FROM centos:centos7

RUN yum install logrotate -y && yum clean all

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["mongodb-mms-monitoring-agent", "-conf", "/etc/mongodb-mms/monitoring-agent.config"]
