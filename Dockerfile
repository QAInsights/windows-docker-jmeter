# Dockerfile for JMeter for Windows

# Indicates that the windowsservercore along with OpenJDK will be used as the base image.
FROM openjdk:8-windowsservercore

# Metadata indicating an image maintainer.
LABEL maintainer="NaveenKumar Namachivayam" \
      website="www.qainsights.com"

# Downloads JMeter 5.1.1 from one of the mirrors, if you prefer to change, you can change the URL
RUN Invoke-WebRequest -URI 'http://mirrors.ibiblio.org/apache//jmeter/binaries/apache-jmeter-5.1.1.zip' \
-UseBasicParsing -Outfile /apache-jmeter-5.1.1.zip

# Extract the downloaded zip file
RUN Expand-Archive /apache-jmeter-5.1.1.zip -DestinationPath /apache-jmeter-5.1.1

# Copies the entrypoint.ps1
COPY /entrypoint.ps1 /entrypoint.ps1

# Sets the Working directory
WORKDIR /apache-jmeter-5.1.1/apache-jmeter-5.1.1/bin

# Sets a command or process that will run each time a container is run from the new image. For detailed instruction, go to entrypoint.ps1 file.
ENTRYPOINT ["powershell.exe", "/entrypoint.ps1"]
