FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y \
    openjdk-17-jdk \
    maven \
    curl \
    git \
    && apt-get clean
WORKDIR /app
COPY . .
RUN mvn clean package
EXPOSE 8080
CMD ["java", "-jar", "target/hello-world-1.0-SNAPSHOT.jar"]
