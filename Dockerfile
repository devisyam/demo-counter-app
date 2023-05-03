FROM tomcat:9.0-jdk11-openjdk
WORKDIR $CATALINA_HOME/webapps/
COPY target/Uber.jar /usr/local/tomcat/webapps/Uber.jar
EXPOSE 8080
CMD ["catalina.sh", "run"]
