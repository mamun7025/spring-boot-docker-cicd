# our base image
FROM openjdk:8

# tell the port number the container should expose
EXPOSE 9606

# copy files required for the app to run
ADD build/libs/spring-boot-docker-cicd.jar spring-boot-docker-cicd.jar

# run the application
ENTRYPOINT ["java", "-jar", "/spring-boot-docker-cicd.jar"]