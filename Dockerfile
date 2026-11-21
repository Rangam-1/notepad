# Set the base image to java8
FROM eclipse-temurin:8-jdk-alpine

# File Author / Maintainer
MAINTAINER venkatesh

# Define default environment variables


# Create directory
RUN mkdir -p /opt/notepad/bin
RUN mkdir -p /opt/notepad

# Set default directory
WORKDIR /opt/notepad

# Copy notepad jar file
COPY target/*.jar $/opt/notepad/notepad.jar

# Add initialization script
ADD entrypoint.sh /opt/notepad/bin/entrypoint.sh

# Give permissions
RUN chmod 755 /opt/notepad/bin/entrypoint.sh

# Expose default servlet container port
EXPOSE 8080

# Main command
ENTRYPOINT ["/bin/sh", "/opt/notepad/bin/entrypoint.sh"]
