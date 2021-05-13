FROM centos:centos7

RUN yum -y install wget &&\
	yum -y install epel-release &&\
	yum -y install nginx &&\
	yum clean all -y

RUN rm -rf /etc/nginx/nginx.conf

COPY nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/cache/nginx

# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  &&\
    chmod -R g+w /etc/nginx

RUN mkdir -p /opt/minio-client &&\
	cd /opt/minio-client &&\
	wget https://dl.minio.io/client/mc/release/linux-amd64/mc

COPY entrypoint.sh /opt/minio-client/entrypoint.sh

RUN chmod +x /opt/minio-client/entrypoint.sh

RUN chgrp -R 0 /opt/minio-client && \
	chmod -R g+rwx /opt/minio-client

EXPOSE 9000

WORKDIR /opt/minio-client

CMD ["/bin/bash","-c","/opt/minio-client/entrypoint.sh"]