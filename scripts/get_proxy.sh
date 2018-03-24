# some magic for the grid certificates
# workaround due to https://github.com/kubernetes/kubernetes/issues/2630
mkdir /home/cmsbld/.globus/
cat /home/cmsbld/globus/userkey > /home/cmsbld/.globus/userkey.pem
cat /home/cmsbld/globus/usercert > /home/cmsbld/.globus/usercert.pem
chmod 400 /home/cmsbld/.globus/userkey.pem
echo ${VOMS_PASS} | voms-proxy-init -voms cms -pwstdin
