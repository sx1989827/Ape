#!/bin/sh
ssh root@123.57.77.6
sudo forever stop 0
exit
scp -r /Users/sunxin/Boss/code/Server root@123.57.77.6:/home
ssh root@123.57.77.6
sudo forever start /home/Server/bin/www
exit


./mongodump -h 127.0.0.1:27017 -d Boss -o /Users/sunxin/backup/
cd ../../
  343  cd ../
  344  ls
  345  cd backup
  346  scp -r Boss root@123.57.77.6:/home/restore
../mongodb/bin/mongorestore -h 127.0.0.1 -d Boss Boss --drop
