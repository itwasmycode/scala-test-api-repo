# Use the multi-platform OpenJDK 11 image as the builder
FROM adoptopenjdk:11-jdk-hotspot AS builder

# Copy the source code and build the application
COPY . /lambda/src/
WORKDIR /lambda/src/
RUN ./sbt assembly

# Use the multi-platform Amazon Corretto 11 image as the runtime
FROM public.ecr.aws/lambda/java:11

# Copy the built JAR from the builder
COPY --from=builder /lambda/src/target/function.jar ${LAMBDA_TASK_ROOT}/lib/

# Set the entrypoint for the Lambda function
CMD ["LambdaHandler::LambdaHandler"]
