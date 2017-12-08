#!/bin/bash


supervisorctl status munged|grep RUNNING
exit $?
