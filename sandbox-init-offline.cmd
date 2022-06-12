REM Installs 7-zip silently as we'll probably need it if we're working with password-protected zip files 
REM Copies the folder with all of our tools in it to the desktop for ease-of-access
REM Additionally, we're also setting our PowerShell execution policy to a less restrictive setting in the hopes that if the malware runs anything in PowerShell it'll execute successfully so we can see what it's doing
powershell.exe -command "&{Set-ExecutionPolicy RemoteSigned -force}"
powershell.exe -command "Start-Process -Wait -FilePath "C:\Users\WDAGUtilityAccount\Work\WindowsSandbox\7z2107-x64.exe" -ArgumentList "/S" -PassThru"
powershell.exe -command "Copy-Item "C:\Users\WDAGUtilityAccount\Work\WindowsSandbox" -Destination "C:\Users\WDAGUtilityAccount\Desktop\SandboxFiles" -recurse -Force"