cd Platform

terraform apply -auto-approve
sudo chmod 666 llave
rm -f llave
terraform output | awk '/\-{4,}/,/<np>/' | head -n 52 > llave
sudo chmod 400 llave

# Setting up environment variables
source env.sh

# Preparing the containers
cd ..
docker login

docker-compose build
docker-compose push

cd configuration

echo [master] > inventory.yml
echo "master@$ip     ansible_ssh_private_key_file=~/Microservices_Housing/Platform/llave ">> inventory.yml

echo [workers] > master_conf/inventory.yml
echo "worker@$worker1       ansible_ssh_private_key_file=~/config/llave" >> master_conf/inventory.yml
echo "worker@$worker2       ansible_ssh_private_key_file=~/config/llave" >> master_conf/inventory.yml
echo "worker@$worker3       ansible_ssh_private_key_file=~/config/llave" >> master_conf/inventory.yml

ansible-playbook -i inventory.yml playbook.yml