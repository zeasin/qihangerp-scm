FROM openjdk:17-jdk-slim

WORKDIR /app

#RUN apt-get update; apt-get install libfreetype6 fonts-dejavu fontconfig -y

COPY ./target/vms-api-3.4.8.jar vms-api.jar

#CMD ["java", "-jar", "mms-api.jar"]
CMD ["java", "-Djava.awt.headless=true", "-jar", "vms-api.jar"]