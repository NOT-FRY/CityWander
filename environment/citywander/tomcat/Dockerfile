##############################################################################
##############################################################################
############# oraclelinux  8                                   	 #############
############# Tomcat 9.0.44                                      #############
############# JAVA JDK jdk-11.0.18                              #############
##############################################################################
##############################################################################

FROM oraclelinux:8
#RUN cat /etc/centos-release
LABEL maintainer="helpdesk@itsvil.it"
ARG TOMCAT_HOME="/usr/local/tomcat"
ENV JAVA_HOME="/usr/java/jdk-11"
##Tomcat Debug
#ENV JPDA_ADDRESS 8000
ENV JAVA_TOOL_OPTIONS -agentlib:jdwp=transport=dt_socket,address=*:8000,server=y,suspend=n
RUN mkdir ${TOMCAT_HOME}/

##INSTALL JAVA JDK 11
COPY jdk-11.0.18_linux-x64_bin.rpm /tmp/jdk-11.0.18_linux-x64_bin.rpm
RUN chmod +x /tmp/jdk-11.0.18_linux-x64_bin.rpm && yum -y install /tmp/jdk-11.0.18_linux-x64_bin.rpm && rm /tmp/jdk-11.0.18_linux-x64_bin.rpm
RUN ls /usr/java/jdk-11/bin/

##INSTALL TAR
RUN yum -y install tar

##INSTALL TOMCAT 9.0.44
COPY apache-tomcat-9.0.44.tar.gz /tmp/apache-tomcat-9.0.44.tar.gz
RUN cd /tmp && tar xvzf apache*.tar.gz && mv apache-tomcat-9.0.44/* ${TOMCAT_HOME}/. && rm /tmp/apache-tomcat-9.0.44.tar.gz

WORKDIR ${TOMCAT_HOME}

#Libreria postgres
ADD postgresql-42.2.1.jar ${TOMCAT_HOME}/lib/

COPY tomcat-users.xml ${TOMCAT_HOME}/conf/tomcat-users.xml
COPY context.xml ${TOMCAT_HOME}/host-manager/META-INF/context.xml
COPY manager-context.xml ${TOMCAT_HOME}/webapps/manager/META-INF/context.xml
COPY web.xml ${TOMCAT_HOME}/webapps/manager/WEB-INF/web.xml

EXPOSE 8080

#CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
##Tomcat Debug
#CMD ["/usr/local/tomcat/bin/catalina.sh", "jpda", "run"]
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]