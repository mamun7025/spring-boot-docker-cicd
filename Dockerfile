FROM openjdk:8
EXPOSE 8383
ADD build/lib/spring-boot-docker-cicd.jar spring-boot-docker-cicd.jar
ENTRYPOINT ["java", "-jar", "/spring-boot-docker-cicd.jar"]