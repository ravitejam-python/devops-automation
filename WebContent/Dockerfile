FROM openjdk:11
EXPOSE 8080
ADD target/mynewproject-1.0.0-SNAPSHOT.war mynewproject-1.0.0-SNAPSHOT.war
ENTRYPOINT ["java","-war","/mynewproject-1.0.0-SNAPSHOT.war"]