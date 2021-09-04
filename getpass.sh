#!/bin/sh
# using the timestamp to generate password
date_string=$1
pwd_string="${date_string}-I8Love9Frzzdom334"
password0=`echo ${pwd_string} | sha256sum`
#------ we use finite length ------
password=${password0:1:64}
echo $password