REM Runs all of our pre-reqs inside of the sandbox to help automate most of the setup
REM The only actions the user will need to take is to toggle the connection to Tor via OnionFruit and then actually running the malware from the desktop
REM Elastic Agent will silently install in the background and connect to our Elastic Cloud instance. I have my policy configured to run the agent in monitor mode so it won't prevent anything from executing
REM Additionally, we're also setting our PowerShell execution policy to a less restrictive setting in the hopes that if the malware runs anything in PowerShell it'll execute successfully so we can see what it's doing
powershell.exe -command "&{Set-ExecutionPolicy RemoteSigned -force}"
powershell.exe -command "Install-PackageProvider -Name NuGet -Force"
powershell.exe -command "Install-Module -Name 7Zip4Powershell -Force"
powershell.exe -command "Start-Process -Wait -FilePath "C:\Users\WDAGUtilityAccount\Work\WindowsSandbox\7z2107-x64.exe" -ArgumentList "/S" -PassThru"
powershell.exe -command "Start-Process -Wait -FilePath "C:\Users\WDAGUtilityAccount\Work\WindowsSandbox\onionfruit.exe" -ArgumentList "/S" -PassThru"
powershell.exe -command "Expand-7Zip -ArchiveFileName C:\Users\WDAGUtilityAccount\Work\WindowsSandbox\malware\infected.zip -Password "infected" -TargetPath C:\Users\WDAGUtilityAccount\Desktop"
powershell.exe -command "Copy-Item "C:\Users\WDAGUtilityAccount\Work\WindowsSandbox\elastic-agent" -Destination "C:\Users\WDAGUtilityAccount\Desktop\elastic-agent" -recurse -Force"
powershell.exe -command "C:\Users\WDAGUtilityAccount\Desktop\elastic-agent\elastic-agent.exe install --url=YOURENROLLMENTURL --enrollment-token=YOURTOKEN -f"
