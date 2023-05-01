from tomcat
copy target/Uber.jar /usr/local/tomcat/webapps/Uber.jar
expose 8080
cmd ["java","-jar","Uber.jar"]
