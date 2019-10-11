# JMeter Docker for Windows
This repo helps you to run Apache JMeter in your Windows container. It uses the JMeter 5.1.1 on Windows Server Core with OpenJDK.

## How to run JMeter on Windows Container?
First you need to install Docker for Windows. Second, you need compatible Windows version as your base OS. If there is a conflict, you may not be able to run it. 

Use `docker pull qainsights/jmeter511` command to pull the image. 

Use `docker run qainsights/jmeter511` command to run JMeter inside the container. Below is the sample command which executes the sample JMeter test plan located in the `examples` folder.

`docker run qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l Run1.jtl`

If you want to mount your host machine, you can use the below sample command.

`docker run -it -v C:\apache-jmeter-5.1.1\bin\examples:C:\apache-jmeter-5.1.1\apache-jmeter-5.1.1\bin\examples qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l .\examples\Run1Log.jtl`

You can keep your JMeter files in your host machine and pass it to the container for execution. Once the execution is done, you can view the log/jtl files in your host machine.

**Important Notes:**
* make sure you are adding .\ in front of folder names, as the entry point leverages PowerShell. 
* no need to add `jmeter` command, just append -n -t <yourJMeterTestName>/jmx file name.
  
```docker
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
```
