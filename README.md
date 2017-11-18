# Dockerfile to create Customer DB based DEV/Test NAV Images

This GitHub repository provides a Dockerfile and a PowerShell script to create a custom Dynamics NAV Image based on an custom SQL backup.

## How-To

- Clone the repository to your Docker host. 
- Place your SQL backup in the custom\backup directory.
- Set the correct source docker image in the Dockerfile.
- Create the custom image with: `docker build -t sample/custom .`

## Issues

For any issues, please file under this GitHub project on the [Issues section](https://github.com/Microsoft/nav-docker/issues).

## Troubleshooting & Frequently Asked Questions

- Licensing for Microsoft Dynamics NAV: Regardless of where you run it - VM, Docker, physical, cloud, on prem - the licensing model is the same.

