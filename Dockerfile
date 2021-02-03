FROM centos:centos7

ARG PUID=2000

RUN yum -y install wget &&\
	yum -y install epel-release &&\
	yum -y install nginx &&\
	yum clean all -y

RUN useradd -u ${PUID} -g root minio-client

RUN mkdir -p /var/cache/nginx

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx	

USER 2000

RUN cd /home/minio-client &&\
	wget https://dl.minio.io/client/mc/release/linux-amd64/mc &&\
	chmod +x /home/minio-client/mc

COPY entrypoint.sh /home/minio-client/entrypoint.sh

RUN chmod +x /home/minio-client/entrypoint.sh

WORKDIR /home/minio-client

CMD ["/bin/bash","-c","/home/minio-client/entrypoint.sh"]