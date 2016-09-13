#!/bin/bash


# knox bootstrap



cd $GATEWAY_HOME
sed s/8443/$GATEWAY_PORT/ -i conf/gateway-site.xml 
mkdir -p data/security
echo '#1.0#' > data/security/master
echo $GATEWAY_PASSWORD >> data/security/master
chown -R knox.knox $GATEWAY_HOME
#su knox -c "java -jar $GATEWAY_HOME/bin/ldap.jar $GATEWAY_HOME/conf"
su knox -c "bin/gateway.sh setup"
su knox -c "bin/gateway.sh start"



if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
