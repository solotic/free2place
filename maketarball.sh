#!/bin/sh
### tarball all these files into lzma file. NOTE: exclude .git/ directory!!!
sum=`git rev-parse --short HEAD`
outdir="~/Desktop/"
filename="tarballs-v2-${sum}-$(date +%Y%k%m%s).7z"
outfile=$outdir$filename
timeout=2
date_string="$(date +%Y%k%m%s)"
pwd_string="${date_string}-I8Love9Frzzdom334"
password0=`echo ${pwd_string} | sha256sum`
password=${password0:1:64}
#----------------------------------------------
#rm tarball*.7z

if [ ! -d "tarballs7z" ] 
then
    echo 'create directory tarballs7z \n'
	mkdir tarballs7z
fi

echo -e "creating file: $filename"
7z a -t7z $filename -p$password -mhe -x!.git -x!*.sh -x!tarballs7z -x!guiLogs/* * 


mv $filename  ./tarballs7z

echo "create $filename ok! password is : $password "

read -p "Press any key to exit."
exit 0
