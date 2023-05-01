from maven as dev
workdir /app
copy . .
run mvn install

from tomcat
copy --from=dev /app/target/Uber.jar /usr/local/tomcat/webapps/Uber.jar
expose 8008
cmd ["java","-jar","Uber.jar"]
