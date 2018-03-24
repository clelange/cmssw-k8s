# put grid password into ./secrets/password.txt
kubectl create secret generic voms-proxy-pass --from-file=password=./secrets/password.txt
kubectl create secret generic voms-proxy-cert --from-file=usercert=~/.globus/usercert.pem --from-file=userkey=/Users/clange/.globus/userkey.pem
