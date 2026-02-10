# Stage 1: Build ứng dụng bằng Gradle
FROM gradle:8.10.2-jdk21 AS build
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Build ứng dụng (skip test cho nhanh)
RUN gradle clean bootJar -x test

# Stage 2: Runtime
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copy file jar từ stage build
COPY --from=build /app/build/libs/*.jar app.jar

# Render sẽ map PORT qua biến môi trường, nên ta expose biến này
EXPOSE 8080

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
