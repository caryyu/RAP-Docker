FROM tomcat:8.0-jre8
#设置时区与语言
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/TZ /etc/localtime && echo TZ /etc/localtime && echo TZ > /etc/timezone
ADD ./RAP-0.14.3-SNAPSHOT.war /usr/local/tomcat/webapps
RUN rm -rf /usr/local/tomcat/webapps/ROOT
RUN mv /usr/local/tomcat/webapps/RAP-0.14.3-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
