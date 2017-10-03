FROM postgres:9.6

RUN apt-get update && \ 
	apt-get install -y awscli && \ 
	apt-get autoclean && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh

RUN chmod +x /run.sh
CMD ["/run.sh"]
