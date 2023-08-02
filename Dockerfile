# Use the official GraalVM Docker image as the base image
FROM ghcr.io/graalvm/graalvm-ce:latest

# Set the working directory inside the container
WORKDIR /app

# Install necessary build tools
RUN gu install native-image

# Install unzip and curl using the GraalVM utility
RUN gu install native-image
RUN microdnf install unzip curl

# Set the working directory to the cloned project
WORKDIR /app/scala-test-api-repo

# Download and install SBT
RUN curl -L -o sbt-1.5.5.zip https://github.com/sbt/sbt/releases/download/v1.5.5/sbt-1.5.5.zip && \
    unzip sbt-1.5.5.zip && \
    mv sbt /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt

# Build the Scala project with GraalVM native-image
RUN sbt assembly
RUN native-image -jar target/scala-2.13/scala-test-api-repo-assembly.jar

# Set the command to run your native image Lambda function
CMD ["./scala-test-api-repo-assembly"]
