# Powershell Http Monitor Tool
This is a Powershell tool for monitoring a set of http hosts that logs into MSSQL database. 

## Why
This tool need as a swiss knife for monitoring websites without using external service or installing complex softwares. It may be needed to monitor some site, also for testing\debugging purpouses and you don't want to spend too much time adopting huge tools. Or you may need a monitor tool that can be customized to collect complex statistics or add business login into monitor.

## How it works
Because this project is build trying to keep it as much simple as possible, it is just a simple power shell script. This means you'll just have to *download a single file and run*. No worry about install process, download frameworks or prerequisites. Just download and run. Easy right? This will install you powershell as a windows service. All settings can be tuned directly into the script or using an external config file. Once service is running, he periodically reload the website list and try to call each entry, saving result into database.

## How to install
Simply, Powershell Http Monitor tool has two possible usage.

### Run once
Running this command the script read all websites, try to call them and finally download results into MSSQL database or log files. This usage mode desn't require any installation. It may be also scheduled using windows scheduled tasks.

```powershell
  Http-Monitor-Tool -Run
```

### Run as service
This install the powershell script as service.

```powershell
  
  PS > Http-Monitor-Tool -Setup


  #once it is installed you can control using script or service.mmc
  PS >  Http-Monitor-Tool -Start
  PS >  Http-Monitor-Tool -Stop
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

### License

  
