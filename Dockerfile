# Etapa 1: Build con Maven
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Runtime con Java 17
FROM openjdk:17-jdk-slim
WORKDIR /app
# El pom indica que el packaging es 'war', pero Spring Boot puede ejecutarlo con java -jar
COPY --from=build /app/target/*.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.war"]
