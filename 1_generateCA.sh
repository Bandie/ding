#!/bin/bash
echo "###################"
echo "#  CA generation  #"
echo -e "###################\n"

## CA Private key
echo -n "Where to save your CA key file? ($PWD/CA.key): "
read temp

if [ -n "$temp" ]
then
  save=$temp
else
  save="$PWD/CA.key"
fi
CAkey=$save
openssl genrsa -aes256 -out $save 8192


## CA Certificate
echo -n "Where to save your CA certificate? ($PWD/CA.crt): "
read temp

if [ -n "$temp" ]
then
  save=$temp
else
  save="$PWD/CA.crt"
fi

echo -n "How many days should the certificate be valid? (3650): "
read temp

if [[ $temp =~ ^[0-9]+$ ]]
then
  days=$temp
else
  days=3650
fi
echo -e "\033[01;33mPlease enter some information about the CA.\033[00m"
openssl req -new -x509 -days $days -key $CAkey -out $save


