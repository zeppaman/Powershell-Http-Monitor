# Powershell Http Monitor Tool
This is a Powershell tool for monitoring a set of http hosts that logs into MSSQL database. 

## Why a Powershell tool to Monitor Http resources
This tool need as a swiss knife for monitoring websites without using external service or installing complex softwares. It may be needed to monitor some site, also for testing\debugging purpouses and you don't want to spend too much time adopting huge tools. Or you may need a monitor tool that can be customized to collect complex statistics or add business login into monitor.

## How it works
Because this project is build trying to keep it as much simple as possible, it is just a simple power shell script. This means you'll just have to *download a single file and run*. No worry about install process, download frameworks or prerequisites. Just download and run. Easy right? This will install you powershell as a windows service. All settings can be tuned directly into the script or using an external config file. Once service is running, he periodically reload the website list and try to call each entry, saving result into database.

## How to install
Simply, Powershell Http Monitor tool has two possible usage.

### Run once
Running this command the script read all websites, try to call them and finally download results into MSSQL database or log files. This usage mode desn't require any installation. It may be also scheduled using windows scheduled tasks.

```powershell
  Http-Monitor -Run
```
### Run as scheduled task
It is very easy to configure. Key settings:

1. run it every 5 minute (or other interval)
2. set the script path
3. tell to scheduler to do not start multiple instances

See screeshot for all steps:
Inline-style: 
![Create a new scheduled task for Http monitoring tool](https://github.com/zeppaman/Powershell-Http-Monitor/blob/master/doc/scheduled_1.png?raw=true "Create a new scheduled task for Http monitoring tool")


### Run as service
This install the powershell script as service.

```powershell
  
  PS > Http-Monitor -Setup


  #once it is installed you can control using script or service.mmc
  PS >  Http-Monitor -Start
  PS >  Http-Monitor -Stop
```

## Configure
As Powershell Http Monitor is a dry application, with no UI, configuration is the most tricky part, but at the end there are few things to learn.

1. Application settings: this can be edited inside the main application script or using external script. 
2. Input: there is a text file with one host for each row.

### Application settings

### Input file
The file path must match application settings path. The file must contain the list of websites, with http or https prefix. This is usually a list of homepages but, by design Power Shell Monitoring Tool can accept any other url.

## Generate website list from IIS 
This may be useful to monitor all sites into one iis server. To do this it is needed to use appcmd command to dump binding into a text file. It is easy to process using regexp to translate into a list of site url.

## Settings
You can configure application settings in two ways:
1. editing script inline (see section "Application settings")
2. manage settings in a separate files (recommended). Application looks for "settings.ps1" file into app directory and overwrite default settings with that one.

You can copy settings remaning it correctly [download file](https://raw.githubusercontent.com/zeppaman/Powershell-Http-Monitor/master/src/sample.settings.ps1)

Settings are very easy to undestand and with some attention you will be able to get the right tuning.


```powershell
  

######################################
#
# Application Settings
#
######################################


# DB SETTINGS
# -----------------------------------   
$writeToDB= $true # enable or disable db logging
$DBServer = "(localdb)\Projects" # MSSQL host, usully .\SQLEXPRESS, .\SQLSERVER 
$DBName = "httpstatus" # name of db.(HAVE TO BE CREATED)
$ConnectionString = "Server=$DBServer;Database=$DBName;Integrated Security=True;" # full connection string. Write here password if not in integrated security

# EMAIL SETTINGS
# -----------------------------------
$sendEmail=$true  #enable email send
$emailErrorCodes=500,200 # list of status codes that produces error
$emailFrom="Http Monitor Tool <no-reply@my-address-email.io>"
$emailTo="Me <destination email@my-address-email.io>"
$smtpServer="127.0.01"  #smtp server. To use autenticated smtp server you have to change Do-Monitor function.
$errorSubject="Http-Monitor:  Get Error on site" # subject of email notification
$errorBody="Monitoring script get an errror. See details." #subject of error body

# MONITOR SETTINGS
# ----------------------------------   
$dbpath=$workingPath+"\db.txt"  # db of web sites to monitor. One per line. Must have protocol predix. i.e. http://www.google.it
$monitoring= @() # list of ips to monitor. This is used to focus ips on some destination only "8.8.8.8","4.4.4.4"
$userAgent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome  #agent used to download files
$delay=5  # number of seconds to wait between checking website inside a full run (used to avoid server overload)
$delayIteration=100 # number of seconds between checks ( once I checked all sites, I wait this time before a full control)

# LOGGING FILES
# ----------------------------------
$traceFile=$workingPath+"\tomonitor.txt" # log of monitored sites
$errorFile=$workingPath+"\error.txt" # error only file
$outFile=$workingPath+"\out.txt" # full log file

```

### License

  
