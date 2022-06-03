FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD  https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.21/bin/apache-tomcat-10.0.21.tar.gz .  
RUN tar -xvzf apache-tomcat-10.0.21.tar.gz
RUN mv apache-tomcat-10.0.21/* /opt/tomcat  
EXPOSE 8080
CMD ["/opt/bin/tomcat/catalina.sh", "run"]
