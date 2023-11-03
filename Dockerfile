FROM maven:3.9.4-eclipse-temurin-17 AS build

ARG DB_URL=${DB_URL}
ARG DB_USERNAME=${DB_USERNAME}
ARG UPLOAD_PATH=${UPLOAD_PATH}
ARG DB_PASSWORD=${DB_PASSWORD}

WORKDIR /project

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ /project/src

RUN mvn clean package

FROM openjdk:17-alpine

RUN mkdir /app

RUN addgroup -g 1001 -S cardinal

RUN adduser -S cardinalgroup -u 1001

COPY --from=build /project/target/*.jar /app/app.jar

WORKDIR /app


EXPOSE 8000
ARG DB_URL=${DB_URL}
ARG DB_USERNAME=${DB_USERNAME}
ARG DB_PASSWORD=${DB_PASSWORD}
ARG UPLOAD_PATH=${UPLOAD_PATH}

CMD java $JAVA_OPTS -jar app.jar