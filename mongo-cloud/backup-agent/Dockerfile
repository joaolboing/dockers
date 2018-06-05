FROM centos:centos7

RUN yum install logrotate -y && yum clean all

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["mongodb-mms-backup-agent", "-c", "/etc/mongodb-mms/backup-agent.config"]