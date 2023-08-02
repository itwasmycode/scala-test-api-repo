# Use the official GraalVM Docker image as the base image
FROM ghcr.io/graalvm/graalvm-ce:latest

# Set the working directory inside the container
WORKDIR /app

# Install unzip and curl using the GraalVM utility
RUN gu install native-image
RUN microdnf install unzip curl

# Copy the Scala project files into the container
COPY build.sbt /app/
COPY src/ /app/src/

# Download and install SBT
RUN curl -L -o sbt-1.5.5.zip https://github.com/sbt/sbt/releases/download/v1.5.5/sbt-1.5.5.zip && \
    unzip sbt-1.5.5.zip && \
    mv sbt /usr/local && \
    ln -s /usr/local/sbt/bin/sbt /usr/local/bin/sbt

# Download project dependencies using SBT
RUN sbt update

# Build the Scala project with GraalVM native-image
RUN sbt assembly
RUN native-image -jar target/scala-2.13/scala-auth-api-assembly.jar

# Set the command to run your native image Lambda function
CMD ["./scala-auth-api-assembly"]