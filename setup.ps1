terraform.exe apply -auto-approve

docker @("cp", "createModel.py", "$(docker ps --quiet --filter "name=python"):/createModel.py")

docker exec -it pythontf python creatModel.py

