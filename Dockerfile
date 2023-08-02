# Use the official GraalVM Docker image as the base image
FROM ghcr.io/graalvm/graalvm-ce:latest

# Set the working directory inside the container
WORKDIR /app

# Install necessary build tools
RUN gu install native-image
COPY src/ /app/src/

# Build the Scala project
RUN native-image -jar /app/src/main/scala/HelloWorldLambda.scala

