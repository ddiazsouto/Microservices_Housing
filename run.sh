cd Platform

terraform apply -auto-approve

terraform output | awk '/\-{4,}/,/<np>/' | head -n 52 > llave
sudo chmod 400 llave

ip=$(terraform output | grep IP | awk '{print $3}')