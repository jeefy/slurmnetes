#!/bin/bash

cd slurm-base
docker build -t slurm_base .
cd ../slurmd
docker build -t slurmd .
cd ../slurmctld
docker build -t slurmctld .
cd ../sshd
docker build -t sshd .
cd ..
