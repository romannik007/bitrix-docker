FROM centos:7
     ADD https://repo.bitrix.info/yum/bitrix-env.sh /
     RUN yum -y install mc wget
     COPY install.sh /
     RUN chmod +x /bitrix-env.sh /install.sh
     EXPOSE 80
     EXPOSE 443
     EXPOSE 3306
     CMD ["/usr/sbin/init"]
