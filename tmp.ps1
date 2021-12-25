$JMETER_VERSION='5.4.3'

# Downloading CMD Runner
Invoke-WebRequest -URI http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.3/cmdrunner-2.3.jar `
-UseBasicParsing -Outfile 'C:\apache-jmeter-$JMETER_VERSION\apache-jmeter-$JMETER_VERSION\lib\cmdrunner-2.3.jar'

Write-Output "Downloaded CMD Runner"

# Downloading JMeter Plugins Manager
Invoke-WebRequest -URI https://jmeter-plugins.org/get/ `
-UseBasicParsing -Outfile 'C:\apache-jmeter-$JMETER_VERSION\apache-jmeter-$JMETER_VERSION\lib\ext\jmeter-plugins-manager-1.7.jar'

Write-Output "Downloaded Plugins Manager"

# Changing directory
Set-Location C:\apache-jmeter-$JMETER_VERSION\apache-jmeter-$JMETER_VERSION

# Generating bat file for JMeter plugins
java -cp .\lib\ext\jmeter-plugins-manager-1.7.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

Write-Output "Generated Plugins Manager bat file"

# Changing directory
Set-Location C:\apache-jmeter-$JMETER_VERSION\apache-jmeter-$JMETER_VERSION\

# Executing and installing plugins
java -jar ".\lib\cmdrunner-2.3.jar" --tool org.jmeterplugins.repository.PluginManagerCMD install bzm-parallel=0.9

# Installing Plugins
# .\bin\PluginsManagerCMD.bat install bzm-parallel=0.9, `
# jpgc-csl=0.1

Write-Output "Plugin installation complete."