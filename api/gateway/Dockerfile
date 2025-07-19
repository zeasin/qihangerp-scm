FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./target/gateway-1.0.0.jar gateway.jar

CMD ["java", "-jar", "gateway.jar"]