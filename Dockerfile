FROM tomcat
COPY target/Uber.jar /usr/local/tomcat/webapps/Uber.jar
EXPOSE 8080
