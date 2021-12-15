ip=$(terraform output | grep public_IP_grab | awk '{print $3}' | tr -d '"' )
workers=$(terraform output | grep 10.0 | awk '$2 {print $3}' | uniq | tr -d '"' )

# First three workers local IP, is better to use variable $workers as it makes its 
# posterior interaction with python more scalable

echo $workers > ../frontend_master/IPs.txt 

worker1=$(echo $workers | cut -f1 -d" ")
worker2=$(echo $workers | cut -f2 -d" ")
worker3=$(echo $workers | cut -f3 -d" ")
