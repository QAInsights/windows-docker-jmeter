# JMeter Docker for Windows
This repo helps you to run Apache JMeter in your Windows container. It uses the JMeter 5.1.1 on Windows machine with OpenJDK.

## How to run JMeter on Windows Container?
First you need to install Docker for Windows. Second, you need compatible Windows version as your base OS. If there is a conflict, you may not be able to run it. 

Use `docker pull qainsights/jmeter511` command to pull the image. 

Use `docker run qainsights/jmeter511` command to run JMeter inside the container. Below is the sample command which executes the sample JMeter test plan located in the `examples` folder.

`docker run qainsights/jmeter511 -n -t .\examples\CSVSample.jmx -l Run1.jtl`
