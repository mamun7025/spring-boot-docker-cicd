FROM openjdk:8
EXPOSE 8585
ADD build/libs/spring-boot-docker-cicd.jar spring-boot-docker-cicd.jar
ENTRYPOINT ["java", "-jar", "/spring-boot-docker-cicd.jar"]