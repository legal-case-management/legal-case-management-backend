# =========================
# Stage 1: Build ứng dụng
# =========================
FROM gradle:8.5-jdk21 AS build

# Đặt thư mục làm việc
WORKDIR /app

# Copy toàn bộ project vào container
COPY . .

# Build project (tạo file jar trong build/libs)
RUN gradle clean build -x test

# =========================
# Stage 2: Chạy ứng dụng
# =========================
FROM openjdk:21-jdk-slim

# Đặt thư mục làm việc
WORKDIR /app

# Copy file jar từ stage build vào image
COPY --from=build /app/build/libs/*.jar app.jar

# Mở cổng 8080
EXPOSE 8080

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
