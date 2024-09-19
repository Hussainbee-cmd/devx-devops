FROM openjdk:8
EXPOSE 8080
ADD target/devx-devops.jar /app/devx-devops.jar
ENTRYPOINT ["java", "-jar", "devx-devops.jar"]

