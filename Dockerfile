FROM centos:centos7

RUN yum -y install wget &&\
	yum clean all -y

RUN groupadd minio-client &&\
    useradd -g minio-client minio-client

USER minio-client

RUN cd /home/minio-client &&\
	wget https://dl.minio.io/client/mc/release/linux-amd64/mc &&\
	chmod +x /home/minio-client/mc

COPY entrypoint.sh /home/minio-client/entrypoint.sh

RUN chmod +x /home/minio-client/entrypoint.sh

RUN chmod 777 -R /home/minio-client

WORKDIR /home/minio-client

ENTRYPOINT [ "/home/minio-client/entrypoint.sh" ]