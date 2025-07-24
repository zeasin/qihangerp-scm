FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./target/store-api-3.0.6.11.jar store-api.jar

CMD ["java", "-Duser.timezone=Asia/Shanghai", "-jar", "store-api.jar"]
