FROM openjdk:8
EXPOSE 8383
ARG JAR_FILE=build/*.jar
COPY ${JAR_FILE} spring-boot-docker-cicd.jar
ENTRYPOINT ["java", "jar", "/spring-boot-docker-cicd.jar"]