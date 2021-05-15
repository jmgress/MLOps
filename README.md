# MLOps

## Local Machine Prep
- Installed git for Windows
- Installed Terraform binary in C:\Windows
- Installed Visual Studio code with a few items from the market place
    - HashiCorp Terraform
    - Markdown All in One
    - Remote WSL
    - Python extension for Visual Studio Code
- Installed Python 3.9.4

- Command to install py into the python container

## Running 
- Put Terraform in your path
- Run setyp.ps1 using PowerShell

Note: 
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

Adding command to copy python module to container
docker @("cp", "createModel.py", "$(docker ps --quiet --filter "name=python"):/createModel.py")   
