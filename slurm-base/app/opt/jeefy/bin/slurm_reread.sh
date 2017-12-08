#!/bin/bash

## check if partition is empty?
sed -i '/\ Nodes=\ /d' /usr/local/etc/slurm.conf
if [ -f /var/run/slurmctld.pid ];then
    kill -HUP $(cat /var/run/slurmctld.pid)
fi
if [ -f /var/run/slurmd.pid ];then
    #kill -HUP $(cat /var/run/slurmd.pid)
    supervisorctl restart slurmd
fi
sleep 5
