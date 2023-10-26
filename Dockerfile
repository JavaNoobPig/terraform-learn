FROM openjdk:8-jre-alpine

EXPOSE 8080

COPY ./target/demohello-0.0.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app

ENTRYPOINT ["java","-jar","demohello-0.0.1-SNAPSHOT.jar"]