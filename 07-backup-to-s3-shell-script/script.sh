#!/bin/bash

src="/home/sujith/Ansible"
date=$(date -I)
dest="/tmp/Ansible-$date.tar.gz"

###Compress folder using tar
tar -cvzf "$dest" "$src"


if [ -f "$dest" ] ; then
     aws s3 cp "$dest" s3://test2025f378b44d5290402592060bf82f5a0106
     if [ $? -eq 0 ]; then
       echo "Folder has been upload to s3 successfully "
     fi
else
   echo "Upload has failed , kindly check the script"
fi
