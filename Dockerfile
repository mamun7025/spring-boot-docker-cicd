FROM openjdk:8
EXPOSE 8181
ADD build/libs/springbootcicddocker.jar spring-boot-docker-cicd.jar
ENTRYPOINT ["java", "jar", "/spring-boot-docker-cicd.jar"]