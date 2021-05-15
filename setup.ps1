terraform destroy -auto-approve
terraform.exe apply -auto-approve

docker @("cp", "createModel.py", "$(docker ps --quiet --filter "name=python"):/createModel.py")
docker @("cp", "requirements.txt", "$(docker ps --quiet --filter "name=python"):/requirements.txt")
echo "start requirements"
docker exec -it pythontf pip install -r requirements.txt
echo "end requirements"
docker exec -it pythontf mkdir intraQuarter
docker exec -it pythontf mkdir intraQuarter/ACN
docker exec -it pythontf python createModel.py

docker @("cp", "createModel.py", "$(docker ps --quiet --filter "name=tensorflow"):/createModel.py")
docker @("cp", "requirements.txt", "$(docker ps --quiet --filter "name=tensorflow"):/requirements.txt")
echo "start requirements tensorflow"
docker exec -it tensorflow pip install -r requirements.txt
echo "end requirements tensorflow"
docker exec -it tensorflow mkdir intraQuarter
docker exec -it tensorflow mkdir intraQuarter/ACN
docker exec -it tensorflow python createModel.py

#docker exec -it pythontf apt update
#docker exec -it pythontf apt upgrade -y
#docker exec -it pythontf apt install -y htop



