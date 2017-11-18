FROM microsoft/dynamics-nav:2017-cu10-de
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
COPY Custom /Custom/
ENV DatabaseName CustomerDB
RUN PowerShell .\Custom\BuildCustomImage.ps1