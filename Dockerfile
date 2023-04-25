from maven as dev
workdir /app
copy . .
run mvn install

from openjdk:11-jre-slim
workdir /app
copy --from=dev /app/target/Uber.jar /app
expose 8099
cmd ["java","-jar","Uber.jar"]
