#!/bin/bash

echo -n "Check if 'slurmd' is running... "
supervisorctl status slurmd|grep RUNNING
EC=$?
if [ ${EC} -ne 0 ];then
    echo "[FAIL]"
else
    echo "[OK]"
fi
exit ${EC}
