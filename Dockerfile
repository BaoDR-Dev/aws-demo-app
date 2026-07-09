# Giai đoạn 1: Build file .jar bằng Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Giai đoạn 2: Chạy file .jar bằng Java 21
FROM eclipse-temurin:21-jre-jammy
WORKDIR /app
# Copy file jar từ giai đoạn build sang
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
