#---------------------------------------------------------------------------
#COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
#COPY context.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
#COPY manager-context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
#---------------------------------------------------------------------------

##############################################################################
##############################################################################
############# Centos  8.3.2011                                   #############
############# Tomcat 9.0.44                                      #############
############# JAVA ORACLE JDK 8.281                              #############
##############################################################################
##############################################################################

FROM centos:8.3.2011
RUN cat /etc/centos-release
LABEL maintainer="helpdesk@itsvil.it"
ARG TOMCAT_HOME="/usr/local/tomcat"
ENV JAVA_HOME="/usr/java/jdk1.8.0_281-amd64"
RUN mkdir ${TOMCAT_HOME}/

##INSTALL JAVA ORACLE JDK 8.281
COPY jdk-8u281-linux-x64.rpm /tmp/jdk-8u281-linux-x64.rpm
RUN chmod +x /tmp/jdk-8u281-linux-x64.rpm && yum -y install /tmp/jdk-8u281-linux-x64.rpm && rm /tmp/jdk-8u281-linux-x64.rpm
RUN ls /usr/java/jdk1.8.0_281-amd64/jre/bin/

##INSTALL TOMCAT 9.0.44
COPY apache-tomcat-9.0.44.tar.gz /tmp/apache-tomcat-9.0.44.tar.gz
RUN cd /tmp && tar xvzf apache*.tar.gz && mv apache-tomcat-9.0.44/* ${TOMCAT_HOME}/. && rm /tmp/apache-tomcat-9.0.44.tar.gz


WORKDIR ${TOMCAT_HOME}

#Libreria postgres
ADD postgresql-42.2.1.jar ${TOMCAT_HOME}/lib/

COPY tomcat-users.xml ${TOMCAT_HOME}/conf/tomcat-users.xml
COPY context.xml ${TOMCAT_HOME}/host-manager/META-INF/context.xml
COPY manager-context.xml ${TOMCAT_HOME}/webapps/manager/META-INF/context.xml

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]