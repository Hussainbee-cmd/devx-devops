FROM openjdk:8
EXPOSE 8080
ADD target/devx-devops.jar /app/devx-devops-pipeline.jar
ENTRYPOINT ["java", "-jar", "devx-devops-pipeline.jar"]

