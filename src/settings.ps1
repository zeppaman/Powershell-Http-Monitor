### Settings here override main script



# DB SETTINGS
# -----------------------------------   
$writeToDB= $false # enable or disable db logging
$DBServer = "(localdb)\Projects" # MSSQL host, usully .\SQLEXPRESS, .\SQLSERVER 
$DBName = "httpstatus" # name of db.(HAVE TO BE CREATED)
$ConnectionString = "Server=$DBServer;Database=$DBName;Integrated Security=True;" # full connection string. Write here password if not in integrated security

# EMAIL SETTINGS
# -----------------------------------
$sendEmail=$false  #enable email send
$emailErrorCodes=500,200 # list of status codes that produces error
$emailFrom="Http Monitor Tool <no-reply@my-address-email.io>"
$emailTo="Me <destination email@my-address-email.io>"
$smtpServer="127.0.01"  #smtp server. To use autenticated smtp server you have to change Do-Monitor function.

# MONITOR SETTINGS
# ----------------------------------   
$dbpath=$workingPath+"\db.txt"  # db of web sites to monitor. One per line. Must have protocol predix. i.e. http://www.google.it
$monitoring= @() # list of ips to monitor. This is used to focus ips on some destination only "8.8.8.8","4.4.4.4"
$userAgent = [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome  #agent used to download files
$delay=5  # number of seconds to wait between checking website inside a full run (used to avoid server overload)
$delayIteration=30 # number of seconds between checks ( once I checked all sites, I wait this time before a full control)

# LOGGING FILES
# ----------------------------------
$traceFile=$workingPath+"\tomonitor.txt" # log of monitored sites
$errorFile=$workingPath+"\error.txt" # error only file
$outFile=$workingPath+"\out.txt" # full log file