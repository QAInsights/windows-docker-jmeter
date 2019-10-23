# Windows Docker Container for Apache JMeter
This repo helps you to run Apache JMeter in your Windows container. It uses the JMeter 5.1.1 on Windows Server Core with OpenJDK.

## Build
If you want to build this image, download this repo and use the below command in docker.

`docker build img_from .`

## How to run JMeter on Windows Container?
First you need to install Docker for Windows. You can use your laptop with Windows 10 Pro or spin up an AWS EC2 instance under free tier. Second, you need compatible Windows version as your base OS. If there is a conflict, you may not be able to run it. 

Use `docker pull qainsights/jmeter511` command to pull the image. This will pull the image from Docker Hub.

Use `docker run qainsights/jmeter511` command to run JMeter inside the container. Below is the sample command which executes the sample JMeter test plan located in the `examples` folder.

`docker run qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l Run1.jtl`

To run in interactive mode, use the below command.

`docker run -it qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l Run1.jtl`

To remove the container once the execution is completed, use the below command.

`docker run -rm qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l Run1.jtl`

If you want to mount your host machine, you can use the below sample command.

`docker run -it -v C:\apache-jmeter-5.1.1\bin\examples:C:\apache-jmeter-5.1.1\apache-jmeter-5.1.1\bin\examples qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l .\examples\Run1Log.jtl`

You can keep your JMeter files in your host machine and pass it to the container for execution. Once the execution is done, you can view the log/jtl files in your host machine.

**Important Notes:**
* make sure you are adding `.\` in front of the folder names, as the entry point leverages powershell. 
* no need to add `jmeter` command, just append `-n -t <yourJMeterTestName>.jmx` file name.
  
## Docker Hub

* https://hub.docker.com/r/qainsights/jmeter511
  
## Thanks
* https://github.com/justb4/docker-jmeter 

## References

* https://docs.docker.com/
* https://docs.microsoft.com/en-us/virtualization/windowscontainers/about/
* http://jmeter.apache.org/
