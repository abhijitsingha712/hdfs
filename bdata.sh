#!/bin/bash

#file1= "/home/jenkinsadmin/data"
clear                                                                                                   && \
echo '==============================================================================================='
echo 'SCRIPT WILL GOING TO START SHORTLY'
echo '==============================================================================================='
echo 'Cleaning up data directory'
echo '=========================================================='
rm -rf /home/jenkinsadmin/data/*                                                                      && \
echo 'Changing directory to data'
echo '=========================================================='
cd /home/jenkinsadmin/data/                                                                             && \
echo '=========================================================='
echo 'Downloading Files'
echo '=========================================================='
for i in `cat /home/jenkinsadmin/linkx`

do
   wget -N $i
done

for j in `ls -lrt /home/jenkinsadmin/data/`

do
  unzip $j && rm -rf /home/jenkinsadmin/data/*.zip
done

echo '=========================================================='
echo 'Sending files to node1'
echo '=========================================================='                                         && \
scp -r /home/jenkinsadmin/data/* jenkinclient.southindia.cloudapp.azure.com:/home/jenkinsadmin/data/

echo '+++++++++++++++++++++++'
echo 'Cleaning url file'
echo '++++++++++++++++++++++'

> /home/jenkinsadmin/linkx
#rm -rf   /home/jenkinsadmin/data/* 

echo ' Bye Bye :) '
