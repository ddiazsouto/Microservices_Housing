cd Platform

terraform apply -auto-approve
rm llave
terraform output | awk '/\-{4,}/,/<np>/' | head -n 52 > llave
sudo chmod 400 llave

ip=$(terraform output | grep public_IP_grab | awk '{print $3}')
workers=$(terraform output | grep 10.0 | awk '$2 {print $3}' | uniq)

# First three workers local IP, is better to use variable $workers as it makes its 
# posterior interaction with python more scalable

worker1=$(echo $workers | cut -f1 -d" ")
worker2=$(echo $workers | cut -f2 -d" ")
worker3=$(echo $workers | cut -f3 -d" ")

