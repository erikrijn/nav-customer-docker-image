# Restore custom database to databases folder
$SqlServiceName = 'MSSQL$SQLEXPRESS'
$SqlWriterServiceName = "SQLWriter"
$SqlBrowserServiceName = "SQLBrowser"

$databaseName = "$env:databaseName"
$bak = (Get-ChildItem -Path "C:\Custom\Backup\*.bak")[0]
$databaseFile = $bak.FullName
$SqlTimeout = "300"

$serviceTierFolder = (Get-Item "C:\Program Files\Microsoft Dynamics NAV\*\Service").FullName
$databaseServer = "localhost"
$databaseInstance = "SQLEXPRESS"
$databaseFolder = "c:\databases"
if (!(Test-Path -Path $databaseFolder -PathType Container)) {
    New-Item -Path $databaseFolder -itemtype Directory | Out-Null
}

# start the SQL Server
Write-Host "Starting Local SQL Server"
Start-Service -Name $SqlBrowserServiceName -ErrorAction Ignore
Start-Service -Name $SqlWriterServiceName -ErrorAction Ignore
Start-Service -Name $SqlServiceName -ErrorAction Ignore

Import-Module "$serviceTierFolder\Microsoft.Dynamics.Nav.Management.psm1"

Write-Host "Restore $bak as $databaseName Database"
New-NAVDatabase -DatabaseServer $databaseServer `
                -DatabaseInstance $databaseInstance `
                -DatabaseName "$databaseName" `
                -FilePath "$databaseFile" `
                -DestinationPath "$databaseFolder" `
                -Timeout $SqlTimeout | Out-Null

Write-Host "Deliting Database Backup"
Remove-Item $bak

Write-Host "Done."