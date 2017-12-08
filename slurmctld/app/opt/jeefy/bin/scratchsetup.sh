#!/bin/bash

mkdir -p /scratch/

su -c 'touch /scratch/test_slurm' slurm
if [ $? -eq 1 ];then
   chmod 777 /scratch/
fi
su -c 'touch /scratch/test_games' games
if [ $? -eq 1 ];then
   exit 1
fi
su -c 'touch /scratch/test_backup' backup
if [ $? -eq 1 ];then
   exit 1
fi
rm -rf /scratch/*
