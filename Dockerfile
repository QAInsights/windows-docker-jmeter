# Sample Dockerfile

# Indicates that the windowsservercore image will be used as the base image.
FROM openjdk:8-windowsservercore

# Metadata indicating an image maintainer.
LABEL maintainer="naveenkumar"

# Creates an HTML file and adds content to this file.
RUN Invoke-WebRequest -URI 'http://mirrors.ibiblio.org/apache//jmeter/binaries/apache-jmeter-5.1.1.zip' \
-UseBasicParsing -Outfile /apache-jmeter-5.1.1.zip

RUN Expand-Archive /apache-jmeter-5.1.1.zip -DestinationPath /apache-jmeter-5.1.1

COPY /entrypoint.ps1 /entrypoint.ps1

WORKDIR /apache-jmeter-5.1.1/apache-jmeter-5.1.1/bin

# Sets a command or process that will run each time a container is run from the new image.

ENTRYPOINT ["powershell.exe", "/entrypoint.ps1"]
