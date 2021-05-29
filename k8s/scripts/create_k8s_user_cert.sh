#!/bin/sh

username=$1

openssl genrsa -out ${username}.key 2048
openssl req -new -key ${username}.key -out ${username}.csr -subj "/CN=${username}/O=devops"
openssl x509 -req -in ${username}.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out ${username}.crt -days 1000

# cp /etc/kubernetes/admin.conf ${username}.conf
