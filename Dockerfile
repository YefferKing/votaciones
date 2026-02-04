# Etapa 1: Build con Maven
FROM maven:3.8.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Etapa 2: Runtime con Java 17 (Temurin)
FROM eclipse-temurin:17-jre-focal
WORKDIR /app
COPY --from=build /app/target/*.war app.war
EXPOSE 8080
ENTRYPOINT ["java", "-Xmx384m", "-Xms384m", "-jar", "app.war"]
