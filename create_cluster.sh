#!/bin/bash
cyclecloud initialize --verify-ssl=false --username=$1 --password=$2

git clone https://github.com/Azure/cyclecloud-slurm.git /tmp/cc-slurm/

cyclecloud import_template -f /tmp/cc-slurm/templates/slurm.txt

cyclecloud create_server Slurm slurm_terra_cluster -p /tmp/parameters.json -P SubnetId=$3 -P Region=$4
