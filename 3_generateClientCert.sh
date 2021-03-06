#!/bin/bash

## Server private key
echo -n "Where to save your client's key file? ($PWD/ding.key): "
read temp

if [ -n "$temp" ]
then
  save=$temp
else
  save="$PWD/ding.key"
fi
key=$save
openssl genrsa -out $save 4096


## CSR
echo -n "Where to save your Certificate Signing Request (CSR)? ($PWD/ding.csr): "
read temp

if [ -n "$temp" ]
then
  save=$temp
else
  save="$PWD/ding.csr"
fi
csr=$save
echo -e "\033[01;33mPlease enter some information. THEY MUST BE DIFFERENT FROM THE CA's AND SERVER's INFORMATION.\033[00m"
openssl req -new -key $key -out $save -sha512


## Signing
echo -n "Path of your CA Certificate? ($PWD/CA.crt): "
read temp

if [ -n "$temp" ]
then
  loadCAcrt=$temp
else
  loadCAcrt="$PWD/CA.crt"
fi

echo -n "Path of your CA key? ($PWD/CA.key): "
read temp

if [ -n "$temp" ]
then
  loadCAkey=$temp
else
  loadCAkey="$PWD/CA.key"
fi

echo -n "Where to save your signed client certificate? ($PWD/ding.crt): "
read temp

if [ -n "$temp" ]
then
  save=$temp
else
  save="$PWD/ding.crt"
fi

echo -n "How many days should the certificate be valid? (365): "
read temp

if [ -n "$temp" ]
then
  t=$temp
else
  t=365
fi
openssl x509 -req -in $csr -CA $loadCAcrt -CAkey $loadCAkey -CAcreateserial -out $save -days $t -sha512
rm $csr
