#!/bin/bash

curl -X PUT -d "$(date +%s)" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/end
curl -X PUT -d "${SLURM_JOB_EXIT_CODE2}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/exit_code2
curl -X PUT -d "${SLURM_JOB_DERIVED_EC}" http://consul:8500/v1/kv/slurm/job/${SLURM_JOBID}/derived_ec
