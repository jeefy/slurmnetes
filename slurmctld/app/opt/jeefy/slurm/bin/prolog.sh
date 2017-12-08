#!/bin/bash

curl -X PUT -d "${SLURM_JOB_USER}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/user
curl -X PUT -d "${SLURM_JOB_GROUP}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/group
curl -X PUT -d "${SLURM_JOB_GID}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/groupid
curl -X PUT -d "${SLURM_CLUSTER_NAME}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/clustername
curl -X PUT -d "${SLURM_JOB_PARTITION}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/jobpartition
curl -X PUT -d "${SLURM_JOB_UID}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/userid
curl -X PUT -d "$(date +%s)" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/start
curl -X PUT -d "${SLURM_JOB_NODELIST}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/nodelist
curl -X PUT -d "${SLURM_JOB_NAME}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/jobname

sleep 2;
