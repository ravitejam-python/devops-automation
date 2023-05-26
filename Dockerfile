FROM openjdk:11
EXPOSE 8080
ADD target/mynewproject-1.0.0-SNAPSHOT.war artifact-to-build-docker-image
ENTRYPOINT ["java","-war","/artifact-to-build-docker-image"]
